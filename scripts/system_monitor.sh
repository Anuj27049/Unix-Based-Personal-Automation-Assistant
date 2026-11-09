
#!/bin/bash

while true
do
    echo ""
    echo "================================"
    echo "          SYSTEM MONITOR"
    echo "================================"
    echo "1. Complete system report"
    echo "2. Disk usage"
    echo "3. Memory usage"
    echo "4. Running processes"
    echo "5. System uptime"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1)
            echo ""
            echo "========== SYSTEM REPORT =========="
            echo "Current User : $(whoami)"
            echo "Hostname     : $(hostname)"
            echo "Date         : $(date)"
            echo ""
            echo "----- System Uptime -----"
            uptime
            echo ""
            echo "----- Disk Usage -----"
            df -h
            echo ""
            echo "----- Memory Usage -----"
            free -h
            echo ""
            echo "----- Running Processes -----"
            ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
            ;;

        2)
            echo ""
            echo "========== DISK USAGE =========="
            df -h
            ;;

        3)
            echo ""
            echo "========== MEMORY USAGE =========="
            free -h
            ;;

        4)
            echo ""
            echo "========== RUNNING PROCESSES =========="
            ps -eo pid,ppid,comm,%cpu,%mem --sort=-%cpu | head -n 21
            ;;

        5)
            echo ""
            echo "========== SYSTEM UPTIME =========="
            uptime
            ;;

        0)
            echo "Returning to main menu..."
            break
            ;;

        *)
            echo "Invalid choice!"
            ;;

    esac
done

