
func solution(_ dartResult:String) -> Int {
    // ex) 1S2D*3T, 1S*2T*3S
    var dartResultArr = Array(dartResult)
    
    var arr: [[Character]] = []
    
    var i = 0
    var tmpArr: [Character] = []
    
    while i < dartResultArr.count {
        let cur = dartResultArr[i]
        tmpArr.append(cur)
        
        if isBonus(cur) {
            if i < dartResultArr.count - 1 && isOption(dartResultArr[i+1]) {
                tmpArr.append(dartResultArr[i+1])
                i += 1
            }
            arr.append(tmpArr)
            tmpArr.removeAll()
        }
        i += 1
    }
    
    var value: [Int] = [0, 0, 0]
    
    for k in arr.indices {
        var j = 0
        if arr[k][0] == "1" {
            if arr[k][1] == "0" {
                value[k] = 10
                j += 1
            } else {
                value[k] = 1
            }
        } else {
            value[k] = Int(String(arr[k][0]))!
        }
        j += 1
        
        switch arr[k][j] {
        case "D": value[k] = value[k]*value[k]
        case "T": value[k] = value[k]*value[k]*value[k]
        default: break
        }
        j += 1
        if j < arr[k].count {   //옵션이 있음
            if arr[k][j] == "*" {
                value[k] *= 2
                if k > 0 {
                    value[k-1] *= 2
                }
            } else if arr[k][j] == "#" {
                value[k] *= -1
            }
        }
    }
    
    return value.reduce(0, +)
}


func isBonus(_ c: Character) -> Bool {
    if c == "S" || c == "D" || c == "T" {
        return true
    }
    return false
}

func isOption(_ c: Character) -> Bool {
    if c == "*" || c == "#" {
        return true
    }
    return false
}

