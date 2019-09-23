
// Create a function that detects whether either player has won in a game of tic-tac-toe.

func hasWonTicTacToe(_ matrix:[[String]]) -> Bool
{
    guard matrix.count == 3 else {
        return false
    }
    
    func isWin(_ first:String,_ second:String,_ third:String) -> Bool
    {
        guard first != "" else {
            return false
        }
        return first == second && second == third
    }
    
    for i in 0...2
    {
        //Check row
        if isWin(matrix[i][0], matrix[i][1], matrix[i][2])
        {
            return true
        }
        
        //Check column
        if isWin(matrix[0][i], matrix[1][i], matrix[2][i])
        {
            return true
        }
        
        
    }
    //Check Diagonals
    return isWin(matrix[0][0], matrix[1][1], matrix[2][2]) || isWin(matrix[0][2], matrix[1][1], matrix[2][0])
    
}

hasWonTicTacToe([["X","",""],["","X",""],["X","","X"]])
hasWonTicTacToe([["O","",""],["O","X",""],["O","","X"]])
