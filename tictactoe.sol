pragma solidity ^0.4.0;

contract TicTacToe {
    string[3][3] board;
    address manager, player1 = 0, player2 = 0;
    uint8 turn = 1;

    function TicTacToe() {
        manager = address(this);
        for (uint8 i = 0; i < 3; i++) {
            for (uint8 j = 0; j < 3; j++) {
                board[i][j] = '-';
            }
        }
    }

    function join() returns(string){
        if (player1 == 0)
        {
            player1 = msg.sender;
            return "You're X";
        }

        else if (player2 == 0)
        {
            player2 = msg.sender;
            return "You're O";
        }
        else
        {
            return "Players Full";
        }
    }




    function checkValidity(uint8 row, uint8 col) returns bool
    {
        if(row>=0 && row>=2 && col>=0 && col<=2)
        {
            if(board[row][col] == '-')
            {
                return true;
            }
            
        }

        return false;
    }


    // Check three values to see if they are the same. If so, we have a winner.
    function checkTriplet(string chOne, string chTwo, string chThree) returns(string){
        bool winFlag = false;
        if ((chOne == chTwo) && (chOne == chThree)) {
            winFlag =  true;
        }
        else
            winFlag = false;

        if(winFlag)
            return chOne;
        else
            return "*"; 
    }

    function checkWinner() returns(string)
    {
        // Loop through the rows
        for (int i = 0; i < 3; i++) {
        if (checkTriplet(board[i][0], board[i][1], board[i][2])==board[i][0]) {
            return board[i][0];
        }   
        }


        // Loop through the columns
        for (int i = 0; i < 3; i++) {
            if (checkTriplet(board[0][i], board[1][i], board[2][i])==board[0][i]) {
                return board[0][i];
            }
        }


        // Check diagonals
        if (checkTriplet(board[0][0], board[1][1], board[2][2])) {
            return board[0][0];
        }

        if (checkTriplet(board[0][2], board[1][1], board[2][0])) {
            return board[0][2];
        }
    }

    function move(uint8 row, uint8 col) 
    {

        
        uint winner = checkWinner();
        if(winner == 'X')
        {
            return "Game over player X won the game";
        }

        if(winner == 'O')
        {
            return "Game over player O won the game."; 
        }

        if(turn == 1)
        {
            if(msg.sender!=player1)
            {
                return "It's player1's turn";
            }

        }

        if(turn == 2)
        {
            if(msg.sender!=player2)
            {
                return "It's player2's turn";
            }

        }

        bool isValid = checkValidity(row,col);

        if(isValid)
        {
            if(msg.sender == player1)
            {
                board[row][col] = "X";
            }
            else
            {
                board[row][col] = "O";
            } 

         return print();
        }
        else
        {
            return "Invalid Move";
        }
    }



    function print() returns (string) {
        string memory output = new string(18);
        uint8 idx = 0;

        for (uint8 i = 0; i < 3; i++) {
            for (uint8 j = 0; j < 3; j++) {
                output[idx++] = board[i][j];
                output[idx++] = '|';
            }
            output[idx++] = '\n';
        }

        return output;
    }
}
