import Foundation

var result = ""
var left = [3, 1]
var right = [3, 3]
func solution(_ numbers:[Int], _ hand:String) -> String {
    // 1,4,7은 왼손 3,6,9는 오른손
    for n in numbers {
        if n == 1 || n == 4 || n == 7 {
            touch("left", n)
        } else if n == 3 || n == 6 || n == 9 {
            touch("right", n)
        } else {    // 2,5,8,0 -> 가까운 손으로 누른다.
            /*
             [0][1] -> 1
             [0][2] -> 2
             [0][3] -> 3
             [1][1] -> 4
             [1][2] -> 5
             [1][3] -> 6
             [2][1] -> 7
             [2][2] -> 8
             [2][3] -> 9
             [i][j] -> 3*i + j = n
             i = (n-1) / 3
             j = n - 3*i
             */
            
            var cur = getIndex(n)
            let leftDistance = abs(cur[0] - left[0]) + abs(cur[1] - left[1])
            let rightDistance = abs(cur[0] - right[0]) + abs(cur[1] - right[1])
            if leftDistance < rightDistance {    //왼쪽이 더 가까울때
                touch("left", n)
            } else if leftDistance > rightDistance {
                touch("right", n)
            } else {
                touch(hand, n)
            }
            
        }
    }
    return result
}

func getIndex(_ n: Int) -> [Int] {
    var n = n
    if n == 0 {
        n = 11
    }
    let i = Int((n - 1) / 3)
    let j = n - 3 * i
    return [i, j]
}

func touch(_ hand: String, _ n: Int) {
    switch hand {
    case "left":
        result.append("L")
        left = getIndex(n)
    case "right":
        result.append("R")
        right = getIndex(n)
    default: break
    }
}

//print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
