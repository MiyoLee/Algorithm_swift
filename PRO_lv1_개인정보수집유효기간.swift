import Foundation

// 두번째 푼거. 날짜를 int로 계산해서 쉽게 연산, 비교.
func solution2(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer = [Int]()
    var dict = Dictionary<String, Int>()
    let todayDate = getDate(today)
    
    for t in terms {
        let arr = t.split(separator: " ")
        let alpha = String(arr[0])
        let month = Int(arr[1])!
        dict[alpha] = month
    }
    
    for i in privacies.indices {
        let arr = privacies[i].split(separator: " ")
        let agreedDate = getDate(String(arr[0]))
        if agreedDate + 28 * dict[String(arr[1])]! - 1 < todayDate {
            answer.append(i+1)
        }
    }
    return answer
}

func getDate(_ str: String) -> Int {
    let arr = str.split(separator: ".")
    let y = Int(arr[0])!
    let m = Int(arr[1])!
    let d = Int(arr[2])!
    return (y * 12 + m) * 28 + d
}

print(solution2("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))

//---------------------------------------------------------------------------------------
// 내가 처음 푼거. 개비효율.
func solution1(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer: [Int] = []
    var dict: [String : Int] = [:]
    let todayWithoutDot = today.filter({$0 != "."})
    
    for t in terms {
        let arr = t.split(separator: " ")
        let alpha = String(arr[0])  // A
        let month = String(arr[1])  // 6
        dict[alpha] = Int(month)!
    }
    
    for i in 0..<privacies.count {
        let p = privacies[i]
        let arr = p.split(separator: " ")
        let date = String(arr[0])
        let alpha = String(arr[1])
        
        print(getDateAfterMonth(date, dict[alpha]!))
        
        if todayWithoutDot > getDateAfterMonth(date, dict[alpha]!) {
            answer.append(i + 1)
        }
    }

    return answer
}

func getDateAfterMonth(_ agreedDay: String, _ month: Int) -> String {   // 보관 가능한 날짜 리턴. ex)20220124
    
    let arr = agreedDay.split(separator: ".")
    var y = Int(arr[0])
    var m = Int(arr[1])
    var d = Int(arr[2])
    
    var month = month
    
    if month >= 12 {
        y! += month / 12
        month = month % 12
    }
    
    if m! + month <= 12 {
        m! += month
    } else {
        y! += 1
        m = m! + month - 12
    }
    
    if d! > 1 {
        d! -= 1
    } else {
        d! = 28
        if m! - 1 > 0 {
            m! -= 1
        } else {
            y! -= 1
            m = 12
        }
    }
    
    var paddedMonth = String(m!)
    if paddedMonth.count < 2 {
        paddedMonth = "0" + paddedMonth
    }
    
    var paddedDay = String(d!)
    if paddedDay.count < 2 {
        paddedDay = "0" + paddedDay
    }
    
    return String(y!) + paddedMonth + paddedDay
}
