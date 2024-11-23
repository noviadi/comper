const assert = require('assert');
const Solution = require('./solution');

describe('Binary Search Tree', () => {
    let bst;

    beforeEach(() => {
        bst = new Solution();
    });

    describe('Insert and Search', () => {
        it('should insert and find values correctly', () => {
            bst.insert(5);
            bst.insert(3);
            bst.insert(7);
            
            assert.strictEqual(bst.search(5), true);
            assert.strictEqual(bst.search(3), true);
            assert.strictEqual(bst.search(7), true);
            assert.strictEqual(bst.search(1), false);
        });

        it('should maintain BST properties after multiple inserts', () => {
            const values = [5, 3, 7, 1, 4, 6, 8];
            values.forEach(val => bst.insert(val));
            
            const inorder = bst.inorderTraversal();
            assert.deepStrictEqual(inorder, [1, 3, 4, 5, 6, 7, 8]);
        });
    });

    describe('Delete', () => {
        beforeEach(() => {
            [5, 3, 7, 1, 4, 6, 8].forEach(val => bst.insert(val));
        });

        it('should delete leaf nodes correctly', () => {
            bst.delete(1);
            assert.strictEqual(bst.search(1), false);
            assert.deepStrictEqual(bst.inorderTraversal(), [3, 4, 5, 6, 7, 8]);
        });

        it('should delete nodes with one child', () => {
            bst.delete(3);
            assert.strictEqual(bst.search(3), false);
            assert.deepStrictEqual(bst.inorderTraversal(), [1, 4, 5, 6, 7, 8]);
        });

        it('should delete nodes with two children', () => {
            bst.delete(7);
            assert.strictEqual(bst.search(7), false);
            assert.deepStrictEqual(bst.inorderTraversal(), [1, 3, 4, 5, 6, 8]);
        });

        it('should handle deleting root', () => {
            bst.delete(5);
            assert.strictEqual(bst.search(5), false);
            assert.deepStrictEqual(bst.inorderTraversal(), [1, 3, 4, 6, 7, 8]);
        });
    });

    describe('Tree Properties', () => {
        it('should calculate height correctly', () => {
            assert.strictEqual(bst.height(), 0);
            
            bst.insert(5);
            assert.strictEqual(bst.height(), 1);
            
            bst.insert(3);
            bst.insert(7);
            assert.strictEqual(bst.height(), 2);
            
            bst.insert(1);
            assert.strictEqual(bst.height(), 3);
        });

        it('should detect balanced trees', () => {
            // Empty tree is balanced
            assert.strictEqual(bst.isBalanced(), true);
            
            // Balanced tree
            [5, 3, 7, 1, 4, 6, 8].forEach(val => bst.insert(val));
            assert.strictEqual(bst.isBalanced(), true);
            
            // Make it unbalanced
            bst.insert(0);
            bst.insert(-1);
            assert.strictEqual(bst.isBalanced(), false);
        });
    });

    describe('Edge Cases', () => {
        it('should handle duplicate inserts', () => {
            bst.insert(5);
            bst.insert(5);
            assert.deepStrictEqual(bst.inorderTraversal(), [5]);
        });

        it('should handle deleting non-existent values', () => {
            bst.insert(5);
            bst.delete(10);
            assert.deepStrictEqual(bst.inorderTraversal(), [5]);
        });

        it('should handle operations on empty tree', () => {
            assert.strictEqual(bst.search(5), false);
            assert.deepStrictEqual(bst.inorderTraversal(), []);
            assert.strictEqual(bst.height(), 0);
            assert.strictEqual(bst.isBalanced(), true);
        });
    });
});
