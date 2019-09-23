
//Write an extension for Array having a function to sort its elements using the Insertion Sort algorithm.

extension Array where Element : Comparable
{
    func sortElements() -> [Element]{
        
        guard self.count > 1 else{return self}
        
        var sortedArray = [Element]()
        
        for element in self {
            var index  = 0
            for j in 0 ..< sortedArray.count {
                if element > sortedArray[j] {
                    index+=1
                }else
                {break}
                
                
            }
            sortedArray.insert(element, at: index)
        }
        return sortedArray
    }
    
}
[3,8,2,9,7,5].sortElements()

