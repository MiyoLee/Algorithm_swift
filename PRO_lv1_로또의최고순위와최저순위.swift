import Foundation

// 두번째 풀이. filter 사용, rank() 간소화
func solution2(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zero = lottos.filter { $0 == 0 }.count
    let match = lottos.filter{ win_nums.contains($0) }.count
    
    return [ rank(zero+match), rank(match)]
}

func rank(_ matchCnt: Int) -> Int {
    return min(7 - matchCnt, 6)
}







// 첫번째 풀이. contains만 사용.
func solution1(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var match = 0
    var zero = 0
    for i in lottos.indices {
        if lottos[i] == 0 {
            zero += 1
        } else if win_nums.contains(lottos[i]) {
            match += 1
        }
    }

    return [rank(match + zero), rank(match)]
}

func rank(_ matchCnt: Int) -> Int {
    switch matchCnt {
    case 6 : return 1
    case 5: return 2
    case 4: return 3
    case 3: return 4
    case 2: return 5
    default: return 6
    }
}
