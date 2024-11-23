# Built-in Examples

This directory contains complete implementations of various competitive programming problems to help you get started.

## C++ Examples

### 1. [Longest Increasing Subsequence](cpp/longest_increasing_subsequence/README.md)
A classic dynamic programming problem demonstrating:
- O(n log n) algorithm for finding sequence length
- O(n²) algorithm for sequence reconstruction
- Comprehensive test cases
- Step-by-step solution guide

## Python Examples

### 1. [Word Break](python/word_break/README.md)
A dynamic programming problem demonstrating:
- O(n * m * k) solution using boolean array
- Efficient string segmentation
- Edge case handling
- Comprehensive test suite

## JavaScript Examples

### 1. [Binary Search Tree](javascript/binary_search_tree/README.md)
A complete BST implementation demonstrating:
- Core tree operations (insert, search, delete)
- Tree traversal and properties
- Balanced tree detection
- Comprehensive test coverage

## Learning from Examples

Each example includes:
1. Problem description and constraints
2. Solution explanation with time/space complexity
3. Implementation details and key concepts
4. Comprehensive test cases
5. Step-by-step solution guide

## Using Examples

To work with an example:

1. Create a new problem with the same name:
```bash
# For instance, to work on the Binary Search Tree example
comper create binary_search_tree js

# Or Word Break example
comper create word_break python
```

2. Copy the example implementation:
   - Study the example code in the `examples/` directory
   - Copy relevant parts into your solution in the `problems/` directory
   - Modify and experiment with the code
   - Add your own test cases

3. Run your implementation:
```bash
# Run your implementation's tests
comper run binary_search_tree js
```

Note: Examples are meant for learning and reference. To work on them, create a new problem first, then use the examples as a guide for your implementation.
