

// There are M different ways you can place N queens on an NxN chessboard so that none of them are able to capture others. Write a function that calculates them all and prints them to the screen as a visual board layout, and returns the number of solutions it found.

func numberOfPlacementsInBoard(_ board:[Int],queen queenNumber:Int) -> Int
{
    if queenNumber == board.count
    {
        print("Solution : \(board)")
        // All queens placed...print out solution
        for row in 0..<board.count
        {
            for column in 0..<board.count
            {
                print("\(board[row] == column ? "Q":"_")", terminator:"")
            }
            print("")
        }
        print("")
        return 1
    }else{
        var count = 0
        
        boardloop: for column in 0..<board.count
        {
            for row in 0 ..< queenNumber
            {
                let columnWithQueen = board[row]
                
                if column == columnWithQueen
                {
                    //Column already used
                    continue boardloop
                }
                
                let deltaRow = row - queenNumber
                let deltaColumn = columnWithQueen - column
                
                if deltaRow == deltaColumn || deltaRow == -deltaColumn
                {
                    continue boardloop
                }
                
            }
            //Column available for placement
            var boardCopy = board
            boardCopy[queenNumber] = column
            count += numberOfPlacementsInBoard(boardCopy, queen: queenNumber+1)
            
        }
        
        return count
    }
    
}

let board = [Int](repeating: 0, count: 8)
numberOfPlacementsInBoard(board, queen: 0)
