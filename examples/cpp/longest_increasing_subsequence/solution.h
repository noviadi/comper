#pragma once
#include <vector>

/*
* Problem: Longest Increasing Subsequence (LIS)
* 
* Given an integer array nums, return the length of the longest strictly increasing subsequence.
* 
* A subsequence is a sequence that can be derived from an array by deleting some or no elements 
* without changing the order of the remaining elements.
* 
* Example:
* Input: nums = [10,9,2,5,3,7,101,18]
* Output: 4
* Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
* 
* Constraints:
* - 1 <= nums.length <= 2500
* - -10^4 <= nums[i] <= 10^4
*/

class Solution {
public:
    // Returns the length of the longest increasing subsequence
    int findLIS(std::vector<int>& nums);
    
    // Optional: Returns the actual subsequence
    std::vector<int> getLIS(std::vector<int>& nums);
};
