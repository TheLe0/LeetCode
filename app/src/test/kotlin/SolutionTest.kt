import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test

class SolutionTest {

    private val solution = Solution()

    @Test
    fun twoSunTest()
    {

        Assertions.assertArrayEquals(intArrayOf(0, 1), solution.twoSum(intArrayOf(2, 7, 11, 15), 9))
        Assertions.assertArrayEquals(intArrayOf(1, 2), solution.twoSum(intArrayOf(3, 2, 4), 6))
    }

    @Test
    fun longestCommonPrefixTest()
    {
        Assertions.assertEquals("fl", solution.longestCommonPrefix(arrayOf("flower","flow","flight")))
        Assertions.assertEquals("", solution.longestCommonPrefix(arrayOf("dog","racecar","car")))
    }

    @Test
    fun lengthOfLongestSubstringTest()
    {
        Assertions.assertEquals(3, solution.lengthOfLongestSubstring("abcabcbb"))
        Assertions.assertEquals(1, solution.lengthOfLongestSubstring("bbbbb"))
        Assertions.assertEquals(3, solution.lengthOfLongestSubstring("pwwkew"))
        Assertions.assertEquals(0, solution.lengthOfLongestSubstring(""))
    }

    @Test
    fun reverseTest()
    {
        Assertions.assertEquals(321, solution.reverse(123))
        Assertions.assertEquals(-321, solution.reverse(-123))
        Assertions.assertEquals(21, solution.reverse(120))
        Assertions.assertEquals(0, solution.reverse(0))
    }

    @Test
    fun isPalindromeTest()
    {
        Assertions.assertEquals(true, solution.isPalindrome(121))
        Assertions.assertEquals(false, solution.isPalindrome(-121))
        Assertions.assertEquals(false, solution.isPalindrome(10))
        Assertions.assertEquals(false, solution.isPalindrome(-101))
    }

    @Test
    fun lengthOfLastWordTest()
    {
        Assertions.assertEquals(5, solution.lengthOfLastWord("Hello World"))
        Assertions.assertEquals(0, solution.lengthOfLastWord(" "))
        Assertions.assertEquals(1, solution.lengthOfLastWord("a "))
    }

    @Test
    fun plusOne()
    {
        Assertions.assertArrayEquals(intArrayOf(1, 2, 4), solution.plusOne(intArrayOf(1, 2, 3)))
        Assertions.assertArrayEquals(intArrayOf(4, 3, 2, 2), solution.plusOne(intArrayOf(4, 3, 2, 1)))
        Assertions.assertArrayEquals(intArrayOf(1), solution.plusOne(intArrayOf(0)))
    }
}