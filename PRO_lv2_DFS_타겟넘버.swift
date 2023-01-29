import Foundation

var answer = 0
var count = 0
var numbersCopy:[Int] = []
var targetNum = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    numbersCopy = numbers
    targetNum = target
    count = numbers.count
    
    per(0, 0)
    
    return answer
}

func per(_ sum:Int, _ cnt: Int) {
    if cnt == count {
        if sum == targetNum {
            answer += 1
        }
        return
    }
    
    // 1. +
    per(sum + numbersCopy[cnt], cnt+1)
    // 2. -
    per(sum - numbersCopy[cnt], cnt+1)
}
