class Solution {
    fun lengthOfLongestSubstring(s: String): Int {

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
}
