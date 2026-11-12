
#include "modules.hpp"

#include <iostream>
#include <vector>
#include <memory>
#include <fstream>
#include <ctime>
#include <limits>
#include <cstdlib>

using namespace std;

// Record module activity with timestamp
void logActivity(const string& activity) {

    system("mkdir -p logs");

    ofstream log("logs/activity.log", ios::app);

    if (!log.is_open()) {
        cerr << "Warning: Unable to open activity log.\n";
        return;
    }

    time_t now = time(nullptr);
    tm* localTime = localtime(&now);

    char timestamp[30];

    if (localTime != nullptr) {
        strftime(timestamp, sizeof(timestamp),
                 "%Y-%m-%d %H:%M:%S", localTime);

        log << timestamp << " | " << activity << '\n';
    }
}

// Display the main application menu
void displayMenu() {

    cout << "\n";
    cout << "============================================\n";
    cout << "       UNIX PERSONAL AUTOMATION ASSISTANT   \n";
    cout << "============================================\n";

    cout << "  1. Smart File Manager\n";
    cout << "  2. Backup Manager\n";
    cout << "  3. System Monitor\n";
    cout << "  4. File and Text Analyzer\n";
    cout << "  5. Cleanup Utility\n";
    cout << "  6. Process Manager\n";
    cout << "  7. Activity Logger\n";
    cout << "  8. Automation Scripts\n";

    cout << "--------------------------------------------\n";
    cout << "  0. Exit\n";
    cout << "============================================\n";

    cout << "Enter your choice: ";
}

int main() {

    // Create objects of all eight modules
    vector<unique_ptr<AutomationModule>> modules;

    modules.push_back(make_unique<FileManager>());
    modules.push_back(make_unique<BackupManager>());
    modules.push_back(make_unique<SystemMonitor>());
    modules.push_back(make_unique<TextAnalyzer>());
    modules.push_back(make_unique<CleanupUtility>());
    modules.push_back(make_unique<ProcessManager>());
    modules.push_back(make_unique<ActivityLogger>());
    modules.push_back(make_unique<AutomationManager>());

    int choice;

    do {

        displayMenu();

        if (!(cin >> choice)) {

            cout << "\nInvalid input! Please enter a number.\n";

            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');

            continue;
        }

        // Remove the newline before launching another module
        cin.ignore(numeric_limits<streamsize>::max(), '\n');

        if (choice == 0) {
            cout << "\nExiting Assistant. Goodbye!\n";
            logActivity("Assistant exited");
            break;
        }

        if (choice < 1 || choice > static_cast<int>(modules.size())) {
            cout << "\nInvalid choice! Please try again.\n";
            continue;
        }

        // Runtime polymorphism:
        // The appropriate derived class execute() is called.
        AutomationModule* selectedModule = modules[choice - 1].get();

        selectedModule->displayInfo();

        logActivity(selectedModule->getName() + " launched");        

        selectedModule->execute();

        cout << "\nReturning to main menu...\n";

    } while (true);

    return 0;
}

