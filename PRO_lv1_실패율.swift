
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    //스테이지 m 실패율: stages중 m 개수 / stages중 m이상 개수
    var arr1 = Array(repeating: 0.0, count: N+2)
    var arr2 = Array(repeating: 0.0, count: N+2)
    
    for i in stages.indices {
        arr1[stages[i]] += 1
        for j in 1...stages[i] {
            arr2[j] += 1
        }
    }
    
    return (1...N).sorted(by: {
        func failRate(_ i: Int) -> Double {
            return arr1[i] / arr2[i]
        }
        if failRate($0) > failRate($1) {
            return true
        } else if failRate($0) == failRate($1) {
            return $0 < $1
        } else {
            return false
        }
    })
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
