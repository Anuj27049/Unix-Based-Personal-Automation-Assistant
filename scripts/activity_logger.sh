
#!/bin/bash

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/activity.log"

mkdir -p "$LOG_DIR"

while true
do
    echo ""
    echo "================================"
    echo "         ACTIVITY LOGGER"
    echo "================================"
    echo "1. Record an activity"
    echo "2. View activity history"
    echo "3. Search activity history"
    echo "4. Count recorded activities"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1)
            read -rp "Enter activity description: " activity

            if [[ -n "$activity" ]]; then
                echo "$(date '+%Y-%m-%d %H:%M:%S') | $activity" >> "$LOG_FILE"
                echo "Activity recorded successfully."
            else
                echo "Activity cannot be empty!"
            fi
            ;;

        2)
            echo ""
            echo "========== ACTIVITY HISTORY =========="

            if [[ -f "$LOG_FILE" ]]; then
                cat "$LOG_FILE"
            else
                echo "No activities recorded yet."
            fi
            ;;

        3)
            read -rp "Enter keyword to search: " keyword

            if [[ -f "$LOG_FILE" ]]; then
                grep -in -- "$keyword" "$LOG_FILE"
            else
                echo "No activity history available."
            fi
            ;;

        4)
            echo ""
            if [[ -f "$LOG_FILE" ]]; then
                echo "Total activities: $(wc -l < "$LOG_FILE")"
            else
                echo "Total activities: 0"
            fi
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

