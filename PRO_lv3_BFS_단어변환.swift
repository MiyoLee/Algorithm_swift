import Foundation

var wordList: [String] = []
var beginWord: String = ""
var targetWord: String = ""

class Word {
    var str: String = ""
    var cnt: Int = 0
    var visit:[Bool] = []
    
    init(str: String, cnt: Int, visit: [Bool]) {
        self.str = str
        self.cnt = cnt
        self.visit = visit
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    wordList = words
    beginWord = begin
    targetWord = target
    
    if !words.contains(target) {
        return 0
    }
    
    return bfs(begin, target, words)
}

func bfs(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var min = 50
    var queue:[Word] = [Word(str: begin, cnt: 0, visit: Array(repeating: false, count: words.count))]
    
    while !queue.isEmpty {
        let cur = queue.first
        queue.removeFirst()
        
        if cur!.str == target {
            if cur!.cnt < min {
                min = cur!.cnt
            }
        }
        
        for i in words.indices {
            if !cur!.visit[i] && isConvertable(cur!.str, words[i]) {
                let w = Word(str: words[i], cnt: cur!.cnt+1, visit: cur!.visit)
                w.visit[i] = true
                queue.append(w)
            }
        }
    }
    return min
}

func isConvertable(_ str1:String, _ str2:String) -> Bool {
    var diff = 0
    let arr1 = str1.map{ $0 }
    let arr2 = str2.map{ $0 }
    for i in arr1.indices {
        if arr1[i] != arr2[i] {
            diff += 1
        }
        if diff >= 2 {
            return false
        }
    }
    return diff == 1
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
