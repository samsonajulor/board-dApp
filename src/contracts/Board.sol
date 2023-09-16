// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract ColorBoard {
    uint256 public constant BOARD_SIZE_X = 7; // 7 columns
    uint256 public constant BOARD_SIZE_Y = 5; // 5 rows

    mapping(uint256 => string) public colors;

    // Define the board as a 2D array of strings
    string[BOARD_SIZE_X][BOARD_SIZE_Y] public board;

    constructor() {
        // Initialize colors
        colors[1] = "White";
        colors[2] = "Black";
        colors[3] = "Red";
        colors[4] = "Black";

        // Initialize the board with random colors
        for (uint256 x = 0; x < BOARD_SIZE_X; x++) {
            for (uint256 y = 0; y < BOARD_SIZE_Y; y++) {
                // uint256 randomValue = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, x, y)));
                // uint256 randomColor = randomValue % 3 + 1;
                // string memory color_ = colors[randomColor];
                // board[x][y] = color_;
            }
        }
    }

    function setColor(uint256 x, uint256 y, uint256 color) public {
        require(x < BOARD_SIZE_X, "Invalid X coordinate");
        require(y < BOARD_SIZE_Y, "Invalid Y coordinate");
        require(color < 3, "Invalid color"); // Make sure color is in the range [0, 2]

        board[x][y] = colors[color];
    }

    function getColor(uint256 x, uint256 y) public view returns (string memory) {
        require(x < BOARD_SIZE_X, "Invalid X coordinate");
        require(y < BOARD_SIZE_Y, "Invalid Y coordinate");

        return board[x][y];
    }
}
