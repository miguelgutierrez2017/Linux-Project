#!/bin/bash
# League of Legends - Champion Database

# Clear Screen
reset

# Show Menu
print_menu(){
        echo "1. Search"
        echo "2. Add"
        echo "3. Delete"
        echo "4. Modify"
        echo "5. List"
        echo "6. Exit"
}
# Search Function
search_champion(){
        #Read the search keywords frdom the file
        read -p "Enter keyword to search: " keyword

                # Search string from champions.dat
                grep -i "$keyword" ~/project/champions.dat
}
# Shows the lol database
champion_record(){
        exec 3<~/project/champions.dat
        cat <&3 | while read line
do
        echo $line
done
}
# Adds champions into champions.dat
add_champion(){
        while
                read -p "Please Enter Name of Champion --> " name
                [[ -z $name || $name == *[^a-zA-Z\ ]* ]] #checks if string contains letters and a space
        do true
        done

        while
                read -p "Please Enter the Race of the Champion --> " race
                 [[ -z $race || $race == *[^a-zA-Z\ ]* ]] #checks if string contains letters and a space
        do true
        done

        while
                read -p "Please Enter Champion Place of Origin --> " origin
                 [[ -z $origin || $origin == *[^a-zA-Z\ ]* ]] #checks if string contains letters and a space
         do true
         done

         echo "Input added to champions.dat ..."
         echo "Name: $name   Race: $race   Origin: $origin" >> champions.dat
#prints champion database
champion_record
}
# Delete Champion
delete_champion(){
        read -p "Enter Champion To Delete: " champion_name
        if [[ -z "champion_name" ]]; then
                echo "Champion name cannot be empty."
        else
                if grep -qi "$champion_name" champions.dat;then
                        sed -i "/$champion_name/d" champions.dat
                        echo "Champion '$champion_name' has been deleted from database."
                else
                        echo "Champion '$champion_name' not found in the database."
                fi
        fi
}
}
# Modify Champion
modify_champion(){
        read -p "Enter Champion to Modify: " target_name
# Checks if name exists in champions.dat
if grep -q "$target_name" champions.dat; then
        echo "Champion Found. Please Provide Updated Information."
        while true; do
                read -p "Enter New Name of Champion: " new_name
                [[ -z $new_name || $new_name == [^a-zA-Z\ ] ]]; break
        done
        while true; do
                read -p "Enter New Race of Champion: " new_race
                [[ -z $new_race || $new_race == [^a-zA-Z\ ] ]]; break
        done
        while true; do
                read -p "Enter New Place of Origin: " new_origin
                [[ -z $new_origin || $new_origin == [^a-zA-Z\ ] ]]; break
        done

        # Create a Temp File to store the updated data
        temp_file=$(mktemp)
        sed "/$target_name/ s/.*/Name: $new_name Race: $new_race Orign: $new_origin/" champions.dat > "$temp_file"
        mv "$temp_file" champions.dat
        echo "Updated Champion Info."
else
        echo "Champion not found in the database."
fi
}

echo "Welcome to the League of Legends Database"
echo "Here you can find out champion stats and place of origin"

# Calls to menu function
print_menu
read -p "Enter a number to navigate the menu --> " choice

#loop if choice is not equal to 5
while [ $choice -ne 6 ]
do
        if [ $choice -eq 1 ]
        then
                search_champion

        elif [ $choice -eq 2 ]
        then
                add_champion

        elif [ $choice -eq 3 ]
        then
                delete_champion

        elif [ $choice -eq 4 ]
        then
                modify_champion
        elif [ $choice -eq 5 ]
        then
                champion_record
        else
                exit 0
        fi
        echo
        print_menu
        read -p "Select a number to navigate through the menu --> " choice
done
