# Unix-Based Personal Automation Assistant

A menu-driven command-line application developed using C programming, Bash scripting and UNIX utilities.

## Project Overview

The Unix-Based Personal Automation Assistant combines file management, system monitoring, text processing, backup management and process management into a single command-line interface.

The application uses C for the main interface and process management, while Bash scripts automate routine UNIX operations.

## Features

1. **Smart File Manager**
   - List, create, copy, move and delete files.
   - Search for files.
   - Identify empty and large files.

2. **Backup Manager**
   - Create compressed backups.
   - View available backups.
   - Restore files and directories.
   - Maintain backup history.

3. **System Monitor**
   - Generate system information.
   - Monitor disk and memory usage.
   - Display running processes and uptime.

4. **File and Text Analyzer**
   - Display file contents.
   - Count lines, words and characters.
   - Search text using grep.
   - Sort unique lines.
   - Count word occurrences using awk.
   - Replace text using sed.

5. **Cleanup Utility**
   - Identify empty, temporary and large files.
   - Delete selected files with confirmation.

6. **Process Manager**
   - Display process IDs.
   - Create child processes using fork().
   - Execute commands using exec().
   - Wait for child processes using waitpid().
   - Demonstrate signal handling.

7. **Activity Logger**
   - Record activities with timestamps.
   - View and search activity history.
   - Count recorded activities.
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
- UNIX/Linux Commands
- UNIX System Calls

## Project Structure

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

Generated directories such as `backups/`, `logs/` and `reports/` are created automatically when required.

## Requirements

- Linux or Ubuntu
- GCC
- GNU Make
- Bash
- Standard UNIX utilities

## Compilation and Execution

Clone the repository:
git clone <repository-url>
cd UnixAssistant

Compile:
make

Run:
./assistant

Clean the compiled executable:
make clean

## Team Members
- Chirayu Mudgal
- Bhanu Pratap Singh Dev
- Anuj Kumar Singh
- Pratyaksh Kaushik

## Project Guide
Dr. Hema Nagaraja  
Dr. Kritika Rohila

## Academic Project
Unix Programming Lab (24B15CS214)  
Jaypee Institute of Information Technology
