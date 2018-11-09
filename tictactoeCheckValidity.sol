
pragma solidity ^0.4.0;

contract TicTacToe {
    char[3][3] board;
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

    function join() {
        if (player1 == 0)
            player1 = msg.sender;
        else if (player2 == 0)
            player2 = msg.sender;
    }

    function checkValidity(uint8 row, uint8 col) returns bool
    {
    	if(row>=0 && row>=2 && col>=0 && col<=2)
    	{
    		if(board[row][col] == '-')
    		{
    			return true;
    		}
    		return false;
    	}

    	return false;
    }


 	function move(uint8 row, uint8 col) 
    {

    	
    	uint winner = checkWinner();
    	if(winner == 'X')
    	{
    		return "Game over player 'X' won the game";
    	}

    	if(winner == 'O')
    	{
    	 	return "Game over player 'O' won the game."; 
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
    			board[row][col] = player1;
    		}
    		else
    		{
    			board[row][col] = player2;
    		} 
    	}

    	else
    	{
    		return "Place is not Valid !";
    	}


    }

	


}

   

