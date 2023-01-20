func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cache = [String]()
    var time = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    } else {
        for city in cities {
            let cityName = city.lowercased()
            if !cache.contains(cityName) {  //miss
                time += 5
                if cache.count == cacheSize {
                    cache.removeFirst()
                }
                cache.append(cityName)
            } else {    //hit
                time += 1
                cache.remove(at: cache.firstIndex(of: cityName)!)
                cache.append(cityName)
            }
        }
        
        return time
    }
}
