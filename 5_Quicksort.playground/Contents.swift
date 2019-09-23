
// Create an extenstion for Array to sort it's items using the quicksort algorithm

import Foundation

extension Array where Element : Comparable
{
    func qsort() -> [Element]
    {
        guard self.count > 1 else
        {
            return self
        }
        
        let pivot = self[Int(arc4random_uniform(UInt32(count)))] //self[count/2]
        
        var smallerValues = [Element]()
        var equalValues = [Element] ()
        var greaterValues = [Element]()
        
        smallerValues = self.filter({$0 < pivot})
        equalValues = self.filter({$0 == pivot})
        greaterValues = self.filter({$0 > pivot})
//        for item in self
//        {
//            if item < pivot
//            {
//                smallerValues.append(item)
//            }else if item > pivot
//            {
//                greaterValues.append(item)
//            }else
//            {
//                equalValues.append(item)
//            }
//        }
        return smallerValues.qsort() + equalValues + greaterValues.qsort()
    }
}


[7,2,5,6,1].qsort()
["t","r","a","f"].qsort()
