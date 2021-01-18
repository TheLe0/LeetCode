class Solution {
    fun isPalindrome(x: Int): Boolean {
    
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
}
