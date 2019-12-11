func generatePasswordRange(range: String){
    let rangeSymbolIndex = range.firstIndex(of: "-")
    let lowerBound = range[..<rangeSymbolIndex]
    let upperBound = range[rangeSymbolIndex<..]
    print(upperBound)
}

func getInput() -> String{
    let file_path = "./AOC_Day4_PasswordRange.txt"
    do {
        let fileContents = try String(contentsOfFile: file_path, encoding: .utf8)
        return fileContents.trimmingCharacters(in: .whitespacesAndNewlines)
    } catch let error as NSError{
        print("Exception: \(error)")
    }
    return ""
}

let temp = getInput()
print("Temp is \(temp)")
generatePasswordRange(range: temp)
