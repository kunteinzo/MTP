#!/bin/bash

# Build the project and extract the app to bin/

# clear the screen
clear

echo "Building the project..."
tmp=$(./gradlew clean)
if [ $? -ne 0 ]; then
    echo "Failed to clean the project."
    echo
    echo $tmp
    exit 1
fi
tmp=$(./gradlew build)
if [ $? -ne 0 ]; then
    echo "Failed to build the project."
    echo
    echo $tmp
    exit 1
fi
tmp=

echo
echo "Project built successfully."
sleep 1
clear

# Extract the builded app and move it to the .local bin and lib directory
tmp=$(echo "Extracting app" && \
cd ~/.local && \
tar -xf ~/Projects/MTP/app/build/distributions/app.tar && \
mv app/bin/* bin/ && \
mv app/lib/* lib/ && \
chmod +x bin/app && \
rm -rf app)

if [ $? -ne 0 ]; then
    echo "Failed to extract the app."
    echo
    echo $tmp
    exit 1
fi
tmp=

echo
echo "App extracted successfully."
sleep 1
clear

cd ~/Projects/MTP

app