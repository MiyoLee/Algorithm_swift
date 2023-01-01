import Foundation

func solution(_ s:String) -> Bool
{
    return s.lowercased().components(separatedBy:"p").count == s.lowercased().components(separatedBy:"y").count
}
