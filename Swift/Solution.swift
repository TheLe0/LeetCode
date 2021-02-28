class Solution {
    
     /**
     *  1. Two Sum
     *  https://leetcode.com/problems/two-sum/
     */
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
    
    /**
    *  3 - Longest Substring Without Repeating Characters
    *  https://leetcode.com/problems/longest-substring-without-repeating-characters/
    */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = Array(s)
        var startIndex = 0
        var highest = 0
        var charList = [Character: Int]()

        for (index, character) in characters.enumerated() {

            if let pos = charList[character] {
                startIndex = max(startIndex, pos)
            }

            charList[character] = index + 1
            highest = max(highest, index - startIndex + 1)
        }

        return highest
    }
    
     /**
     *  7 - Reverse Integer
     *  https://leetcode.com/problems/reverse-integer/
     */
     func reverse(_ x: Int) -> Int {

        var reverse = 0

        if (x >= Int(pow(Double(2), Double(31))) - 1)
        {
            return 0
        }
        else if (x <= (Int(pow(Double(-2),Double(31)))))
        {
            return 0
        }

        do {
            var output = ""
            let characters = Array(String(x))

            for i in (0...(characters.count - 1)).reversed() {

                var value = characters[i]

                if (x < 0 && value == "-") {
                    continue
                }

                output = "\(output)\(value)"

            }

            reverse = (x < 0) ? (Int(output)! * -1) : (Int(output)!)

        } catch {
            reverse = 0
        }

        return reverse
    }
    
    
}
