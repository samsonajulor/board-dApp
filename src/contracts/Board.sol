// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ColorBoard {
    using SafeMath for uint256; // Use SafeMath for uint256

    uint public constant BOARD_SIZE_X = 5; // 7 columns
    uint public constant BOARD_SIZE_Y = 7; // 5 rows

    mapping(uint => string) public colors;

    // Define the board as a DYNAMIC 2D array of strings
    string[BOARD_SIZE_X][BOARD_SIZE_Y] public board;

    constructor() {
         // Initialize the board with predefined colors
    board[0][0] = "White";
    board[1][0] = "Black";
    board[2][0] = "Red";
    board[3][0] = "Black";
    board[4][0] = "White";
    board[5][0] = "Red";
    board[6][0] = "Black";

    board[0][1] = "Red";
    board[1][1] = "Black";
    board[2][1] = "White";
    board[3][1] = "Red";
    board[4][1] = "Black";
    board[5][1] = "White";
    board[6][1] = "Black";

    board[0][2] = "White";
    board[1][2] = "Red";
    board[2][2] = "Black";
    board[3][2] = "White";
    board[4][2] = "Black";
    board[5][2] = "Red";
    board[6][2] = "White";

    board[0][3] = "Black";
    board[1][3] = "White";
    board[2][3] = "Red";
    board[3][3] = "Black";
    board[4][3] = "White";
    board[5][3] = "Black";
    board[6][3] = "Red";

    board[0][4] = "Red";
    board[1][4] = "Black";
    board[2][4] = "White";
    board[3][4] = "Red";
    board[4][4] = "Black";
    board[5][4] = "White";
    board[6][4] = "Black";
}

    function setColor(uint x, uint y, uint color) public {
        require(x < BOARD_SIZE_X, "Invalid X coordinate");
        require(y < BOARD_SIZE_Y, "Invalid Y coordinate");
        require(color < 3, "Invalid color"); // Make sure color is in the range [0, 2]

        board[x][y] = colors[color];
    }

    function getColor(uint x, uint y) public view returns (string memory) {
        require(x < BOARD_SIZE_X, "Invalid X coordinate");
        require(y < BOARD_SIZE_Y, "Invalid Y coordinate");

        return board[x][y];
    }
}
