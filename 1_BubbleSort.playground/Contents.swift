
//Write an extension for Array containing a function to sort the elements using the Bubble Sort algorithm.

extension Array where Element:Comparable
{
    func sortElements() -> [Element]
    {
        //Make a copy of the array
        var sortedArray = self
        var swapsMade = false
        
        repeat
        {
            swapsMade = false
            
            //Iterate through the array finding the position for each element. Repeat the iteration through the array until there are no more swaps made.
            for i in 0 ..< sortedArray.count - 1 {
                if sortedArray[i] > sortedArray[i+1]{
                    sortedArray.swapAt(i, i+1)
                    swapsMade = true
                }
                
            }
            
        }while swapsMade == true
        return sortedArray
        
        
    }
    
    func sortElementsFaster() -> [Element]{
        var sortedArray = self
        var highestSortedIndex = count
        
        repeat
        {
            var lastSwappedIndex = 0
            
            for i in 0 ..< highestSortedIndex - 1 {
                if sortedArray[i] > sortedArray[i+1]{
                    sortedArray.swapAt(i, i+1)
                    lastSwappedIndex = i+1
                }
                
            }
            highestSortedIndex = lastSwappedIndex
        }while highestSortedIndex != 0
        return sortedArray
        
    }
    
}
//[6,4,8,3,9,2].sortElements()
[6,4,8,3,9,2].sortElementsFaster()
