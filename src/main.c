#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "assistant.h"


void log_activity(const char *activity)
{
    system("mkdir -p logs");

    FILE *log = fopen("logs/activity.log", "a");

    if (log == NULL)
    {
        perror("Unable to open activity log");
        return;
    }

    time_t now = time(NULL);
    struct tm *local_time = localtime(&now);

    char timestamp[30];

    strftime(timestamp, sizeof(timestamp),
             "%Y-%m-%d %H:%M:%S", local_time);

    fprintf(log, "%s | %s\n", timestamp, activity);

    fclose(log);
}

int main()
{
    int choice;

    do
    {
        printf("\n====================================\n");
        printf("     UNIX PERSONAL AUTOMATION ASSISTANT\n");
        printf("====================================\n");

        printf("1. Smart File Manager\n");
        printf("2. Backup Manager\n");
        printf("3. System Monitor\n");
        printf("4. File and Text Analyzer\n");
        printf("5. Cleanup Utility\n");
        printf("6. Process Manager\n");
        printf("7. Activity Logger\n");
        printf("8. Automation Scripts\n");
        printf("0. Exit\n");

        printf("\nEnter your choice: ");

        if (scanf("%d", &choice) != 1)
        {
           printf("\nInvalid input! Please enter a number.\n");

            while (getchar() != '\n');

            choice = -1;
            continue;
        }
        switch (choice)
        {
            case 0:
                printf("\nExiting Assistant. Goodbye!\n");
                break;

            case 1:
log_activity("Smart File Manager launched");                
printf("\nLaunching Smart File Manager...\n");
                system("bash scripts/file_manager.sh");
                break;
case 2
:
log_activity("Backup Manager launched");    
printf("\nLaunching Backup Manager...\n");
    system("bash scripts/backup.sh");
    break;
case 3:
log_activity("System Monitor launched");
    printf("\nLaunching System Monitor...\n");
    system("bash scripts/system_monitor.sh");
    break;
case 4:
log_activity("File and Text Analyzer launched launched");
    printf("\nLaunching File and Text Analyzer...\n");
    system("bash scripts/search_analyzer.sh");
    break;
case 5:
log_activity("Cleanup Utility launched");
    printf("\nLaunching Cleanup Utility...\n");
    system("bash scripts/cleanup.sh");
    break;
case 6:
log_activity("Process Manager launched");
    printf("\nLaunching Process Manager...\n");
    process_manager();
    break;            

case 7:
log_activity("Activity Logger launched");
    printf("\nLaunching Activity Logger...\n");
    system("bash scripts/activity_logger.sh");
    break;
case 8:
log_activity("Automation Scripts launched");
    printf("\nLaunching Automation Scripts...\n");
    system("bash scripts/automation.sh");
    break;
            default:
                printf("\nInvalid choice! Please try again.\n");
        }

    } while (choice != 0);

    return 0;
}









































