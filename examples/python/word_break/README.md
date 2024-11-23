# Word Break Example

This example demonstrates how to use the Competitive Programming Runner (comper) to implement and test the Word Break problem in Python.

## Problem Description

Given a string `s` and a dictionary of strings `wordDict`, determine if `s` can be segmented into a space-separated sequence of one or more dictionary words. The same word in the dictionary may be reused multiple times in the segmentation.

### Example

```
Input: s = "leetcode", wordDict = ["leet", "code"]
Output: true
Explanation: "leetcode" can be segmented as "leet code"
```

### Constraints
- 1 <= s.length <= 300
- 1 <= wordDict.length <= 1000
- 1 <= wordDict[i].length <= 20
- s and wordDict[i] consist of only lowercase English letters
- All the strings of wordDict are unique

## Step-by-Step Guide

### 1. Create the Problem

```bash
# Create a new problem named "word_break" for Python
./comper create word_break python
```

This creates two files in the `problems/python/word_break/` directory:
- `solution.py`: Implementation file with problem description and solution
- `test.py`: Test cases

### 2. Implement the Solution

The solution uses dynamic programming with a boolean array where `dp[i]` represents whether the substring `s[0:i]` can be segmented into dictionary words.

Key implementation points:
1. Initialize dp array with dp[0] = True (empty string)
2. For each position i, check if any previous position j allows segmentation
3. Use set for O(1) word lookup
4. Return dp[n] for final result

```python
def word_break(self, s: str, word_dict: List[str]) -> bool:
    n = len(s)
    dp = [False] * (n + 1)
    dp[0] = True
    word_set = set(word_dict)
    
    for i in range(1, n + 1):
        for j in range(i):
            if dp[j] and s[j:i] in word_set:
                dp[i] = True
                break
    
    return dp[n]
```

### 3. Test Cases

The implementation includes comprehensive test cases:
1. Example cases from problem description
2. Edge cases:
   - Empty string
   - Single character
   - No solution exists
3. Special cases:
   - Overlapping words
   - Long words
   - Repeated words

### 4. Run the Tests

```bash
# Run tests for the word break problem
./comper run word_break python
```

## Implementation Details

### Algorithm: Dynamic Programming
1. Use boolean array dp[i] to track if s[0:i] can be segmented
2. For each ending position i:
   - Try all possible starting positions j < i
   - Check if s[0:j] can be segmented (dp[j])
   - Check if s[j:i] is a dictionary word
3. If both conditions met, s[0:i] can be segmented

### Time Complexity
- O(n * m * k) where:
  - n = length of string s
  - m = number of words in word_dict
  - k = average length of words in word_dict

### Space Complexity
- O(n) for the dp array
- O(m * k) for the word set

## Tips for Similar Problems

1. Consider using dynamic programming when:
   - Problem involves finding optimal substructure
   - Subproblems overlap
   - Need to make decisions at each step

2. Optimize lookup operations:
   - Use sets for O(1) membership testing
   - Convert lists to sets when multiple lookups needed
   - Consider trie for prefix-based word lookup

3. Handle edge cases:
   - Empty string
   - Single character
   - No solution exists
   - Maximum constraints

4. Test with various scenarios:
   - Overlapping possibilities
   - Repeated patterns
   - Boundary conditions
