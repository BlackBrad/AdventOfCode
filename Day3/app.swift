#!/usr/bin/swift

import Foundation

func trace_wires(path: [String]) -> [(x: Int, y: Int)]{
    var tracedData:[(x: Int, y: Int)] = []
    var currentCoordinates = (x: 0, y: 0)

    for direction in path{
        let index = direction.index(direction.startIndex, offsetBy: 1)
        let change_in_direction = Int(direction[index...])
        
        for _ in 1...change_in_direction!{

            switch(direction.first){
            case "L":
                currentCoordinates.x -= 1 
                break
            case "R":
                currentCoordinates.x += 1
                break
            case "U": 
                currentCoordinates.y += 1
                break
            case "D":
                currentCoordinates.y -= 1
                break
            default: 
                break
            }

            tracedData.append((x: currentCoordinates.x, y: currentCoordinates.y))
        }
    }
    print(tracedData)
    return tracedData 
}

func findClosestIntersection(pathArray: [(x: Int, y: Int)]) {
    var distances:[Int] = []
    var index = 1
    
    //Bubble search for intersecting elements 
    for path in pathArray{
        for pathIndex in index..<pathArray.count{
//            print("A \(path)  B: \(pathArray[pathIndex])")
            if path.x == pathArray[pathIndex].x && path.y == pathArray[pathIndex].y{
                let x = path.x < 0 ? path.x * -1 : path.x
                let y = path.y < 0 ? path.y * -1 : path.y
                distances.append(x + y)
            }
        }
        if index == pathArray.count{
            break
        }
        index += 1
    }
    print(distances)
}

func get_input() -> [String]{
    let file_path = "./AOC_Day3_Circuit.txt"
    do {
        let fileContents = try String(contentsOfFile: file_path, encoding: .utf8)
        let wireArray = fileContents.trimmingCharacters(in: .whitespacesAndNewlines)
                                    .components(separatedBy: ",")
        return wireArray
    } catch let error as NSError{
        print("Exception: \(error)")
    }
    return [""]
}

func partOne(){
    let wireArray = get_input()
    let pathArray = trace_wires(path: wireArray)
    findClosestIntersection(pathArray: pathArray)
}

partOne()
