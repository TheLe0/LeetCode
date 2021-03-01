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
    
    /**
    *  9 - Palindrome Number
    *  https://leetcode.com/problems/palindrome-number/
    */
    func isPalindrome(_ x: Int) -> Bool {

        let strNum = Array(String(x))
        var output = ""
        var reverse = 0

        do
        {
            for i in (0...(strNum.count - 1)).reversed() {
                let value = strNum[i]

                if (x < 0 && value == "-") {
                    continue
                }

                output = "\(output)\(value)"
            }

            reverse = (x < 0) ? (Int(output)! * -1) : Int(output)!
        } catch {
            reverse = 0
        }

        return (reverse == x && x >= 0)
    
    }
    
    /**
    *  14 - Longest Common Prefix
    *  https://leetcode.com/problems/longest-common-prefix/
    */
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstStr = strs.first else {
            return ""
        }
        
        var res = ""
        
        for (i, char) in firstStr.enumerated() {
            // dropFirst(_ k: Int = 1) returns a Substring struct
            for str in strs.dropFirst() {
                if i == str.count {
                    return res
                }
                
                // Another easy way: Array(str)[i], time complexity is linear though
                let currentStrChar = str[str.index(str.startIndex, offsetBy: i)]
                
                if char != currentStrChar {
                    return res
                }
            }
            res.append(char)
        }
        
        return res
    }
    
    /**
    *  58 - Length of Last Word
    *  https://leetcode.com/problems/length-of-last-word/
    */
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0
        var sChars = Array(s)
        
        guard sChars.count != 0 else {
            return 0
        }
        
        for i in (0...(sChars.count - 1)).reversed() {
            if res == 0 {
                if sChars[i] == " " {
                    continue
                } else {
                    res += 1
                }
            } else {
                if sChars[i] == " " {
                    break
                } else {
                    res += 1
                }
            }
        }
        
        return res
    }
   
}
