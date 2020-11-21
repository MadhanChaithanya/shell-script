#!/bin/bash
read -p "Please Enter The Valid User Name:" USER_NAME
echo $USER_NAME
if [ -z "$USER_NAME" ]; then
    echo "Its Not Valid User $USER_NAME"
else
    echo "The UserName is $USER_NAME"
    EX_USER=$(cat /etc/passwd | cut -d ":" -f 1 | grep -w $USER_NAME)
    if [ "$USER_NAME" = "$EX_USER" ]; then
        echo "User $USER_NAME Exists. Please Select a Different UserName..."
    else
        echo "Lets Create user $USER_NAME"
        SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${SPEC}"
        echo $PASSWORD
        # read -s -p "Please Enter The Password:" PASSWORD
        useradd -m $USER_NAME
        echo "$USER_NAME:$PASSWORD" | sudo chpasswd
        passwd -e "${USER_NAME}"
    fi
fi

