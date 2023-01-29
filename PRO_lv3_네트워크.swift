import Foundation

var computersCopy:[[Int]] = []
var N = 0
var visit: [Bool] = []

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    computersCopy = computers
    N = n
    visit = Array(repeating: false, count: N)
    
    for i in 0..<n {
        if !visit[i] {
            answer += 1
            bfs(i)
        }
    }
    
    return answer
}

func bfs(_ start: Int) {
    var queue: [Int] = []
    queue.append(start)
    visit[start] = true
    
    while !queue.isEmpty {
        let cur = queue.first
        queue.removeFirst()
        
        for i in 0..<N {
            if !visit[i] && computersCopy[cur!][i] == 1 {    //연결 되어있다
                queue.append(i)
                visit[i] = true
            }
        }
    }
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
