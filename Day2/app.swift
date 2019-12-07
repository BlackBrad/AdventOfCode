import Foundation

func decodeIns(program: inout [Int]){ 
	var program_counter = 0
	var instruction = program[program_counter]
	
	while instruction != 99{
		// Get the addresses to get the variables from
		let src1 = program[program_counter + 1]
		let src2 = program[program_counter + 2] 
		let dest = program[program_counter + 3] 
        
        if dest == 0{
            print("counter: \(program_counter)  Ins: \(instruction)")
        }
		
		let val1 = program[src1]
		let val2 = program[src2]
        
        print ("INS:\(program_counter) : \(instruction)    \(dest) = \(src1) : \(val1) +/* \(src2) : \(val2)") 

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

func main(){
	do {
		let filePath = "./AOC_Day2_IntCode.txt"
		let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
        var intCodeArray = fileContents.components(separatedBy: ",")
                                       .map({Int($0) ?? 0})
        decodeIns(program: &intCodeArray)
        print("Element 0 is: \(intCodeArray[0])")
        print(intCodeArray)

	} catch let error as NSError{
        print("Exception: \(error)")
    }
}

// Test using given exmaples

func testIntCode(initial: inout [Int], expectedResult: [Int]){
	print ("TEST \(initial) == \(expectedResult)")
	
	decodeIns(program: &initial)
    
	print ("RESULT \(initial) == \(expectedResult)")

	let resultMessage = initial == expectedResult ? "PASS\n" : "FALSE\n"
	
	print(resultMessage)
}

if CommandLine.arguments.contains("--test"){
    var dayTwoExampleOne = [1, 0, 0, 0, 99]
    let expectedDay2TwoExampleOne = [2, 0, 0, 0, 99]
    testIntCode(initial: &dayTwoExampleOne, expectedResult: expectedDay2TwoExampleOne)
	
    var dayTwoExampleTwo = [2, 3, 0, 3, 99]
    let expectedDay2TwoExampleTwo = [2, 3, 0, 6, 99]
    testIntCode(initial: &dayTwoExampleTwo, expectedResult: expectedDay2TwoExampleTwo)	
    
    var dayTwoExampleThree = [2, 4, 4, 5, 99, 0]
    let expectedDay2TwoExampleThree = [2, 4, 4, 5, 99, 9801]
    testIntCode(initial: &dayTwoExampleThree, expectedResult: expectedDay2TwoExampleThree)
    
    var dayTwoExampleFour = [1, 1, 1, 4, 99, 5, 6, 0, 99]
    let expectedDay2TwoExampleFour = [30, 1, 1, 4, 2, 5, 6, 0, 99]
    testIntCode(initial: &dayTwoExampleFour, expectedResult: expectedDay2TwoExampleFour)
} else {
	main()
}
