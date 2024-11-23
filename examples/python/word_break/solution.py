"""
Problem: Word Break

Given a string s and a dictionary of strings wordDict, return true if s can be segmented into 
a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

Example 1:
Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

Example 2:
Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.

Example 3:
Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false

Constraints:
- 1 <= s.length <= 300
- 1 <= wordDict.length <= 1000
- 1 <= wordDict[i].length <= 20
- s and wordDict[i] consist of only lowercase English letters
- All the strings of wordDict are unique
"""

from typing import List

class Solution:
    def word_break(self, s: str, word_dict: List[str]) -> bool:
        """
        Determine if s can be segmented into words from word_dict.
        Uses dynamic programming with a boolean array dp[i] that represents
        whether the substring s[0:i] can be segmented into dictionary words.
        
        Time Complexity: O(n * m * k) where:
            n = length of string s
            m = number of words in word_dict
            k = average length of words in word_dict
        Space Complexity: O(n) for the dp array
        
        Args:
            s: The string to segment
            word_dict: List of dictionary words
            
        Returns:
            True if s can be segmented into dictionary words, False otherwise
        """
        n = len(s)
        dp = [False] * (n + 1)  # dp[i] = can we segment s[0:i]?
        dp[0] = True  # Empty string can always be segmented
        
        # Convert word_dict to set for O(1) lookup
        word_set = set(word_dict)
        
        # For each position i in s
        for i in range(1, n + 1):
            # Try to find a valid word ending at position i
            for j in range(i):
                # If we can segment s[0:j] and s[j:i] is a word
                if dp[j] and s[j:i] in word_set:
                    dp[i] = True
                    break
        
        return dp[n]

def main():
    solution = Solution()
    
    # Example usage
    s = "leetcode"
    word_dict = ["leet", "code"]
    result = solution.word_break(s, word_dict)
    print(f"Can '{s}' be segmented using {word_dict}? {result}")

if __name__ == "__main__":
    main()
