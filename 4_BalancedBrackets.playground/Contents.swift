//Write a function that accepts a string containing the characters (, [, {, <, >, }, ], and ) in any arrangement and frequency. It should return true if the brackets are opened and closed in the correct order, and if all brackets are closed. Any other input should false.


func doesHaveBalancedBrackets(string:String) -> Bool {
    let brackets = "{}<>[]()"
    let bracketPairing = ["{":"}","<":">","[":"]","(":")"]
    if string.count == 0 {
        return true
    }
    
    
    if !string.contains(where: { (character) -> Bool in
        brackets.contains(character)}) {
        return false
    }
    
    var openBrackets = [Character]()
    for character in string {
        if bracketPairing.keys.contains(String(character))
        {
            // Open bracket
            openBrackets.append(character)
        }else
        {
            // Closed Bracket...check if it was opened
            if openBrackets.count != 0
            {
                
                if String(character) == bracketPairing[String(openBrackets.last!)]
                {
                    openBrackets.removeLast()
                }else
                {
                    return false
                }
            }
        }
    }
    if openBrackets.count != 0 {
        return false
    }
    
    return true
    
}
doesHaveBalancedBrackets(string: "{<>}[](<{}>)<>")
doesHaveBalancedBrackets(string: "}}}")
doesHaveBalancedBrackets(string: "{<[")
doesHaveBalancedBrackets(string: "")
doesHaveBalancedBrackets(string: "asde")

