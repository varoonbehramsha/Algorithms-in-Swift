
// Write a function that accepts a 2-dimensional array of integers, a new number to place, and a position to start. You should read the existing number at the start position, change it to the new number, then change any surrounding numbers that matched the start number, and so on, like a flood fill algorithm in Photoshop.


//Using a loop
func fill(matrix:[[Int]],with newNumber:Int,startingAt position:(Int,Int)) ->  [[Int]]
{
    var grid = [[Int]]()
    grid.append(contentsOf: matrix)
    guard grid.count > 1 else
    {
        return [[Int]]()
    }

    let numToReplace = grid[position.0][position.1]
    
    var positions = [position]

    while !positions.isEmpty
    {
        let p = positions.removeFirst()
        if p.0 >= 0 && p.0 < grid.count && p.1 >= 0 && p.1 < grid[0].count
        {
   
         let numInPosition = grid[p.0][p.1]
        
            if numInPosition == numToReplace
            {
                grid[p.0][p.1] = newNumber
                positions.append(contentsOf: [(p.0,p.1+1),(p.0,p.1-1),(p.0+1,p.1),(p.0-1,p.1)])
            }
            
        
        }
    }

    
    return grid
}

//Reccursive function
func fill(grid:inout [[Int]], with newNumber:Int,at position:(x:Int,y:Int),replacing numToReplace:Int?=nil)
{
    //Check if input values are valid
    guard grid.count > 1, position.x >= 0 && position.x < grid.count && position.y >= 0 && position.y < grid[position.x].count else
    {
        return
    }
    
    
    let n = numToReplace ?? grid[position.x][position.y]
    
    if grid[position.x][position.y] == n
    {
        grid [position.x][position.y] = newNumber
        
        //Fill surrounding positions
        fill(grid: &grid, with: newNumber, at: (position.x,position.y+1), replacing: n)
        fill(grid: &grid, with: newNumber, at: (position.x,position.y-1), replacing: n)
        fill(grid: &grid, with: newNumber, at: (position.x+1,position.y), replacing: n)
        fill(grid: &grid, with: newNumber, at: (position.x-1,position.y), replacing: n)


    }
}

var grid = [[0,1,1,1],[0,0,1,0],[0,1,1,0]]

fill(matrix: grid, with: 3, startingAt: (0, 0))
fill(grid: &grid, with: 2, at: (0,1), replacing: nil)

