# Unix-Based Personal Automation Assistant

A menu-driven command-line application developed using **C programming, Bash scripting and UNIX utilities** to simplify routine system and file-management tasks.

## Project Overview

The Unix-Based Personal Automation Assistant combines file management, backup management, system monitoring, text processing and process management into a single command-line interface.

The main application and process manager are implemented in C, while Bash scripts automate routine UNIX operations.

## Features

1. **Smart File Manager**
   - List, create, copy, move and delete files.
   - Search for files and identify empty or large files.

2. **Backup Manager**
   - Create compressed backups.
   - List and restore backups.
   - Maintain backup history.

3. **System Monitor**
   - Generate system information reports.
   - Monitor disk and memory usage.
   - Display running processes and system uptime.

4. **File and Text Analyzer**
   - Display file contents and count lines, words and characters.
   - Search text, sort unique lines and count word occurrences.
   - Replace text using UNIX text-processing utilities.

5. **Cleanup Utility**
   - Identify empty, temporary and large files.
   - Delete selected files with confirmation.

6. **Process Manager**
   - Display process IDs and running processes.
   - Create child processes using `fork()`.
   - Execute commands using `exec()`.
   - Wait for child processes using `waitpid()`.
   - Demonstrate signal handling.

7. **Activity Logger**
   - Record activities with timestamps.
   - View, search and count activity history.
   - Automatically record module launches.

8. **Automation Scripts**
   - Generate system reports.
   - Organize files by extension.
   - Create automated directory backups.

## Technologies Used

- C Programming
- Bash Shell Scripting
- GCC Compiler
- GNU Make
- UNIX/Linux Commands and Utilities
- UNIX System Calls

## Requirements

- Linux or Ubuntu
- GCC
- GNU Make
- Bash

## Installation and Execution

Clone the repository:

```bash
git clone https://github.com/Anuj27049/Unix-Based-Personal-Automation-Assistant.git
```

Navigate to the project directory:

```bash
cd Unix-Based-Personal-Automation-Assistant
```

Compile the application:

```bash
make
```

Run the application:

```bash
./assistant
```

Remove the compiled executable:

```bash
make clean
```

Generated directories such as `backups/`, `logs/` and `reports/` are created automatically when required.

## Project Structure

```text
UnixAssistant/
├── include/
│   └── assistant.h
├── src/
│   ├── main.c
│   └── process_manager.c
├── scripts/
│   ├── file_manager.sh
│   ├── backup.sh
│   ├── system_monitor.sh
│   ├── search_analyzer.sh
│   ├── cleanup.sh
│   ├── activity_logger.sh
│   └── automation.sh
├── Makefile
├── README.md
└── .gitignore
```

## Team Members

- Chirayu Mudgal
- Bhanu Pratap Singh Dev
- Anuj Kumar Singh
- Pratyaksh Kaushik

## Project Guide

- Dr. Hema Nagaraja
- Dr. Kritika Rohila

## Academic Details

**Course:** Unix Programming Lab (24B15CS214)  
**Institution:** Jaypee Institute of Information Technology, Noida

---

*Developed as part of the Unix Programming Lab project.*
