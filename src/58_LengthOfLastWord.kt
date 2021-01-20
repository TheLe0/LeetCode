class Solution {
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
}
