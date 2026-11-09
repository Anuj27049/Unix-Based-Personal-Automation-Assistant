
#!/bin/bash

BACKUP_DIR="backups"

mkdir -p "$BACKUP_DIR"

while true
do
    echo ""
    echo "================================"
    echo "         BACKUP MANAGER"
    echo "================================"
    echo "1. Create a backup"
    echo "2. List available backups"
    echo "3. Restore a backup"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1)
            read -rp "Enter file/directory path to backup: " source

            if [[ -e "$source" ]]; then
                timestamp=$(date +"%Y%m%d_%H%M%S")
                name=$(basename "$source")

                backup_name="${name}_${timestamp}.tar.gz"

                tar -czf "$BACKUP_DIR/$backup_name" -C "$(dirname "$source")" "$name"

                if [[ $? -eq 0 ]]; then
                    echo "Backup created successfully: $backup_name"
                    echo "$(date) | $source | $backup_name" >> "$BACKUP_DIR/history.txt"
                else
                    echo "Backup creation failed!"
                fi
            else
                echo "Source does not exist!"
            fi
            ;;

        2)
            echo ""
            echo "Available backups:"

            if compgen -G "$BACKUP_DIR/*.tar.gz" > /dev/null; then
                ls -lh "$BACKUP_DIR"/*.tar.gz
            else
                echo "No backups available."
            fi
            ;;

        3)
            read -rp "Enter backup filename: " backup_name

            if [[ -f "$BACKUP_DIR/$backup_name" && "$backup_name" == *.tar.gz ]]; then
                read -rp "Enter restoration directory: " destination

                mkdir -p "$destination"

                tar -xzf "$BACKUP_DIR/$backup_name" -C "$destination"

                if [[ $? -eq 0 ]]; then
                    echo "Backup restored successfully."
                else
                    echo "Restoration failed!"
                fi
            else
                echo "Backup not found!"
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

