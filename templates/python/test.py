import unittest
from solution import Solution

class TestSolution(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()
    
    def test_example(self):
        """
        Example test case:
        nums = [1, 2, 3]
        expected = 6
        self.assertEqual(self.solution.solve(nums), expected)
        """
        pass

if __name__ == '__main__':
    unittest.main()
