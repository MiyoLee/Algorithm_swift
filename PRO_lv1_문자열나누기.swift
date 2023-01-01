

import Foundation

func solution(_ s:String) -> Int {
    let arr = Array(s)  //string을 array로 바꿔버림.
    var answer = 0
    var x: Character? = nil
    var xCnt = 0
    var notXCnt = 0
    
    for i in arr.indices {
        if x == nil {
            x = arr[i]
        }
        if x == arr[i]  {
            xCnt += 1
        } else {
            notXCnt += 1
        }
        if xCnt == notXCnt {    //분리해냄.
            answer += 1
            x = nil //x 삭제
        }
    }
    if xCnt != notXCnt {
        answer += 1
    }
    return answer
//    var answer = 0
//    var x = s[s.startIndex]
//    var xCnt = 0
//    var notXCnt = 0
//    for i in s.indices {
//        if x == s[i] {
//            xCnt += 1
//        } else {
//            notXCnt += 1
//        }
//        if xCnt == notXCnt {
//            answer += 1 //분리해냄
//            if i < s.index(before: s.endIndex) {
//                x = s[s.index(after:i)]
//            }
//        }
//    }
//    if xCnt != notXCnt {
//        answer += 1
//    }
//    return answer
}

print(solution("aaabbaccccabba"))
