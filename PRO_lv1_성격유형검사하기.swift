import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    //survey: ["AN", "CF", "MJ", "RT", "NA"]
    //choices: [5, 3, 2, 7, 5]
//    1    매우 비동의
//    2    비동의
//    3    약간 비동의
//    4    모르겠음
//    5    약간 동의
//    6    동의
//    7    매우 동의
    
//    1번 지표    라이언형(R), 튜브형(T)
//    2번 지표    콘형(C), 프로도형(F)
//    3번 지표    제이지형(J), 무지형(M)
//    4번 지표    어피치형(A), 네오형(N)
    
    var dict = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    for i in survey.indices {
        let first = String(survey[i].first!)
        let second = String(survey[i].last!)
        
        switch choices[i] {
        case 1...3: dict[first]! += (4 - choices[i])
        case 5...7: dict[second]! += (choices[i] - 4)
        default: break
        }
    }
    
    print(dict)
                                
    // 답 구하기. 첫번째 방법 개복잡하게 품
    var answer = ""
    dict["R"]! >= dict["T"]! ? answer.append("R") : answer.append("T")
    dict["C"]! >= dict["F"]! ? answer.append("C") : answer.append("F")
    dict["J"]! >= dict["M"]! ? answer.append("J") : answer.append("M")
    dict["A"]! >= dict["N"]! ? answer.append("A") : answer.append("N")
//    for i in 0...3 {
//        var tmpDict = dict.filter { d in
//            d.value[1] == i
//        }
//        answer += tmpDict.max(by: { a, b in
//            if a.value[0] < b.value[0] ||  (a.value[0] == b.value[0] && a.key > b.key) {
//                return true
//            }
//            return false
//        })!.key
//    }
    print(answer)
    return answer
}

solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5] )
