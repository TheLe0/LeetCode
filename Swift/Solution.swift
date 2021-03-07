class Solution {
    
    public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
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
    *  2. Add Two Numbers
    *  https://leetcode.com/problems/add-two-numbers/
    */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let first:ListNode = ListNode(0)
        var link = first
        var carry = 0
        var node1 = l1
        var node2 = l2
        
        while node1 != nil || node2 != nil {
            switch(node1, node2) {
            case (.some(let firstNode), .some(let secondNode)):
                let sum = firstNode.val + secondNode.val + carry
                let value = sum % 10
                carry = Int(sum / 10)
                let node = ListNode(value)
                link.next = node
                node1 = firstNode.next
                node2 = secondNode.next
                link = node
            case (.some(let firstNode), nil):
                let sum = firstNode.val + carry
                let value = sum % 10
                carry = Int(sum / 10)
                let node = ListNode(value)
                link.next = node
                node1 = firstNode.next
                link = node
            case (nil, .some(let secondNode)):
                let sum = secondNode.val + carry
                let value = sum % 10
                carry = Int(sum / 10)
                let node = ListNode(value)
                link.next = node
                node2 = secondNode.next
                link = node
            default:
                print("oo")
            }
        }
        
        if carry > 0 {
            let node = ListNode(carry)
            link.next = node
        }
        
        return first.next    
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
    *  4 - Median of Two Sorted Arrays
    *  https://leetcode.com/problems/median-of-two-sorted-arrays/
    */
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var i = 0, j = 0, arr = [Int]()
        while i < nums1.count && j < nums2.count {
            if nums1[i] < nums2[j] {
                arr.append(nums1[i])
                i += 1
            } else {
                arr.append(nums2[j])
                j += 1
            }
        }
        arr.append(contentsOf: nums1[i..<nums1.count])
        arr.append(contentsOf: nums2[j..<nums2.count])
        
        if (arr.count % 2 == 0) {
            return Double(arr[arr.count / 2] + arr[arr.count / 2 - 1]) / 2
        } else {
            return Double(arr[arr.count / 2])
        }
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
    *  8 - String to Integer (atoi)
    *  https://leetcode.com/problems/string-to-integer-atoi/
    */
    func myAtoi(_ str: String) -> Int {
        var newStr = str.trimmingCharacters(in: .whitespaces)
        var isNegative = false
        var result = 0
        
        if newStr.first == "+" || newStr.first == "-" {
            if newStr.first == "-" {
                isNegative = true
            }
            newStr.removeFirst()
        }
        
        var arr = [Character]()
        for c in newStr {
            if "0123456789".contains(c) {
                arr.append(c)
            } else {
                break
            }
        }
        guard var double = Double(String(arr)) else {
            return 0
        }
        
        if isNegative {
            double = -double
        }
        if double > Double(Int32.max) {
            result = Int(Int32.max)
        } else if double < Double(Int32.min) {
            result = Int(Int32.min)
        } else {
            result = Int(double)
        }
        return result
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
    *  26 - Remove Duplicates from Sorted Array
    *  https://leetcode.com/problems/remove-duplicates-from-sorted-array/
    */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard  nums.count >= 2 else { return nums.count }
    
        var arr = [Int]()
        var beforeNum = nums[0]
        
        arr.append(beforeNum)
        
        for i in 1..<nums.count {
           
            if beforeNum != nums[i] {
               
               arr.append(nums[i])
               beforeNum = nums[i]
                
           }
        }
        
        nums = arr

        return nums.count   
    }
    
    /**
    *  27 - Remove Element
    *  https://leetcode.com/problems/remove-element/
    */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        
        var i = 0

        repeat {
            if (nums[i] == val) {
                nums.remove(at: i)
            } else {
                i += 1
            }
        } while (i < nums.count)

        return nums.count
    }
    
    /**
    *  28 - Implement strStr()
    *  https://leetcode.com/problems/powx-n/
    */
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if needle == "" {
            return 0
        }

        if !(needle.count <= haystack.count) {
            return -1
        }

        let haystackList = Array(haystack)
        let needleList = Array(needle)

        let checkLimit = haystackList.count - needleList.count

        var needleIndex = -1

        for i in 0...checkLimit {
            let sliceLength = i + needleList.count - 1
            let slice = Array(haystackList[i...sliceLength])
            if slice == needleList {
                needleIndex = i
                break
            }
        }

        return needleIndex
    }
    
    /**
    *  35 - Search Insert Position
    *  https://leetcode.com/problems/search-insert-position/
    */
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        nums.filter({ $0 < target }).count 
    }
    
    /**
    *  50 - Pow(x, n)
    *  https://leetcode.com/problems/powx-n/
    */
    func myPow(_ x: Double, _ n: Int) -> Double {
        return pow(x,Double(n))  
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
    
    /**
    *  66 - Plus One
    *  https://leetcode.com/problems/plus-one/
    */
    func plusOne(_ digits: [Int]) -> [Int] {
        var flag = false
        var mDigits = digits
        mDigits[mDigits.count - 1] += 1
        
        for i in mDigits.indices.reversed() {
            if flag {
                mDigits[i] += 1
            }
            if mDigits[i] >= 10 {
                flag = true
                mDigits[i] %= 10
            } else {
                flag = false
            }
        }
        
        if flag {
            mDigits.insert(1, at: 0)
        }
        
        return mDigits
    } 
}
