
#!/bin/bash

while true
do
    echo ""
    echo "================================"
    echo "         CLEANUP UTILITY"
    echo "================================"
    echo "1. Find empty files"
    echo "2. Find temporary files"
    echo "3. Find large files"
    echo "4. Delete empty files"
    echo "5. Delete temporary files"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1|2|3|4|5)
            read -rp "Enter directory path: " path

            if [[ ! -d "$path" ]]; then
                echo "Directory does not exist!"
                continue
            fi

            case "$choice" in
                1|4)
                    find "$path" -type f -empty -print
                    ;;

                2|5)
                    find "$path" -type f \( \
                        -name "*.tmp" -o \
                        -name "*.temp" -o \
                        -name "*~" \
                    \) -print
                    ;;

                3)
                    find "$path" -type f -size +10M -exec ls -lh {} \;
                    ;;
            esac

            if [[ "$choice" == "4" || "$choice" == "5" ]]; then
                if [[ "$choice" == "4" ]]; then
                    echo "Preparing to delete empty files..."
                    find "$path" -type f -empty -print0 > /tmp/cleanup_candidates_$$
                else
                    echo "Preparing to delete temporary files..."
                    find "$path" -type f \( \
                        -name "*.tmp" -o \
                        -name "*.temp" -o \
                        -name "*~" \
                    \) -print0 > /tmp/cleanup_candidates_$$
                fi

                if [[ -s /tmp/cleanup_candidates_$$ ]]; then
                    read -rp "Delete these files? (y/n): " confirm

                    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
                        while IFS= read -r -d '' file
                        do
                            rm -i -- "$file"
                        done < /tmp/cleanup_candidates_$$
                    else
                        echo "Deletion cancelled."
                    fi
                else
                    echo "No matching files found."
                fi

                rm -f /tmp/cleanup_candidates_$$
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

