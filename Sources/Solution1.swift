//
// https://leetcode.com/problems/two-sum
//

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for indexI in 0..<nums.count {
            for indexJ in 0..<nums.count where indexI != indexJ {
                if nums[indexI] + nums[indexJ] == target {
                    return [indexI, indexJ]
                }
            }
        }

        return []
    }
}
