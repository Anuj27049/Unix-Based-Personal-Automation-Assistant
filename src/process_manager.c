
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include "assistant.h"
void handle_signal(int sig)
{
    printf("\nSignal received: %d\n", sig);
}
void execute_command(char *command, char *arg)
{
    pid_t pid = fork();

    if (pid < 0)
    {
        perror("fork failed");
        return;
    }

    if (pid == 0)
    {
        printf("\nChild Process ID: %d\n", getpid());

        execlp(command, command, arg, (char *)NULL);

        perror("exec failed");
        exit(EXIT_FAILURE);
    }
    else
    {
        int status;

        printf("Parent Process ID: %d\n", getpid());
        printf("Waiting for child process...\n");

        waitpid(pid, &status, 0);

        if (WIFEXITED(status))
            printf("\nChild exited with status: %d\n",
                   WEXITSTATUS(status));
        else
            printf("\nChild terminated abnormally.\n");
    }
}

void process_manager(void)
{
    int choice;

    do
    {
        printf("\n================================\n");
        printf("          PROCESS MANAGER\n");
        printf("================================\n");
        printf("1. Display current process ID\n");
        printf("2. Display running processes\n");
        printf("3. Display disk usage\n");
        printf("4. Display system date\n");
printf("5. Demonstrate signal handling\n");
        printf("0. Return to main menu\n");

        printf("\nEnter your choice: ");

        if (scanf("%d", &choice) != 1)
        {
            printf("Invalid input!\n");

            while (getchar() != '\n');

            choice = -1;
            continue;
        }

        switch (choice)
        {
            case 1:
                printf("\nCurrent Process ID: %d\n", getpid());
                printf("Parent Process ID: %d\n", getppid());
                break;

            case 2:
                execute_command("ps", "-ef");
                break;

            case 3:
                execute_command("df", "-h");
                break;

            case 4:
                execute_command("date", NULL);
                break;
case 5:
    signal(SIGUSR1, handle_signal);

    printf("\nRaising SIGUSR1...\n");
    raise(SIGUSR1);

    printf("Signal handling completed.\n");
    break;
            case 0:
                printf("Returning to main menu...\n");
                break;

            default:
                printf("Invalid choice!\n");
        }

    } while (choice != 0);
}

