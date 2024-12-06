# Competitive Programming Runner (comper)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview
A cool command-line tool for managing competitive programming and coding interview problems across multiple languages (C++, Python, JavaScript).

## Features
- Create problem templates for C++, Python, and JavaScript
- Run tests across all languages or specific language
- Consistent project structure
- Easy-to-use unified CLI
- Cross-platform support (Windows, Linux, macOS)
- Built-in example problems with comprehensive test coverage
- Minimal configuration required


## Prerequisites
- Git Bash (for Windows) or Terminal (for Unix-like systems)
- C++ Compiler (g++)
- Python 3.8+
- Node.js and npm


## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/comper.git
cd comper
```

2. Run the setup script:
```bash
# On Unix-like systems (Linux, macOS)
./setup.sh

# On Windows (Git Bash)
bash setup.sh
```

The setup script will:
- Install required dependencies
- Make scripts executable
- Create platform-specific wrappers
- Configure the environment


## Usage

### Available Commands
```bash
comper <command> <problem_name> [language]
```

Commands:
- `create`: Create a new problem
- `run`: Run tests for a problem
- `help`: Show usage information

Languages:
- `cpp`: C++
- `python`: Python
- `js`: JavaScript

### Examples

1. Create and solve a new problem:
```bash
# Create a new problem 'two_sum' in all languages
comper create two_sum

# This will create the following structure in your problems directory:
# problems/
# ├── cpp/
# │   └── two_sum/
# │       ├── solution.cpp    # Write your solution here
# │       └── test.cpp       # Add your test cases here
# ├── python/
# │   └── two_sum/
# │       ├── solution.py
# │       └── test.py
# └── javascript/
#     └── two_sum/
#         ├── solution.js
#         └── test.js
```

2. Edit your solution:
   - Navigate to the language-specific solution file (e.g., `problems/cpp/two_sum/solution.cpp`)
   - The file contains helpful comments and a basic structure to get started
   - Implement your solution within the designated section
   - Add test cases in the corresponding test file

3. Run tests:
```bash
# Run tests for all languages
comper run two_sum

# Run tests for a specific language
comper run two_sum cpp       # Run C++ tests
comper run two_sum python    # Run Python tests
comper run two_sum js        # Run JavaScript tests
```

4. Get help:
```bash
comper help
comper --help
comper -h
```

## Problem Name Convention
- Use lowercase letters, numbers, and underscores
- Examples: `two_sum`, `binary_search`, `merge_sorted_arrays`
- Spaces and hyphens will be automatically converted to underscores
- Special characters will be removed

## Built-in Examples
Check out our [examples directory](examples/README.md) for complete implementations of various competitive programming problems including:
- Binary Search Tree (JavaScript)
- Longest Increasing Subsequence (C++)
- Word Break (Python)

Each example includes detailed explanations, test cases, and step-by-step solution guides.

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to contribute
- Project structure
- Development guidelines
- Testing requirements

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
