#!/usr/bin/swift

import Foundation

func trace_wires(wireArray: [[String]]) -> [[(x: Int, y: Int, steps: Int)]]{
    var dataToReturn:[[(x: Int, y: Int, steps: Int)]] = []

    for wire in wireArray{
        var currentCoordinates = (x: 0, y: 0, steps: 0)
        var tracedData:[(x: Int, y: Int, steps: Int)] = []

        for direction in wire{
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
                currentCoordinates.steps += 1
                tracedData.append((x: currentCoordinates.x,
                                   y: currentCoordinates.y,
                                   steps: currentCoordinates.steps))
            }
        }
        dataToReturn.append(tracedData)
    }
    return dataToReturn
}

func findClosestIntersection(pathArray: [[(x: Int, y: Int, steps: Int)]]) {
    var distances:[Int] = []
    var steps: [Int] = []
    var index = 1

    for wire in pathArray{
        for path in wire{
            for otherWire in index..<pathArray.count{
                for otherPath in pathArray[otherWire]{
                    if path.x == otherPath.x && path.y == otherPath.y{
                        distances.append(abs(path.x) + abs(path.y))
                        steps.append(path.steps + otherPath.steps)
                    }
                }
            }
        }
        index += 1
    }
    distances.sort()
    steps.sort()
    print("The shortest distance is: \(distances[0])")
    print("The fewest amount of steps is: \(steps[0]))")
}

func get_input() -> [[String]]{
    let file_path = "./AOC_Day3_Circuit.txt"
    do {
        var wireArray: [[String]] = []
        let fileContents = try String(contentsOfFile: file_path, encoding: .utf8)
        let tempArray = fileContents.trimmingCharacters(in: .whitespacesAndNewlines)
                                    .components(separatedBy: "\n")

        for wire in tempArray{
            wireArray.append(wire.components(separatedBy: ","))
        }

        return wireArray
    } catch let error as NSError{
        print("Exception: \(error)")
    }
    return [[""]]
}

func main(){
    let wireArray = get_input()
    let pathArray = trace_wires(wireArray: wireArray)
    findClosestIntersection(pathArray: pathArray)
}

main()
