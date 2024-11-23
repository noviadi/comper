#!/bin/bash

PROBLEM_NAME=$1
LANGUAGE=$2

# Function to format problem name (lowercase, replace spaces/hyphens with underscores)
format_name() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' -' '_' | tr -cd '[:alnum:]_'
}

# Format the problem name
PROBLEM_NAME=$(format_name "$PROBLEM_NAME")

# Validate problem name
if [[ ! $PROBLEM_NAME =~ ^[a-z0-9_]+$ ]]; then
    echo "Error: Invalid problem name format"
    echo "Problem name can only contain lowercase letters, numbers, and underscores"
    echo "Original: $1"
    echo "Suggested: $PROBLEM_NAME"
    exit 1
fi

# Check if the name is empty after formatting
if [ -z "$PROBLEM_NAME" ]; then
    echo "Error: Problem name cannot be empty after formatting"
    exit 1
fi

# If the formatted name is different from the original, inform the user
if [ "$1" != "$PROBLEM_NAME" ]; then
    echo "Note: Problem name has been formatted"
    echo "Original: $1"
    echo "Formatted: $PROBLEM_NAME"
    echo ""
fi

create_cpp() {
    TARGET_DIR="problems/cpp/$PROBLEM_NAME"
    if [ -d "$TARGET_DIR" ]; then
        echo "Error: C++ problem '$PROBLEM_NAME' already exists"
        exit 1
    fi
    mkdir -p "$TARGET_DIR"
    cp templates/cpp/solution.cpp "$TARGET_DIR/"
    cp templates/cpp/solution.h "$TARGET_DIR/"
    cp templates/cpp/test.cpp "$TARGET_DIR/"
    echo "Created C++ problem: $PROBLEM_NAME"
}

create_python() {
    TARGET_DIR="problems/python/$PROBLEM_NAME"
    if [ -d "$TARGET_DIR" ]; then
        echo "Error: Python problem '$PROBLEM_NAME' already exists"
        exit 1
    fi
    mkdir -p "$TARGET_DIR"
    cp templates/python/solution.py "$TARGET_DIR/"
    cp templates/python/test.py "$TARGET_DIR/"
    echo "Created Python problem: $PROBLEM_NAME"
}

create_javascript() {
    TARGET_DIR="problems/javascript/$PROBLEM_NAME"
    if [ -d "$TARGET_DIR" ]; then
        echo "Error: JavaScript problem '$PROBLEM_NAME' already exists"
        exit 1
    fi
    mkdir -p "$TARGET_DIR"
    cp templates/javascript/solution.js "$TARGET_DIR/"
    cp templates/javascript/test.js "$TARGET_DIR/"
    echo "Created JavaScript problem: $PROBLEM_NAME"
}

# Create based on language parameter
case $LANGUAGE in
    "cpp")
        create_cpp
        ;;
    "python")
        create_python
        ;;
    "js")
        create_javascript
        ;;
    "")
        # If no language specified, create for all
        create_cpp
        create_python
        create_javascript
        ;;
    *)
        echo "Error: Invalid language specified: $LANGUAGE"
        echo "Supported languages: cpp, python, js"
        exit 1
        ;;
esac
