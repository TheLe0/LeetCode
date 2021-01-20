class Solution {
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

        var res :IntArray = IntArray(digits.size+1)
        res[0] = 1
        return res
    }
}
