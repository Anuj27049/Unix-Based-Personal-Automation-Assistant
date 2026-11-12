
#ifndef MODULES_HPP
#define MODULES_HPP

#include "automation_module.hpp"

// 1. Smart File Manager
class FileManager : public AutomationModule {
public:
    FileManager();
    void execute() override;
};

// 2. Backup Manager
class BackupManager : public AutomationModule {
public:
    BackupManager();
    void execute() override;
};

// 3. System Monitor
class SystemMonitor : public AutomationModule {
public:
    SystemMonitor();
    void execute() override;
};

// 4. File and Text Analyzer
class TextAnalyzer : public AutomationModule {
public:
    TextAnalyzer();
    void execute() override;
};

// 5. Cleanup Utility
class CleanupUtility : public AutomationModule {
public:
    CleanupUtility();
    void execute() override;
};

// 6. Process Manager
class ProcessManager : public AutomationModule {
public:
    ProcessManager();
    void execute() override;
};

// 7. Activity Logger
class ActivityLogger : public AutomationModule {
public:
    ActivityLogger();
    void execute() override;
};

// 8. Automation Scripts
class AutomationManager : public AutomationModule {
public:
    AutomationManager();
    void execute() override;
};

#endif

