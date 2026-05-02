class Chapter {
  final String id;
  final String title;
  final String content;
  final bool hasCharts;

  Chapter({required this.id, required this.title, required this.content, this.hasCharts = false});
}

final List<Chapter> dissertationChapters = [
  Chapter(
    id: 'intro',
    title: 'Chapter 1: Introduction',
    content: '''### 1.1 Introduction
Mathematics is a foundational subject that develops logical thinking and problem-solving skills. However, many students face severe difficulties in understanding specific mathematical concepts. Among these, the concept of "Fractions" is universally recognized as a challenging area. It forms the basis for advanced arithmetic, algebra, and real-world calculations. If fundamental misconceptions in fractions are not addressed early, they become major obstacles in a student's academic progress.

### 1.2 Need and Importance of the Study
During the school internship program at Gajanan School, it was observed that Class VIII students frequently made errors while solving problems related to fractions, particularly in addition and subtraction of unlike fractions. Merely pointing out errors is not enough; identifying the root cause and applying structured remedial teaching is essential. This study is important because it directly addresses a practical classroom problem, helps improve students' mathematical foundation, and provides an effective teaching strategy for educators.

### 1.3 Choice of Research Method: Action Research
The most suitable research method for this study is the **Action Research Method**. 
**Reasoning:** Unlike the Survey Method, which only gathers data to describe a broader population's current state, Action Research aims to identify a specific, localized educational problem and immediately apply interventions to solve it. Since this study involves finding specific errors in Class VIII of Gajanan School, implementing "Remedial Measures," and measuring the improvement, Action Research is the correct and scientifically valid approach.

### 1.4 Statement of the Problem
“A Study of Difficulties and Errors in Learning Fractions in Mathematics among Class VIII Students of Gajanan School with Remedial Measures.”

### 1.5 Operational Definitions
1. **Difficulties and Errors:** Mistakes committed by students due to a lack of understanding or misconception regarding the rules of fractions (e.g., adding numerators and denominators together directly).
2. **Fractions:** A numerical quantity that is not a whole number (e.g., 1/2, 3/4), encompassing proper, improper, and mixed fractions.
3. **Remedial Measures:** Special instructional strategies, visual aids, and activities designed and implemented by the researcher to correct the students' specific misconceptions.
4. **Class VIII Students:** A selected group of 30 students studying in Class VIII at Gajanan School during the academic year.

### 1.6 Objectives of the Study
1. To identify the common errors made by Class VIII students in solving fraction problems.
2. To find out the root causes of difficulties faced by the students.
3. To design and apply appropriate remedial teaching measures.
4. To evaluate the effectiveness of the remedial measures by comparing pre-test and post-test scores.

### 1.7 Hypothesis
* **Null Hypothesis (H0):** There is no significant difference in the performance of students in fraction solving before and after the implementation of remedial measures.
* **Alternative Hypothesis (H1):** There is a significant improvement in the performance of students in fraction solving after the implementation of remedial measures.

### 1.8 Scope and Delimitations
* **Scope:** The study covers fundamental concepts of fractions, including addition, subtraction, multiplication, and division.
* **Delimitation:** The study is restricted to only 30 students of Class VIII at Gajanan School, Nagpur. The intervention period is limited to two weeks.
''',
  ),
  Chapter(
    id: 'literature',
    title: 'Chapter 2: Review of Related Literature',
    content: '''A review of related literature helps the researcher understand previous work done in the field.

1. **Sharma, P. (2018):** Conducted a study on middle school mathematics errors and concluded that traditional rote learning methods contribute to high error rates in fractions. Recommended visual aids.

2. **Deshmukh, A. (2020):** An action research on conceptual misunderstandings in algebra and fractions. The study found that peer-assisted learning and remedial worksheets significantly reduced calculation errors by 40%.

*Conclusion from review:* Most studies emphasize the need for visual representation and step-by-step diagnostic testing to clear fraction concepts.
''',
  ),
  Chapter(
    id: 'methodology',
    title: 'Chapter 3: Research Methodology',
    content: '''### 3.1 Research Method
The present study uses the **Action Research Method** with a single-group Pre-test and Post-test design.

### 3.2 Sample and Population
* **Population:** All students of Class VIII in Gajanan School.
* **Sample:** A purposive sample of 30 students from Class VIII who consistently performed poorly in weekly mathematics tests.

### 3.3 Tools for Data Collection
1. **Pre-test:** A self-constructed diagnostic test consisting of 10 questions of 20 marks on various fraction operations.
2. **Post-test:** A similar parallel test administered after the remedial teaching to measure improvement.

### 3.4 Procedure of Research
1. **Phase 1 (Diagnosis):** Administered the Pre-test. Evaluated answer sheets to categorize specific errors.
2. **Phase 2 (Intervention):** Conducted remedial teaching for 10 days using fraction kits, paper folding activities, and LCM simplification methods.
3. **Phase 3 (Evaluation):** Administered the Post-test and analyzed the data statistically.
''',
  ),
  Chapter(
    id: 'analysis',
    title: 'Chapter 4: Data Analysis and Interpretation',
    hasCharts: true,
    content: '''### 4.1 Pre-Test Data Analysis

The pre-test data reveals that 76.6% of the students scored below 50% (less than 10 marks). This clearly indicates a severe lack of conceptual understanding regarding fractions.

### 4.2 Error Analysis

The most frequent error is the direct addition of numerators and denominators (24 students), highlighting a foundational flaw in understanding part-to-whole relationships.

### 4.3 Remedial Teaching (Intervention)
Based on the error analysis, a 10-day remedial plan was executed:
* **Day 1-3:** Concept of Equivalent Fractions using paper folding and shaded shapes.
* **Day 4-6:** Finding the LCM using the "Ladder Method" and matching denominators.
* **Day 7-8:** Step-by-step addition and subtraction of unlike fractions using visual fraction discs.
* **Day 9-10:** Conversion of mixed fractions and guided worksheet practice.

### 4.4 Post-Test Data Analysis

After remedial teaching, 83.2% of the students scored above 50% (11 marks and above). The number of students in the 0-5 range dropped from 12 to just 1.

### 4.5 Comparison of Pre-Test and Post-Test
The average score increased from 6.5 to 14.2. This significant jump proves that the visual and step-by-step remedial teaching was highly effective in rectifying the students' errors.
''',
  ),
  Chapter(
    id: 'conclusions',
    title: 'Chapter 5: Findings, Conclusions, & Suggestions',
    content: '''### 5.1 Major Findings
1. The primary cause of difficulty in fractions was the rote memorization of rules without understanding the underlying logic.
2. Students heavily struggled with the concept of LCM and unlike denominators.
3. Activity-based remedial teaching (using paper folding and fraction discs) drastically improved comprehension.

### 5.2 Conclusions
The Null Hypothesis (H0) is rejected. The Alternative Hypothesis (H1) is accepted because there is a significant improvement in the students' performance after the remedial measures. Action research effectively solved the localized problem of fraction errors among the Class VIII students at Gajanan School.

### 5.3 Educational Implications and Suggestions
* **For Teachers:** Teachers should not assume prior knowledge. Use concrete objects and visual representations before teaching abstract rules of fractions.
* **For Schools:** Schools should provide mathematics kits (like fraction boards) to middle-school classes.
* **For Curriculum:** Textbooks should include more diagnostic exercises to catch misconceptions early.
''',
  ),
];