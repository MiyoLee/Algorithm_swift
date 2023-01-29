import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    var maxGaro = 0
    var maxSero = 0
    
    for size in sizes {
        let garo = size.min()
        let sero = size.max()
        
        maxGaro = max(maxGaro, garo!)
        maxSero = max(maxSero, sero!)
    }
    return maxGaro * maxSero
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
