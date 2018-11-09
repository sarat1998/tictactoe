pragma solidity ^0.4.0;

contract TicTacToe {
    bytes32[3][3] board;
    address manager;
    address player1 = 0;
    address player2 = 0;
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




    function checkValidity(uint8 row, uint8 col) returns (bool)
    {
        if(row>=0 && row>=2 && col>=0 && col<=2)
        {
            if( keccak256(board[row][col]) == keccak256("-") )
            {
                return true;
            }
            
        }

        return false;
    }


    // Check three values to see if they are the same. If so, we have a winner.
    function checkTriplet(bytes32 chOne, bytes32 chTwo, bytes32 chThree) returns(bytes32){
        bool winFlag = false;
        if ((keccak256(chOne) == keccak256(chTwo)) && (keccak256(chOne) == keccak256(chThree))) {
            winFlag =  true;
        }
        else
            winFlag = false;

        if(winFlag)
            return chOne;
        else
            return bytes32("*"); 
    }

    function checkWinner() returns(bytes32)
    {
        // Loop through the rows
        for (uint8 i = 0; i < 3; i++) {
        if ( keccak256(checkTriplet(board[i][0], board[i][1], board[i][2]))==keccak256(board[i][0])) {
            return board[i][0];
        }   
        }


        // Loop through the columns
        for (uint8 i2 = 0; i2 < 3; i2++) {
            if (keccak256(checkTriplet(board[0][i2], board[1][i2], board[2][i2]))==keccak256(board[0][i2])) {
                return board[0][i2];
            }
        }


        // Check diagonals
        if (    keccak256(checkTriplet(board[0][0], board[1][1], board[2][2])) == keccak256(board[0][0]) ) {
            return board[0][0];
        }

        if (keccak256(checkTriplet(board[0][2], board[1][1], board[2][0]))==keccak256(board[0][2])) {
            return board[0][2];
        }
    }

    function move(uint8 row, uint8 col) returns(string)
    {

        
        bytes32 winner = checkWinner();
        if(keccak256(winner) == keccak256("X"))
        {
            return "Game over player X won the game";
        }

        if(keccak256(winner) == keccak256("O"))
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

         print();
         return "Valid Move";
        }
        else
        {
            return "Invalid Move";
        }
    }



    function print() returns (bytes32[]) {
        bytes32[] memory output = new bytes32[](18);
        uint8 idx = 0;

        for (uint8 i = 0; i < 3; i++) {
            for (uint8 j = 0; j < 3; j++) {
                output[idx++] = bytes32(board[i][j]);
                output[idx++] = '|';
            }
            output[idx++] = '\n';
        }

        return output;
    }
}
