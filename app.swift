import Foundation

// Gives the fuel requred for launch for a given module 
func requiredLaunchFuel(mass: Int) -> Int {
	return Int(floor(Double(mass) / 3) - 2)
}

func main(){
	let file_path = "./AOC_Day1_mass.txt" // Path to the provided file of all module masses
	var total_fuel = 0
	do {
		let fileContents = try String(contentsOfFile: file_path, encoding: .utf8)
		let massArray = fileContents.trimmingCharacters(in: .whitespacesAndNewlines) // Trim whitespace and newlines
								.components(separatedBy: "\n") // Split the string my new lines
								.map({Int($0) ?? 0}) // Convert the array to an array of ints

		for mass in massArray{
			total_fuel += requiredLaunchFuel(mass: mass)	
		}
		
		print("Total Required Fuel if: \(total_fuel)")

	} catch let error as NSError{
		print("Exception: \(error)")
	}
}

main()
