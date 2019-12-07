import Foundation

func decodeIns(program: inout [Int], noun: Int, verb: Int){ 
    var program_counter = 0
    var instruction = program[program_counter]
    
    //Restore Gravity Assist State
    program[1] = noun
    program[2] = verb

    while instruction != 99{
        // Get the addresses to get the variables from
        let src1 = program[program_counter + 1]
        let src2 = program[program_counter + 2] 
        let dest = program[program_counter + 3] 
        
        let val1 = program[src1]
        let val2 = program[src2]

        //Check the current instruction
        if instruction == 1{
            program[dest] = val1 + val2
        } else if instruction == 2{
            program[dest] = val1 * val2
        }

        // Incerement the instruction by 4
        // and get the next instruction
        program_counter += 4
        instruction = program[program_counter]
    }
}

func getInput() -> [Int]{
    do {
        let filePath = "./AOC_Day2_IntCode.txt"
        let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
        return fileContents.components(separatedBy: ",")
                                       .map({Int($0) ?? 0})

    } catch let error as NSError{
        print("Exception: \(error)")
    }
    return [0]
}

func partOne(){
    var intCodeArray = getInput()
    decodeIns(program: &intCodeArray, noun: 12, verb: 2)
    print("PART ONE: ELEMENT 0 IS: \(intCodeArray[0])")
}

func partTwo(targetValue: Int){
    for noun in 0...100{
        for verb in 0...100{
            var intCodeArray = getInput()
            decodeIns(program: &intCodeArray, noun: noun, verb: verb)

            if intCodeArray[0] == targetValue{
                let result = 100 * noun + verb
                print("The target value \(targetValue) has been reached with noun: \(noun)   verb: \(verb)  The result is: \(result)")
                return 
            }
        }
    }
}

partOne()
partTwo(targetValue: 19690720)
