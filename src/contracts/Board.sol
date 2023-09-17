// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ColorBoard {
    using SafeMath for uint256; // Use SafeMath for uint256

    uint public constant BOARD_SIZE_X = 5;
    uint public constant BOARD_SIZE_Y = 7;

    mapping(uint => string) public colors;

    // Define the board as a DYNAMIC 2D array of strings
    string[BOARD_SIZE_X][BOARD_SIZE_Y] public board;

    constructor() {
        colors[1] = "White";
        colors[2] = "Black";
        colors[3] = "Red";
        colors[4] = "Blue";

        // Initialize the board with random colors
        for (uint256 x = 0; x < BOARD_SIZE_Y; x++) {
            for (uint256 y = 0; y < BOARD_SIZE_X; y++) {
                uint256 randomValue = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, x, y)));
                uint256 randomColor = randomValue % 3 + 1;
                string memory color_ = colors[randomColor];
                board[x][y] = color_;
            }
        }
    }

    function setColor(uint x, uint y, uint color) public {
        require(x < BOARD_SIZE_X, "Invalid X coordinate");
        require(y < BOARD_SIZE_Y, "Invalid Y coordinate");
        require(color < 3, "Invalid color");

        board[x][y] = colors[color];
    }

    function getColor(uint x, uint y) public view returns (string memory) {
        require(x < BOARD_SIZE_X, "Invalid X coordinate");
        require(y < BOARD_SIZE_Y, "Invalid Y coordinate");

        return board[x][y];
    }
}
