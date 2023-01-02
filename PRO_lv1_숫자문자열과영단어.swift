import Foundation

let dict = [0:"zero", 1:"one", 2:"two", 3:"three", 4:"four", 5:"five", 6:"six", 7:"seven", 8:"eight", 9:"nine"]

func solution2(_ s:String) -> Int {
    var s = s
    for i in 0...9 {
        s = s.replacingOccurrences(of: dict[i]!, with: String(i))
    }
    return Int(s)!
}
// 풀이1
func solution1(_ s:String) -> Int {
    var result = ""
    
    var i = 0
    while i < s.count {
        let index = s.index(s.startIndex, offsetBy: i)
        if s[index] >= "0" && s[index] <= "9" { // 숫자라면
            result.append(s[index])
            i += 1
            continue
        } else {
            let substr = s[index...]
            for j in 0...9 {
                if substr.hasPrefix(dict[j]!) {
                    result.append(String(j))
                    i += dict[j]!.count
                    break
                }
            }
        }
    }
    
    return Int(result)!
    
}



print(solution2("23four5six7"))
