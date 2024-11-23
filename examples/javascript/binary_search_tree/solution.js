/**
 * Problem: Binary Search Tree
 * Implement a Binary Search Tree (BST) with the following operations:
 * - insert: Insert a value into the BST
 * - search: Search for a value in the BST
 * - delete: Delete a value from the BST
 * - inorderTraversal: Return an array of values in inorder traversal
 * - height: Return the height of the tree
 * - isBalanced: Check if the tree is balanced
 * 
 * Example:
 * Input: [insert(5), insert(3), insert(7), search(3)]
 * Output: true (3 exists in the tree)
 */

class TreeNode {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}

class Solution {
    constructor() {
        this.root = null;
    }

    /**
     * Insert a value into the BST
     * @param {number} val - The value to insert
     * @returns {TreeNode} - The root of the tree
     */
    insert(val) {
        const insertHelper = (node, val) => {
            if (!node) return new TreeNode(val);
            
            if (val < node.val) {
                node.left = insertHelper(node.left, val);
            } else if (val > node.val) {
                node.right = insertHelper(node.right, val);
            }
            
            return node;
        };

        this.root = insertHelper(this.root, val);
        return this.root;
    }

    /**
     * Search for a value in the BST
     * @param {number} val - The value to search for
     * @returns {boolean} - True if value exists, false otherwise
     */
    search(val) {
        const searchHelper = (node, val) => {
            if (!node) return false;
            if (node.val === val) return true;
            
            return val < node.val 
                ? searchHelper(node.left, val)
                : searchHelper(node.right, val);
        };

        return searchHelper(this.root, val);
    }

    /**
     * Delete a value from the BST
     * @param {number} val - The value to delete
     * @returns {TreeNode} - The root of the tree
     */
    delete(val) {
        const findMin = (node) => {
            while (node.left) {
                node = node.left;
            }
            return node;
        };

        const deleteHelper = (node, val) => {
            if (!node) return null;

            if (val < node.val) {
                node.left = deleteHelper(node.left, val);
            } else if (val > node.val) {
                node.right = deleteHelper(node.right, val);
            } else {
                // Node to delete found
                
                // Case 1: Leaf node
                if (!node.left && !node.right) {
                    return null;
                }
                
                // Case 2: Node with one child
                if (!node.left) return node.right;
                if (!node.right) return node.left;
                
                // Case 3: Node with two children
                const successor = findMin(node.right);
                node.val = successor.val;
                node.right = deleteHelper(node.right, successor.val);
            }
            
            return node;
        };

        this.root = deleteHelper(this.root, val);
        return this.root;
    }

    /**
     * Get in-order traversal of the BST
     * @returns {number[]} - Array of values in in-order traversal
     */
    inorderTraversal() {
        const result = [];
        
        const traverse = (node) => {
            if (!node) return;
            traverse(node.left);
            result.push(node.val);
            traverse(node.right);
        };

        traverse(this.root);
        return result;
    }

    /**
     * Get the height of the BST
     * @returns {number} - Height of the tree
     */
    height() {
        const heightHelper = (node) => {
            if (!node) return 0;
            return 1 + Math.max(heightHelper(node.left), heightHelper(node.right));
        };

        return heightHelper(this.root);
    }

    /**
     * Check if the tree is balanced
     * @returns {boolean} - True if balanced, false otherwise
     */
    isBalanced() {
        const isBalancedHelper = (node) => {
            if (!node) return { height: 0, balanced: true };

            const left = isBalancedHelper(node.left);
            const right = isBalancedHelper(node.right);

            const balanced = left.balanced && right.balanced && 
                           Math.abs(left.height - right.height) <= 1;

            return {
                height: 1 + Math.max(left.height, right.height),
                balanced
            };
        };

        return isBalancedHelper(this.root).balanced;
    }
}

function main() {
    const solution = new Solution();
    
    // Example input
    const nums = [5, 3, 7];
    
    // Insert values into the BST
    for (const num of nums) {
        solution.insert(num);
    }
    
    // Search for a value in the BST
    const result = solution.search(3);
    
    // Print result
    console.log(`Result: ${result}`);
}

// Only run main if this file is being run directly
if (require.main === module) {
    main();
}

// Export the Solution class for testing
module.exports = Solution;
