class Solution {
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
}
