import unittest
from solution import Solution

class TestSolution(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()
    
    def test_example_1(self):
        """Test the first example case"""
        s = "leetcode"
        word_dict = ["leet", "code"]
        self.assertTrue(self.solution.word_break(s, word_dict))
    
    def test_example_2(self):
        """Test the second example with word reuse"""
        s = "applepenapple"
        word_dict = ["apple", "pen"]
        self.assertTrue(self.solution.word_break(s, word_dict))
    
    def test_example_3(self):
        """Test the third example where segmentation is impossible"""
        s = "catsandog"
        word_dict = ["cats", "dog", "sand", "and", "cat"]
        self.assertFalse(self.solution.word_break(s, word_dict))
    
    def test_empty_string(self):
        """Test with empty string"""
        s = ""
        word_dict = ["test"]
        self.assertTrue(self.solution.word_break(s, word_dict))
    
    def test_single_character(self):
        """Test with single character string"""
        s = "a"
        word_dict = ["a"]
        self.assertTrue(self.solution.word_break(s, word_dict))
    
    def test_no_solution(self):
        """Test when no solution exists"""
        s = "abc"
        word_dict = ["ab", "cd"]
        self.assertFalse(self.solution.word_break(s, word_dict))
    
    def test_overlapping_words(self):
        """Test with overlapping word possibilities"""
        s = "foofoobar"
        word_dict = ["foo", "foofoo", "bar"]
        self.assertTrue(self.solution.word_break(s, word_dict))
    
    def test_long_word(self):
        """Test with a long word"""
        s = "a" * 20
        word_dict = ["a" * 20]
        self.assertTrue(self.solution.word_break(s, word_dict))
    
    def test_repeated_words(self):
        """Test with repeated words"""
        s = "gogogo"
        word_dict = ["go"]
        self.assertTrue(self.solution.word_break(s, word_dict))

if __name__ == '__main__':
    unittest.main()
