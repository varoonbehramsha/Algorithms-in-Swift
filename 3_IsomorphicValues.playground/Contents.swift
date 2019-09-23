//Write a function that accepts two values and returns true if they are isomorphic. That is, each part of the value must map to precisely one other, but that might be itself. Strings A and B are considered isomorphic if you can replace all instances of each letter with another. For example, “tort” and “pump” are isomorphic, because you can replace both Ts with a P, the O with a U, and the R with an M. For integers you compare individual digits, so 1231 and 4564 are isomorphic numbers. For arrays you compare elements, so [1, 2, 1] and [4, 8, 4] are isomorphic. 


func isIsomorphic(val1:Any,val2:Any) -> Bool {
    let string1 = String(describing: val1)
    let string2 = String(describing: val2)
    if string1.count != string2.count
    {
        return false
    }
    var mappings = [Character:Character]()
    
    for (i,character) in string1.enumerated()
    {
        if !mappings.keys.contains(character)
        {
            if mappings.values.contains(Array(string2)[i])
            {
                return false
            }
            mappings[character] = Array(string2)[i]
        }else
        {
            if mappings[character] != Array(string2)[i]
            {
                return false
            }
        }
    }
    return true
}

isIsomorphic(val1: "tort", val2: "pump")
isIsomorphic(val1: 121, val2: 424)
isIsomorphic(val1: "qwe", val2: "hyh")
isIsomorphic(val1: 666, val2: 43)
