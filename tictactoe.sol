pragma solidity ^0.4.0;

contract TicTacToe {
    uint[3][3] board;
    address manager, player1, player2;

    function TicTacToe() {
        manager = address(this);
    }

}
