
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

    	bool isValid = checkValidity(row,col);

    	if(isValid)
    	{

    	}


    }

	


}

   

