class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {
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
}
