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

    function move(uint8 row, uint8 col) {
        if (board[row - 1][col - 1] == '-') {

        }
    }
}
