import Foundation

func solution(_ new_id:String) -> String {
    //1. 대문자 모두 소문자로
    var arr = Array(new_id.lowercased())

    //2. 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    arr = arr.filter{ isValidChar($0) }

    //3. 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    var str  = String(arr)
    while str.contains(".."){
        str = str.replacingOccurrences(of: "..", with: ".")
    }

    //4. 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    if str.hasPrefix(".") {
        str.removeFirst()
    } else if str.hasSuffix("."){
        str.removeLast()
    }

    //5. 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if str == "" {
        str = "a"
    }

    //6. 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
    //만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    if str.count >= 16 {
        let lastIndex = str.index(str.startIndex, offsetBy: 14)
        str = String(str[str.startIndex...lastIndex])
    }
    if str.hasSuffix(".") {
        str.removeLast()
    }

    //7. 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    if str.count <= 2 {
        str += String(repeating: str.last!, count: 3 - str.count)
    }
    print(str)
    return str
}

func isValidChar(_ c: Character) -> Bool {
    if (c >= "a" && c <= "z") || (c >= "0" && c <= "9") || c == "-" || c == "_" || c == "." {
        return true
    }
    return false
}

solution("...!@BaT#*..y.abcdefghijklm")
