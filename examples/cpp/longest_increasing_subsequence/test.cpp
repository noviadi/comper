#include <cassert>
#include <iostream>
#include "solution.h"

void test_example_case() {
    Solution solution;
    std::vector<int> nums = {10, 9, 2, 5, 3, 7, 101, 18};
    assert(solution.findLIS(nums) == 4);
    
    std::vector<int> sequence = solution.getLIS(nums);
    assert(sequence.size() == 4);
    // Verify it's increasing
    for (int i = 1; i < sequence.size(); i++) {
        assert(sequence[i] > sequence[i-1]);
    }
    std::cout << "Example case passed!" << std::endl;
    
    // Print the sequence
    std::cout << "Found sequence: ";
    for (int num : sequence) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
}

void test_empty_array() {
    Solution solution;
    std::vector<int> nums;
    assert(solution.findLIS(nums) == 0);
    assert(solution.getLIS(nums).empty());
    std::cout << "Empty array test passed!" << std::endl;
}

void test_single_element() {
    Solution solution;
    std::vector<int> nums = {42};
    assert(solution.findLIS(nums) == 1);
    
    std::vector<int> sequence = solution.getLIS(nums);
    assert(sequence.size() == 1);
    assert(sequence[0] == 42);
    std::cout << "Single element test passed!" << std::endl;
}

void test_decreasing_sequence() {
    Solution solution;
    std::vector<int> nums = {5, 4, 3, 2, 1};
    assert(solution.findLIS(nums) == 1);
    
    std::vector<int> sequence = solution.getLIS(nums);
    assert(sequence.size() == 1);
    std::cout << "Decreasing sequence test passed!" << std::endl;
}

void test_multiple_solutions() {
    Solution solution;
    std::vector<int> nums = {3, 10, 2, 1, 20};
    assert(solution.findLIS(nums) == 3);
    
    std::vector<int> sequence = solution.getLIS(nums);
    assert(sequence.size() == 3);
    // Verify it's increasing
    for (int i = 1; i < sequence.size(); i++) {
        assert(sequence[i] > sequence[i-1]);
    }
    std::cout << "Multiple solutions test passed!" << std::endl;
}

int main() {
    std::cout << "Running tests..." << std::endl;
    test_example_case();
    test_empty_array();
    test_single_element();
    test_decreasing_sequence();
    test_multiple_solutions();
    std::cout << "All tests passed!" << std::endl;
    return 0;
}
