# Binary Search Tree Implementation

A complete implementation of a Binary Search Tree (BST) data structure in JavaScript with comprehensive test coverage.

## Problem Description

Implement a Binary Search Tree with the following operations:
1. `insert(val)`: Insert a value into the BST
2. `search(val)`: Search for a value in the BST
3. `delete(val)`: Delete a value from the BST
4. `inorderTraversal()`: Return an array of values in inorder traversal
5. `height()`: Return the height of the tree
6. `isBalanced()`: Check if the tree is balanced

## Example

```javascript
const bst = new Solution();
bst.insert(5);
bst.insert(3);
bst.insert(7);

console.log(bst.search(3));  // true
console.log(bst.search(4));  // false

bst.delete(3);
console.log(bst.inorderTraversal());  // [5, 7]
```

## Implementation Details

### Data Structure
- `TreeNode` class: Represents each node in the tree
  - `val`: Node's value
  - `left`: Left child reference
  - `right`: Right child reference

### Key Operations

1. **Insert (O(log n) average case)**
   - Recursively traverse the tree
   - Place new node while maintaining BST property
   - Handle duplicates by ignoring them

2. **Search (O(log n) average case)**
   - Recursively traverse the tree
   - Compare target value with current node
   - Return true if found, false otherwise

3. **Delete (O(log n) average case)**
   - Handle three cases:
     1. Leaf node: Simply remove
     2. One child: Replace with child
     3. Two children: Replace with successor

4. **Inorder Traversal (O(n))**
   - Recursively visit left subtree
   - Process current node
   - Recursively visit right subtree

5. **Height (O(n))**
   - Recursively calculate height of subtrees
   - Return max(leftHeight, rightHeight) + 1

6. **Balance Check (O(n))**
   - Recursively check subtree heights
   - Tree is balanced if height difference ≤ 1

## Test Cases

The implementation includes comprehensive test coverage:

1. **Basic Operations**
   - Insert and search values
   - Maintain BST properties
   - Inorder traversal verification

2. **Deletion Cases**
   - Leaf node deletion
   - Single child node deletion
   - Two children node deletion
   - Root node deletion

3. **Tree Properties**
   - Height calculation
   - Balance detection
   - Empty tree handling

4. **Edge Cases**
   - Duplicate values
   - Non-existent values
   - Empty tree operations

## Running the Example

1. Create the problem:
```bash
comper create binary_search_tree js
```

2. Copy the solution and test files:
```bash
cp examples/javascript/binary_search_tree/* problems/javascript/binary_search_tree/
```

3. Run the tests:
```bash
comper run binary_search_tree js
```

## Time Complexity

| Operation | Average Case | Worst Case |
|-----------|--------------|------------|
| Insert    | O(log n)     | O(n)       |
| Search    | O(log n)     | O(n)       |
| Delete    | O(log n)     | O(n)       |
| Traverse  | O(n)         | O(n)       |
| Height    | O(n)         | O(n)       |
| Balance   | O(n)         | O(n)       |

Note: Worst case occurs with an unbalanced tree (e.g., all nodes in a single line)
