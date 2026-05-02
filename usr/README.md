# Digital Dissertation Viewer

This project is an interactive, beautifully formatted digital reading application designed to present a comprehensive B.Ed. Semester IV dissertation as per the Rashtrasant Tukadoji Maharaj Nagpur University (RTMNU) format.

## Project Overview

The application displays an academic action research study titled:
**“A Study of Difficulties and Errors in Learning Fractions in Mathematics among Class VIII Students of Gajanan School with Remedial Measures”**

Instead of merely providing a static document, this project leverages Flutter to create an immersive "Digital Dissertation Viewer." It features a multi-chapter navigation sidebar, beautiful typography, embedded interactive data tables, and an animated bar graph comparing the Pre-Test and Post-Test scores of the students. 

For standard printing and submission, the raw academic text is available in `DISSERTATION.md`. I have also included a `DISSERTATION.html` file—simply right-click this file and select **Open with Microsoft Word** to have it instantly converted into a fully formatted Word document with all tables and headings intact.

## Features

*   **Interactive Chapter Navigation:** A responsive sidebar (drawer on mobile) to seamlessly switch between the five chapters.
*   **Rich Text Rendering:** Elegantly styled academic text formatting.
*   **Data Visualization:** Interactive bar graphs powered by `fl_chart` to visualize educational research data.
*   **Printable Output:** The full action research text is available in `DISSERTATION.md` and a Word-ready `DISSERTATION.html`.

## Tech Stack

*   **Framework:** Flutter (Web, iOS, Android, macOS, Windows, Linux)
*   **Typography:** `google_fonts` (Lora for reading, Montserrat for headings)
*   **Charts:** `fl_chart` for the animated Pre-Test vs Post-Test bar graph

## Setup & Run Instructions

To run this application locally:

1.  Ensure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.
2.  Clone this repository.
3.  Fetch the dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the application on your preferred device (e.g., Chrome, iOS Simulator, or macOS Desktop):
    ```bash
    flutter run -d chrome
    ```

## About CouldAI

This app was generated with [CouldAI](https://could.ai), an AI app builder for cross-platform apps that turns prompts into real native iOS, Android, Web, and Desktop apps with autonomous AI agents that architect, build, test, deploy, and iterate production-ready applications.
