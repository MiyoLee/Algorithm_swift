import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var answer = 0
    var boardCopy = board
    var basket: [Int] = []
    
    for m in moves {
        var i = 0
        while i < board.count {
            if boardCopy[i][m-1] > 0 {
                if boardCopy[i][m-1] == basket.last {   //터진다
                    answer += 2
                    basket.removeLast()
                } else {
                    basket.append(boardCopy[i][m-1])    //넣는다
                }
                boardCopy[i][m-1] = 0   //뽑는다
                break
            }
            i += 1
        }
       
    }
    return answer
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])
