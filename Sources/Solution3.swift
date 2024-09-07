//
// https://leetcode.com/problems/longest-substring-without-repeating-characters
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxCount = 0
        var string = s

        var ar = Array(string)

        func foo(start: Int, end: Int) -> [Character] {
            if ar.isEmpty {
                return []
            }

            if start == end {
                return [ar[start]]
            }

            return Array(ar[start...end])
        }

        var start = 0
        var end = 0
        var flag = true
        var seq = foo(start: start, end: end)

        if seq.isEmpty {
            return maxCount
        }

        while flag {
            if end + 1 < ar.count {
                if !seq.contains(ar[end + 1]) {
                    end += 1
                } else {
                    start += 1
                    end = start

                    string = (string as NSString).replacingOccurrences(of: String(seq), with: String(seq.last!))
                    ar = Array(string)
                }
            }

            if end + 1 == ar.count {
                flag = false
            }

            seq = foo(start: start, end: end)
            maxCount = max(maxCount, seq.count)
        }

        return maxCount
    }
}
