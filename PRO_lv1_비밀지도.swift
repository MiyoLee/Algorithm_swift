import Foundation

//두번째 풀이. 비트연산자 사용, map 사용
func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {  // arr1,2 탐색
        
        let binary = String(arr1[i] | arr2[i], radix: 2)    //2진수로 변환한 string
        let padded = String(repeating:"0", count: n - binary.count) + binary
        
        answer.append(String(Array(padded).map{ $0 == "1" ? "#" : " "}))
    }
    
    return answer
}


//첫번째 풀이.
func solution1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map = [[Character]](repeating: [Character](repeating: " ", count: n), count: n)

    for i in 0..<n {  // arr1,2 탐색
        let str1 = setBinaryStr(String(arr1[i], radix: 2), n)    //2진수로 변환한 string
        let str2 = setBinaryStr(String(arr2[i], radix: 2), n)

        for j in 0..<n {  //str1,2 탐색
            let index1 = str1.index(str1.startIndex, offsetBy: j)
            let index2 = str2.index(str2.startIndex, offsetBy: j)
            if str1[index1] == "1" || str2[index2] == "1" {
                map[i][j] = "#"
            }
        }
    }

    for i in 0..<n {
        answer.append(String(map[i]))
    }

    return answer
}

func setBinaryStr(_ s: String, _ n: Int) -> String {
    var result = s

    for _ in 0..<n-s.count {
        result = "0" + result
    }

    return result
}
