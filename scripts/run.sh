#!/bin/bash

# Get the absolute path of the project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Source utility functions
source "$PROJECT_DIR/scripts/utils.sh"

# Check if problem name is provided
if [ $# -lt 1 ]; then
    echo "Error: Problem name is required"
    echo "Usage: comper run <problem_name> [language]"
    echo "Examples:"
    echo "  comper run two_sum           # Run in all languages"
    echo "  comper run two_sum cpp       # Run in C++ only"
    echo "  comper run two_sum python    # Run in Python only"
    echo "  comper run two_sum js        # Run in JavaScript only"
    exit 1
fi

PROBLEM_NAME=$1
LANGUAGE=$2

run_cpp() {
    if [ ! -d "problems/cpp/$PROBLEM_NAME" ]; then
        echo "Error: Problem '$PROBLEM_NAME' not found in C++"
        exit 1
    fi
    echo "Running C++ tests for '$PROBLEM_NAME':"
    cd problems/cpp
    g++ -std=c++11 $PROBLEM_NAME/solution.cpp $PROBLEM_NAME/test.cpp -o solution_test
    ./solution_test
    rm solution_test
    cd ../..
}

run_python() {
    if [ ! -d "problems/python/$PROBLEM_NAME" ]; then
        echo "Error: Problem '$PROBLEM_NAME' not found in Python"
        exit 1
    fi
    echo "Running Python tests for '$PROBLEM_NAME':"
    cd problems/python
    python3 $PROBLEM_NAME/test.py
    cd ../..
}

run_javascript() {
    if [ ! -d "problems/javascript/$PROBLEM_NAME" ]; then
        echo "Error: Problem '$PROBLEM_NAME' not found in JavaScript"
        exit 1
    fi
    echo "Running JavaScript tests for '$PROBLEM_NAME':"
    
    run_os_command \
        'powershell.exe -Command "node node_modules/mocha/bin/mocha.js \"problems/javascript/$PROBLEM_NAME/test.js\""' \
        'node node_modules/mocha/bin/mocha.js "problems/javascript/$PROBLEM_NAME/test.js"'
}

# Run based on language parameter
case $LANGUAGE in
    "cpp")
        run_cpp
        ;;
    "python")
        run_python
        ;;
    "js")
        run_javascript
        ;;
    "")
        # If no language specified, run all
        echo "Running tests for all languages..."
        echo ""
        run_cpp
        echo ""
        run_python
        echo ""
        run_javascript
        ;;
    *)
        echo "Error: Invalid language specified: $LANGUAGE"
        echo "Supported languages: cpp, python, js"
        exit 1
        ;;
esac
