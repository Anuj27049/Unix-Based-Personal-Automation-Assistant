# Unix-Based Personal Automation Assistant

A menu-driven command-line application that integrates C++, C programming and Bash scripting to simplify routine UNIX/Linux system operations.

The project combines multiple system utilities into a single interface, providing file management, backup operations, system monitoring, text analysis, process management and task automation.

## Features

The application provides the following modules:

1. **Smart File Manager** – Create, copy, move, delete and search files and directories.
2. **Backup Manager** – Create compressed backups, list existing backups, restore files and view backup history.
3. **System Monitor** – Display system information such as the current user, hostname, uptime, disk usage, memory usage and running processes.
4. **File and Text Analyzer** – Search, count, sort and modify text using UNIX utilities.
5. **Cleanup Utility** – Identify empty, temporary and large files and remove selected unnecessary files.
6. **Process Manager** – Demonstrate process creation, execution, synchronization and signal handling.
7. **Activity Logger** – Record, view, search and count timestamped activity entries.
8. **Automation Scripts** – Generate system reports, organize files by extension and automate directory backups.

## Technologies Used

- **C++** – Main application, module management and object-oriented programming.
- **C** – UNIX process management using system calls.
- **Bash Scripting** – File operations, system utilities and task automation.
- **UNIX/Linux Commands** – File handling, text processing and system monitoring.
- **GCC and G++** – Compilation.
- **GNU Make** – Build automation.
- **Git and GitHub** – Version control and collaboration.

## Object-Oriented Design

The application uses an abstract base class named `AutomationModule` and eight derived classes representing the individual modules.

The design demonstrates:

- Classes and Objects
- Encapsulation
- Abstraction
- Inheritance
- Runtime Polymorphism

A common virtual `execute()` interface allows the main application to invoke different module implementations through base-class pointers.

Existing Bash scripts are reused for their respective operations, while the original C-based Process Manager is integrated into the C++ application.

## Project Structure

```text
UnixAssistant/
│
├── include/
│   ├── assistant.h
│   ├── automation_module.hpp
│   └── modules.hpp
│
├── src/
│   ├── main.cpp
│   ├── modules.cpp
│   └── process_manager.c
│
├── scripts/
│   ├── file_manager.sh
│   ├── backup.sh
│   ├── system_monitor.sh
│   ├── search_analyzer.sh
│   ├── cleanup.sh
│   ├── activity_logger.sh
│   └── automation.sh
│
├── Makefile
├── README.md
└── .gitignore
```

## Requirements

- Linux/Ubuntu environment
- GCC and G++ compilers
- GNU Make
- Bash shell
- Standard UNIX utilities

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

To remove compiled files:

```bash
make clean
```

Runtime directories such as `logs/`, `backups/` and `reports/` are created automatically when required.

## Team Members

| Name | Enrolment Number |
|---|---|
| Chirayu Mudgal | 2501030036 |
| Bhanu Pratap Singh Dev | 2501030037 |
| Anuj Kumar Singh | 2501030044 |
| Pratyaksh Kaushik | 992501030343 |

## Academic Information

**Course:** Unix Programming Lab (24B15CS214)  
**Program:** B.Tech Computer Science and Engineering  
**Institution:** Jaypee Institute of Information Technology, Noida

**Project Guides:** Dr. Hema Nagaraja and Dr. Kritika Rohila
