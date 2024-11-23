# Contributing to Comper

Thank you for your interest in contributing to Comper! Here's how you can help:

## How to Contribute

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Development Guidelines

1. Follow existing code style and conventions
2. Add tests for new features
3. Update documentation as needed
4. Keep commits focused and atomic
5. Write clear commit messages

## Project Structure

```
project/
│
├── templates/           # Language templates
│   ├── cpp/            # C++ templates
│   │   ├── solution.cpp
│   │   └── test.cpp
│   ├── python/         # Python templates
│   │   ├── solution.py
│   │   └── test.py
│   └── javascript/     # JavaScript templates
│       ├── solution.js
│       └── test.js
│
├── problems/           # Your solutions (created by comper)
│   ├── cpp/
│   ├── python/
│   └── javascript/
│
├── examples/           # Example problems
│   ├── cpp/           # C++ example problems
│   ├── python/        # Python example problems
│   └── javascript/    # JavaScript example problems
│
├── scripts/           # Utility scripts
│   ├── create.sh     # Problem creation logic
│   ├── run.sh        # Test running logic
│   └── utils.sh      # Shared utilities
│
├── comper            # Main CLI script
├── comper.cmd        # Windows wrapper (created by setup)
├── setup.sh          # Installation script
├── package.json      # Node.js dependencies
├── LICENSE           # MIT License
└── README.md         # Main documentation
```

## Script Descriptions

### Main Scripts
- `comper`: The main CLI script that handles all commands
- `setup.sh`: Installation script that sets up the environment
- `comper.cmd`: Windows wrapper script (created during setup)

### Utility Scripts
- `create.sh`: Handles problem creation logic
- `run.sh`: Manages test execution
- `utils.sh`: Shared utilities for cross-platform support

## Templates

Each language has its own template directory with:
1. Solution template (`solution.*`)
   - Basic class/function structure
   - Problem description placeholder
   - Export mechanisms for testing

2. Test template (`test.*`)
   - Test suite structure
   - Basic and edge case placeholders
   - Common testing patterns

## Testing

Before submitting a PR:
1. Run tests for all examples
2. Test on both Windows and Unix-like systems
3. Verify cross-platform compatibility
4. Check error handling scenarios

## Documentation

When adding features or making changes:
1. Update relevant README files
2. Add inline code comments
3. Update usage examples if needed
4. Document any new dependencies
