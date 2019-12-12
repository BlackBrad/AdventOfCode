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

    print(totalRange)
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
