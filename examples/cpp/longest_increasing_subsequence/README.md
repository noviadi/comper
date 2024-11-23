# Longest Increasing Subsequence Example

This example demonstrates how to use the Competitive Programming Runner (comper) to create and solve the Longest Increasing Subsequence (LIS) problem in C++.

## Problem Description

Given an integer array nums, return the length of the longest strictly increasing subsequence.

A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements.

### Example

```
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
```

### Constraints
- 1 <= nums.length <= 2500
- -10^4 <= nums[i] <= 10^4

## Step-by-Step Guide

### 1. Create the Problem

```bash
# Create a new problem named "longest_increasing_subsequence" for C++
./comper create longest_increasing_subsequence cpp
```

This will create three files in the `problems/cpp/longest_increasing_subsequence/` directory:
- `solution.h`: Problem definition and interface
- `solution.cpp`: Implementation file
- `test.cpp`: Test cases

### 2. Implement the Solution

The solution uses two approaches:
1. O(n log n) algorithm for finding the length of LIS
2. O(n²) algorithm for reconstructing the actual sequence

#### Key Functions

1. `findLIS`: Returns the length of the longest increasing subsequence
```cpp
int Solution::findLIS(std::vector<int>& nums) {
    if (nums.empty()) return 0;
    std::vector<int> dp;
    for (int num : nums) {
        auto it = std::lower_bound(dp.begin(), dp.end(), num);
        if (it == dp.end()) {
            dp.push_back(num);
        } else {
            *it = num;
        }
    }
    return dp.size();
}
```

2. `getLIS`: Returns the actual increasing subsequence
```cpp
std::vector<int> Solution::getLIS(std::vector<int>& nums) {
    // See solution.cpp for full implementation
    // Uses dynamic programming to reconstruct the sequence
}
```

### 3. Test Cases

The implementation includes several test cases:
1. Example case: `[10,9,2,5,3,7,101,18]`
2. Empty array
3. Single element
4. Decreasing sequence
5. Multiple possible solutions

### 4. Run the Tests

```bash
# Run tests for the LIS problem
./comper run longest_increasing_subsequence cpp
```

Expected output:
```
Running C++ tests for 'longest_increasing_subsequence':
Running tests...
Example case passed!
Found sequence: 2 5 7 101 
Empty array test passed!
Single element test passed!
Decreasing sequence test passed!
Multiple solutions test passed!
All tests passed!
```

## Implementation Details

### Time Complexity
- Finding LIS length: O(n log n)
- Reconstructing sequence: O(n²)

### Space Complexity
- O(n) for both operations

### Algorithm Explanation

1. **Finding Length (Binary Search Approach)**
   - Maintain a sorted array `dp` where `dp[i]` represents the smallest number that can end an increasing subsequence of length i+1
   - For each number, find its position in `dp` using binary search
   - Either extend the sequence or update an existing position
   - The length of `dp` is the length of LIS

2. **Reconstructing Sequence (Dynamic Programming)**
   - Track previous elements in the sequence using parent pointers
   - For each position, find the longest subsequence that can end at that position
   - Backtrack from the end to construct the actual sequence

## Tips for Solving Similar Problems

1. Consider using the binary search approach when only the length is needed
2. Use dynamic programming when the actual sequence is required
3. Always handle edge cases (empty array, single element)
4. Consider problems with multiple valid solutions
