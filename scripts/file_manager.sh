
#!/bin/bash

while true
do
    echo ""
    echo "================================"
    echo "       SMART FILE MANAGER"
    echo "================================"
    echo "1. List files and directories"
    echo "2. Create a file"
    echo "3. Create a directory"
    echo "4. Copy a file"
    echo "5. Move or rename a file"
    echo "6. Delete a file"
    echo "7. Search for a file"
    echo "8. Find empty files"
    echo "9. Find large files"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1)
            read -rp "Enter directory path (use . for current): " path
            if [[ -d "$path" ]]; then
                ls -lah "$path"
            else
                echo "Directory does not exist!"
            fi
            ;;

        2)
            read -rp "Enter file name: " file
            if [[ -e "$file" ]]; then
                echo "File already exists!"
            else
                touch "$file" && echo "File created successfully."
            fi
            ;;

        3)
            read -rp "Enter directory name: " dir
            if [[ -d "$dir" ]]; then
                echo "Directory already exists!"
            else
                mkdir -p "$dir" && echo "Directory created successfully."
            fi
            ;;

        4)
            read -rp "Enter source file: " source
            read -rp "Enter destination path: " destination

            if [[ -f "$source" ]]; then
                cp -i -- "$source" "$destination" &&
                    echo "File copied successfully."
            else
                echo "Source file does not exist!"
            fi
            ;;

        5)
            read -rp "Enter source path: " source
            read -rp "Enter destination path: " destination

            if [[ -e "$source" ]]; then
                mv -i -- "$source" "$destination" &&
                    echo "File moved/renamed successfully."
            else
                echo "Source does not exist!"
            fi
            ;;

        6)
            read -rp "Enter file name to delete: " file

            if [[ -f "$file" ]]; then
                read -rp "Are you sure? (y/n): " confirm

                if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
                    rm -i -- "$file"
                else
                    echo "Deletion cancelled."
                fi
            else
                echo "File does not exist!"
            fi
            ;;

        7)
            read -rp "Enter directory to search in: " path
            read -rp "Enter file name: " filename

            if [[ -d "$path" ]]; then
                find "$path" -type f -name "$filename"
            else
                echo "Directory does not exist!"
            fi
            ;;

        8)
            read -rp "Enter directory path: " path

            if [[ -d "$path" ]]; then
                find "$path" -type f -empty
            else
                echo "Directory does not exist!"
            fi
            ;;

        9)
            read -rp "Enter directory path: " path

            if [[ -d "$path" ]]; then
                find "$path" -type f -size +10M -exec ls -lh {} \;
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

