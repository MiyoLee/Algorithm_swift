import Foundation

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    var items: [[Int]] = []
    
    var str = s
    str.removeFirst(2)
    str.removeLast(2)
    
    var arr = str.split(separator: "},{")
    for a in arr {
        var item = a
        var tmpArr = item.split(separator: ",")
        var itemArr: [Int] = tmpArr.map({Int($0)!})
        items.append(itemArr)
    }
    
    items.sort(by: {$0.count < $1.count})
    
    result.append((items.first?.first!)!)
    
    for i in 1..<items.count {
        let arr = items[i].filter({!result.contains($0)})
        result.append(contentsOf: arr)
    }
    
    return result
}
