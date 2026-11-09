
#!/bin/bash

while true
do
    echo ""
    echo "================================"
    echo "       AUTOMATION SCRIPTS"
    echo "================================"
    echo "1. Generate system report"
    echo "2. Organize files by extension"
    echo "3. Backup a directory"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1)
            mkdir -p reports
            report="reports/system_report_$(date +%Y%m%d_%H%M%S).txt"

            {
                echo "========== SYSTEM REPORT =========="
                echo "Generated: $(date)"
                echo "User: $(whoami)"
                echo "Hostname: $(hostname)"
                echo ""
                echo "========== UPTIME =========="
                uptime
                echo ""
                echo "========== DISK USAGE =========="
                df -h
                echo ""
                echo "========== MEMORY USAGE =========="
                free -h
                echo ""
                echo "========== TOP PROCESSES =========="
                ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
            } > "$report"

            echo "System report generated: $report"
            ;;

        2)
            read -rp "Enter directory path: " path

            if [[ -d "$path" ]]; then
                find "$path" -maxdepth 1 -type f ! -name ".*" |
                while IFS= read -r file
                do
                    extension="${file##*.}"

                    if [[ "$file" == "$path/"* && "$file" == *.* ]]; then
                        mkdir -p "$path/$extension"
                        mv -i -- "$file" "$path/$extension/"
                    fi
                done

                echo "File organization completed."
            else
                echo "Directory does not exist!"
            fi
            ;;

        3)
            read -rp "Enter directory to backup: " source

            if [[ -d "$source" ]]; then
                mkdir -p backups

                timestamp=$(date +%Y%m%d_%H%M%S)
                name=$(basename "$source")
                archive="${name}_auto_${timestamp}.tar.gz"

                tar -czf "backups/$archive" \
                    -C "$(dirname "$source")" "$name"

                if [[ $? -eq 0 ]]; then
                    echo "Automated backup created: $archive"
                else
                    echo "Backup failed!"
                fi
            else
                echo "Directory does not exist!"
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

