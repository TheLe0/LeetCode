class Solution {
    fun reverse(x: Int): Int {

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
}
