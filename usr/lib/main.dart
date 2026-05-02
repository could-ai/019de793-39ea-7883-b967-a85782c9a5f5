import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'data.dart';

void main() {
  runApp(const DissertationApp());
}

class DissertationApp extends StatelessWidget {
  const DissertationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B.Ed. Dissertation Viewer',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        textTheme: GoogleFonts.loraTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const ReaderScreen(),
    );
  }
}

class ReaderScreen extends StatefulWidget {
  const ReaderScreen({Key? key}) : super(key: key);

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _selectChapter(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (MediaQuery.of(context).size.width < 800) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          isDesktop ? 'B.Ed. Dissertation (Action Research)' : dissertationChapters[_currentIndex].title,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: isDesktop
            ? null
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
      ),
      drawer: isDesktop ? null : _buildDrawer(),
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(right: BorderSide(color: Colors.grey.shade300)),
              ),
              child: _buildDrawerContent(),
            ),
          Expanded(
            child: ChapterContent(chapter: dissertationChapters[_currentIndex]),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: _buildDrawerContent(),
    );
  }

  Widget _buildDrawerContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24.0),
          color: Colors.indigo.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 24),
              Text(
                'Digital Dissertation',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Action Research in Mathematics\nSemester IV - RTMNU',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.indigo.shade700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dissertationChapters.length,
            itemBuilder: (context, index) {
              return ListTile(
                selected: _currentIndex == index,
                selectedTileColor: Colors.indigo.shade50,
                title: Text(
                  dissertationChapters[index].title,
                  style: GoogleFonts.montserrat(
                    fontWeight: _currentIndex == index ? FontWeight.w600 : FontWeight.w400,
                    color: _currentIndex == index ? Colors.indigo.shade700 : Colors.black87,
                  ),
                ),
                onTap: () => _selectChapter(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ChapterContent extends StatelessWidget {
  final Chapter chapter;

  const ChapterContent({Key? key, required this.chapter}) : super(key: key);

  List<Widget> _parseMarkdownLikeContent(String text, BuildContext context) {
    List<Widget> widgets = [];
    final lines = text.split('\\n');
    
    for (var line in lines) {
      if (line.trim().isEmpty) {
        widgets.add(const SizedBox(height: 16));
      } else if (line.startsWith('### ')) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: Text(
            line.substring(4),
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.indigo.shade900,
            ),
          ),
        ));
      } else if (line.startsWith('* **')) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: _buildRichText(line.substring(2), context),
              ),
            ],
          ),
        ));
      } else if (line.startsWith('1. ') || line.startsWith('2. ') || line.startsWith('3. ') || line.startsWith('4. ')) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\${line.substring(0, 3)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Expanded(
                child: _buildRichText(line.substring(3), context),
              ),
            ],
          ),
        ));
      } else {
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _buildRichText(line, context),
        ));
      }
    }
    return widgets;
  }

  Widget _buildRichText(String text, BuildContext context) {
    List<TextSpan> spans = [];
    final boldRegex = RegExp(r'\*\*(.*?)\*\*');
    int start = 0;
    for (final match in boldRegex.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
      ));
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.grey.shade800,
          fontFamily: GoogleFonts.lora().fontFamily,
        ),
        children: spans,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter.title,
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              const SizedBox(height: 32),
              ..._parseMarkdownLikeContent(chapter.content, context),
              if (chapter.hasCharts) ...[
                const SizedBox(height: 48),
                _buildDataAnalysisSection(context),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataAnalysisSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interactive Data Tables & Charts',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade900,
          ),
        ),
        const SizedBox(height: 24),
        _buildScoreTable(),
        const SizedBox(height: 48),
        Text(
          'Fig 1. Comparison of Pre-Test and Post-Test Average Scores',
          style: GoogleFonts.lora(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '\${rod.toY.round()} Marks',
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Padding(padding: EdgeInsets.only(top: 8), child: Text('Pre-Test'));
                        case 1:
                          return const Padding(padding: EdgeInsets.only(top: 8), child: Text('Post-Test'));
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      if (value % 5 == 0) {
                        return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
                      }
                      return const Text('');
                    },
                  ),
                ),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 5 == 0,
                getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.shade300, strokeWidth: 1),
                drawVerticalLine: false,
              ),
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: 6.5,
                      color: Colors.redAccent,
                      width: 40,
                      borderRadius: BorderRadius.circular(4),
                    )
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: 14.2,
                      color: Colors.green,
                      width: 40,
                      borderRadius: BorderRadius.circular(4),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScoreTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Table(
        border: TableBorder.all(color: Colors.grey.shade300, width: 1, borderRadius: BorderRadius.circular(12)),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            children: [
              _tableHeader('Score Range'),
              _tableHeader('Pre-Test Students'),
              _tableHeader('Post-Test Students'),
            ],
          ),
          TableRow(children: [_tableCell('0 - 5'), _tableCell('12 (40%)'), _tableCell('1 (3.3%)')]),
          TableRow(children: [_tableCell('6 - 10'), _tableCell('11 (36.6%)'), _tableCell('4 (13.3%)')]),
          TableRow(children: [_tableCell('11 - 15'), _tableCell('5 (16.6%)'), _tableCell('14 (46.6%)')]),
          TableRow(children: [_tableCell('16 - 20'), _tableCell('2 (6.6%)'), _tableCell('11 (36.6%)')]),
        ],
      ),
    );
  }

  Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.indigo.shade900),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _tableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey.shade800),
        textAlign: TextAlign.center,
      ),
    );
  }
}
