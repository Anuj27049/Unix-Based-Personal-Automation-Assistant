
#!/bin/bash

while true
do
    echo ""
    echo "================================"
    echo "      FILE AND TEXT ANALYZER"
    echo "================================"
    echo "1. Display file contents"
    echo "2. Count lines, words and characters"
    echo "3. Search for a word or pattern"
    echo "4. Display sorted unique lines"
    echo "5. Search and count word occurrences"
    echo "6. Replace text in a file"
    echo "0. Return to main menu"

    read -rp "Enter your choice: " choice

    case "$choice" in

        1)
            read -rp "Enter file path: " file

            if [[ -f "$file" ]]; then
                cat -- "$file"
            else
                echo "File does not exist!"
            fi
            ;;

        2)
            read -rp "Enter file path: " file

            if [[ -f "$file" ]]; then
                echo ""
                echo "Line count:"
                wc -l < "$file"

                echo "Word count:"
                wc -w < "$file"

                echo "Character count:"
                wc -m < "$file"
            else
                echo "File does not exist!"
            fi
            ;;

        3)
            read -rp "Enter file path: " file
            read -rp "Enter search pattern: " pattern

            if [[ -f "$file" ]]; then
                grep -in -- "$pattern" "$file"

                if [[ $? -eq 1 ]]; then
                    echo "No matching lines found."
                fi
            else
                echo "File does not exist!"
            fi
            ;;

        4)
            read -rp "Enter file path: " file

            if [[ -f "$file" ]]; then
                sort -u -- "$file"
            else
                echo "File does not exist!"
            fi
            ;;

        5)
            read -rp "Enter file path: " file
            read -rp "Enter word to search: " word

            if [[ -f "$file" ]]; then
                awk -v word="$word" '
                {
                    for (i = 1; i <= NF; i++) {
                        if (tolower($i) == tolower(word))
                            count++
                    }
                }
                END {
                    print "Occurrences:", count+0
                }' "$file"
            else
                echo "File does not exist!"
            fi
            ;;

        6)
            read -rp "Enter file path: " file
            read -rp "Enter old text: " old
            read -rp "Enter new text: " new

            if [[ -f "$file" && -n "$old" ]]; then
                sed -i "s|$old|$new|g" "$file"
                echo "Replacement operation completed."
            else
                echo "Invalid file or empty search text!"
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

