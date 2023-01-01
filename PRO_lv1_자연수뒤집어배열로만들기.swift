func solution(_ n:Int64) -> [Int] {
    var arr: [Int] = []
    var m: Int = Int(n)
    
    while m > 0 {
        arr.append(m % 10)
        m /= 10
    }
    
    return arr
}
