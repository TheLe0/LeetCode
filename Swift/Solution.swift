class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var res = [Int : Int]()

        for (index, num) in nums.enumerated() {
            if let lastIndex = res[target - num] {
                return [lastIndex, index]
            }

            res[num] = index

        }

        fatalError("No valid outputs")
    }
}
