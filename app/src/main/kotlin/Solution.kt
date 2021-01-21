class Solution {

    /**
     *  1. Two Sum
     *  https://leetcode.com/problems/two-sum/
     */
    fun twoSum(nums: IntArray, target: Int): IntArray
    {
        val mm = HashMap<Int, Int>()

        var res = mutableListOf<Int>()

        for (i in nums.indices) {
            mm[nums[i]] = i
        }

        for (i in nums.indices) {
            val temp = mm.get(target - nums[i])
            if (temp != null && (temp ?: -1) > i) {
                res.add(i)
                res.add(mm.getOrElse(target-nums[i], {0}))
            }
        }

        return res.toIntArray()
    }

    /**
     *  3 - Longest Substring Without Repeating Characters
     *  https://leetcode.com/problems/longest-substring-without-repeating-characters/
     */
    fun lengthOfLongestSubstring(s: String): Int
    {

        val stringArray = s.toCharArray()
        var highestCounting :Int = 0

        for (i in stringArray.indices)
        {
            var count = 0
            var charList: MutableList<Char> = mutableListOf()

            for (j in i until stringArray.size)
            {
                if (stringArray[j] !in charList)
                {
                    count++
                    charList.add( stringArray[j])

                }
                else
                {
                    break
                }
            }

            highestCounting = if (count > highestCounting) count else highestCounting
        }

        return highestCounting
    }

    /**
     *  7 - Reverse Integer
     *  https://leetcode.com/problems/reverse-integer/
     */
    fun reverse(x: Int): Int
    {
        var reverse: Int = 0
        try
        {
            val strNum = x.toString().toCharArray()
            var output = ""

            for (i in (strNum.size-1) downTo 0)
            {
                var currentValue = strNum[i]

                if (x < 0 && currentValue.equals('-'))
                {
                    continue
                }

                output = "$output$currentValue"
            }

            reverse =  if (x < 0) (output.toInt()*-1) else output.toInt()
        }
        catch(e: NumberFormatException)
        {
            reverse =  0
        }

        return reverse
    }

    /**
     *  9 - Palindrome Number
     *  https://leetcode.com/problems/palindrome-number/
     */
    fun isPalindrome(x: Int): Boolean
    {
        val strNum = x.toString().toCharArray()
        var output = ""
        var reverse: Int = 0

        try {

            for (i in (strNum.size - 1) downTo 0) {
                var currentValue = strNum[i]

                if (x < 0 && currentValue.equals('-')) {
                    continue
                }

                output = "$output$currentValue"
            }

            reverse = if (x < 0) (output.toInt() * -1) else output.toInt()
        }
        catch (e: NumberFormatException)
        {
            reverse = 0
        }

        var result :Boolean = (reverse == x && x >= 0)

        return result
    }

    /**
     *  14 - Longest Common Prefix
     *  https://leetcode.com/problems/longest-common-prefix/
     */
    fun longestCommonPrefix(strs: Array<String>): String
    {
        var prefix :String

        if (strs.isEmpty())
        {
            return ""
        }

        prefix = strs[0]
        for (i in 1 until strs.size)
        {
            while (strs[i].indexOf(prefix) != 0)
            {
                prefix = prefix.substring(0, prefix.length - 1)
                if (prefix.isEmpty())
                {
                    return ""
                }
            }
        }
        return prefix
    }

    /**
     *  58 - Length of Last Word
     *  https://leetcode.com/problems/length-of-last-word/
     */
    fun lengthOfLastWord(s: String): Int
    {
        var longest = 0
        val arrayString = s.split(" ").toTypedArray()

        for (i in (arrayString.size-1) downTo  0)
        {
            if (arrayString[i].isNotEmpty())
            {
                longest = arrayString[i].length
                break
            }
        }

        return longest
    }

    /**
     *  66 - Plus One
     *  https://leetcode.com/problems/plus-one/
     */
    fun plusOne(digits: IntArray): IntArray
    {
        if (digits.isEmpty())
        {
            return digits
        }

        for (i in (digits.size-1)  downTo  0)
        {
            if (digits[i] < 9)
            {
                digits[i]++
                return digits
            }

            digits[i] = 0
        }

        var res = IntArray(digits.size+1)
        res[0] = 1
        return res
    }
}