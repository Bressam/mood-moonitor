#!/bin/bash

RESTORE=$(echo -en '\001\033[0m\002')
GREEN=$(echo -en '\001\033[00;32m\002')
MAGENTA=$(echo -en '\001\033[00;35m\002')

upperLine="╭─────────────────────────────────────────────────────────────────╮"
lowerLine="╰─────────────────────────────────────────────────────────────────╯"

# Set color for Sections
echo -e "${MAGENTA}${upperLine}"
echo "|  🚀 🚀 🚀 --------- Project Generation Script -------- 🚀 🚀 🚀 |"
echo -e "${MAGENTA}${lowerLine}${RESTORE}"

echo "Hey there! I'm here to set up your project. First, I'll install all the necessary tools you'll need."
echo "Then, I'll fetch all the dependencies to make sure everything is in place."
echo "Finally, I'll generate the main project and get all the submodules up and running, so you're ready to dive right into development!"

echo "${GREEN}"
echo $upperLine
echo "|  🛰️  🛰️  🛰️  -------- Installing necessary tools -------- 🛰️  🛰️  🛰️  |"
echo -e "${GREEN}${lowerLine}${RESTORE}"

# Install SwiftLint if not installed
if command -v swiftlint
then
    echo "SwiftLint already installed."
else
    echo "Installing SwiftLint. Please be sure you have HomeBrew installed."
    brew install swiftlint
fi

# Install all dependencies using Tuist
echo "${GREEN}"
echo $upperLine
echo "|  📫 📫 📫 -------- Fetching all dependencies --------- 📫 📫 📫 |"
echo -e "${GREEN}${lowerLine}${RESTORE}"

./.tuist-bin/tuist install

# Generate project using Tuist
echo ""
echo "${GREEN}"
echo $upperLine
echo "| 📦 📦 📦 ---- Generating Project & All Submodules ---- 📦 📦 📦 |"
echo -e "${GREEN}${lowerLine}${RESTORE}"

./.tuist-bin/tuist generate
