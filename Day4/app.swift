#!/usr/bin/swift

import Foundation

func generatePasswordRange(range: [Int]){
    // Split the two elements into dedicated variables for extra readability
    let lowerBound = range[0]
    let upperBound = range[1]
    var totalRange:[String] = []

    for i in lowerBound...upperBound{
        totalRange.append(String(i))
    }
}

func recursiveCheckRules(range: [Int], currentIndex: Int = 0) -> Bool{
    if range.count != 6 {
        return false
    } else if Int(currentIndex) == range.count - 1 {
        return true
    } else {
        let a = Int(range[currentIndex])
        let b = Int(range[currentIndex + 1])

        if b > a || b == a {
            return recursiveCheckRules(range: range, currentIndex: b)
        }
    }
    return false
}

func checkRules(range: [String]){
    var valuesThatMeetRules: [Int] = []
    for value in range{
        let valueAsArray = Array(value).map({Int($0) ?? 0})
        if recursiveCheckRules(range: valueAsArray){
            valuesThatMeetRules.append(Int(value)!)
        }
    }
}

func getInput() -> [Int]{
    let file_path = "./AOC_Day4_PasswordRange.txt"
    do {
        let fileContents = try String(contentsOfFile: file_path, encoding: .utf8)
        return fileContents.trimmingCharacters(in: .whitespacesAndNewlines)
                           .components(separatedBy: "-")
                           .map({Int($0) ?? 0})
    } catch let error as NSError{
        print("Exception: \(error)")
    }
    return [0]
}

let temp = getInput()
print("Temp is \(temp)")
generatePasswordRange(range: temp)

print(recursiveCheckRules(range: [1,1,1,1,1,1]))
