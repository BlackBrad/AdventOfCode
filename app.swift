import Foundation

// Gives the fuel requred for launch for a given module 
// As well as caluclates fuel for the extra mass that 
// the fuel for each module needs.
func requiredLaunchFuel(mass: Int) -> Int {
	// division returns a Double but the function returns an int so 
	// convert the ouput of floor into an integer
	let fuel = Int(floor(Double(mass) / 3) - 2)
	if fuel < 1 { 
		return 0
	} else {
		return fuel + requiredLaunchFuel(mass: fuel)
	}
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
		
		print("Total Required Fuel is: \(total_fuel)")

	} catch let error as NSError{
		print("Exception: \(error)")
	}
}

main()
