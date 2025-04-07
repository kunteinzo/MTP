#!/bin/bash

# clear the screen
clear

echo "Building the project..."
./gradlew clean > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Failed to clean the project."
    exit 1
fi
./gradlew build > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Failed to build the project."
    exit 1
fi

echo
echo "Project built successfully."
sleep 1
clear

# Extract the builded app and move it to the .local bin and lib directory
echo "Extracting app"
cd ~/.local
tar -xf ~/Projects/MTP/app/build/distributions/app.tar
mv app/bin/* bin/
mv app/lib/* lib/
chmod +x bin/app
rm -rf app

echo
echo "App extracted successfully."
sleep 1
clear

cd ~/Projects/MTP

app