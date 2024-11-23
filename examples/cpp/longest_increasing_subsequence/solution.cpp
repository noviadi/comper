#include "solution.h"
#include <algorithm>

int Solution::findLIS(std::vector<int>& nums) {
    if (nums.empty()) return 0;
    
    // dp[i] represents the smallest number that can end an increasing subsequence of length i+1
    std::vector<int> dp;
    
    for (int num : nums) {
        // Find the position where num should be inserted
        auto it = std::lower_bound(dp.begin(), dp.end(), num);
        
        if (it == dp.end()) {
            // num is greater than all elements in dp, extend the sequence
            dp.push_back(num);
        } else {
            // Replace the smallest number that is >= num
            *it = num;
        }
    }
    
    return dp.size();
}

std::vector<int> Solution::getLIS(std::vector<int>& nums) {
    if (nums.empty()) return {};
    
    // dp[i] stores the index of the previous number in the LIS ending at i
    std::vector<int> dp(nums.size(), -1);
    // len[i] stores the length of LIS ending at i
    std::vector<int> len(nums.size(), 1);
    // Track the index where the longest sequence ends
    int maxLen = 1, endIndex = 0;
    
    // Find LIS
    for (int i = 1; i < nums.size(); i++) {
        for (int j = 0; j < i; j++) {
            if (nums[i] > nums[j] && len[j] + 1 > len[i]) {
                len[i] = len[j] + 1;
                dp[i] = j;
                if (len[i] > maxLen) {
                    maxLen = len[i];
                    endIndex = i;
                }
            }
        }
    }
    
    // Reconstruct the sequence
    std::vector<int> sequence;
    while (endIndex != -1) {
        sequence.push_back(nums[endIndex]);
        endIndex = dp[endIndex];
    }
    std::reverse(sequence.begin(), sequence.end());
    
    return sequence;
}
