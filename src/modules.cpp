
#include "modules.hpp"
#include "assistant.h"

#include <iostream>
#include <cstdlib>
#include <sys/wait.h>
using namespace std;

// Base class constructor
AutomationModule::AutomationModule(const string& name,
                                   const string& desc)
    : moduleName(name), description(desc) {}

// Display module information
void AutomationModule::displayInfo() const {
    cout << "\n================================\n";
    cout << moduleName << "\n";
    cout << description << "\n";
    cout << "================================\n";
}

const string& AutomationModule::getName() const {
    return moduleName;
}

// Execute an existing Bash script
bool AutomationModule::runScript(const string& scriptPath) {

    string command = "bash " + scriptPath;

    int result = system(command.c_str());

    if (result == -1) {
        cerr << "\nError: Unable to execute script.\n";
        return false;
    }

    if (WIFEXITED(result) && WEXITSTATUS(result) == 0) {
        return true;
    }

    cerr << "\nError: Script execution failed: "
         << scriptPath << endl;

    return false;
}

// 1. Smart File Manager
FileManager::FileManager()
    : AutomationModule("Smart File Manager",
                       "Manage files and directories") {}

void FileManager::execute() {
    runScript("scripts/file_manager.sh");
}

// 2. Backup Manager
BackupManager::BackupManager()
    : AutomationModule("Backup Manager",
                       "Create and restore backups") {}

void BackupManager::execute() {
    runScript("scripts/backup.sh");
}

// 3. System Monitor
SystemMonitor::SystemMonitor()
    : AutomationModule("System Monitor",
                       "View system information") {}

void SystemMonitor::execute() {
    runScript("scripts/system_monitor.sh");
}

// 4. File and Text Analyzer
TextAnalyzer::TextAnalyzer()
    : AutomationModule("File and Text Analyzer",
                       "Search and analyze text files") {}

void TextAnalyzer::execute() {
    runScript("scripts/search_analyzer.sh");
}

// 5. Cleanup Utility
CleanupUtility::CleanupUtility()
    : AutomationModule("Cleanup Utility",
                       "Identify and remove unnecessary files") {}

void CleanupUtility::execute() {
    runScript("scripts/cleanup.sh");
}

// 6. Process Manager
ProcessManager::ProcessManager()
    : AutomationModule("Process Manager",
                       "Manage and monitor processes") {}

void ProcessManager::execute() {
    process_manager();
}

// 7. Activity Logger
ActivityLogger::ActivityLogger()
    : AutomationModule("Activity Logger",
                       "View and manage activity logs") {}

void ActivityLogger::execute() {
    runScript("scripts/activity_logger.sh");
}

// 8. Automation Scripts
AutomationManager::AutomationManager()
    : AutomationModule("Automation Scripts",
                       "Perform automated system tasks") {}

void AutomationManager::execute() {
    runScript("scripts/automation.sh");
}

