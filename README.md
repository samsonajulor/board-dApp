# ColorBoard Contract Readme

## ADDRESS AT: 0xc210319Fdd691Bdd17C98Cc9821f4BEe2A4e1443

## Overview

The `ColorBoard` contract is a Solidity smart contract that represents a virtual 2D color board with a predefined size of 5x7. Users can interact with this contract to set and retrieve colors for specific coordinates on the board.

### Key Features

- Predefined Color Board: The contract is initialized with a predefined 5x7 color board. Each cell on the board contains a color, and the colors are predefined.

- Color Management: Users can set and retrieve colors for specific coordinates (X, Y) on the board.

- Safety Measures: The contract uses SafeMath for arithmetic operations, ensuring secure handling of numbers.

## Contract Details

### Constants

- `BOARD_SIZE_X`: The constant that defines the width of the color board, set to 5.

- `BOARD_SIZE_Y`: The constant that defines the height of the color board, set to 7.

### Storage Variables

- `colors`: A public mapping that associates color indices with their corresponding color names.

- `board`: A dynamic 2D array of strings that represents the color board. The dimensions are determined by `BOARD_SIZE_X` and `BOARD_SIZE_Y`.

### Constructor

The constructor initializes the color board with predefined colors in a checkerboard pattern:

- Rows 0, 2, 4, and 6 contain "White," "Red," "White," and "Red" alternately.

- Rows 1, 3, and 5 contain "Black," "White," and "Black" alternately.

### Public Functions

1. `setColor(uint x, uint y, uint color)`: Allows users to set a color at a specific coordinate on the color board. It validates that the provided coordinates and color index are within valid ranges.

2. `getColor(uint x, uint y)`: Allows users to retrieve the color at a specific coordinate on the color board. It validates that the provided coordinates are within valid ranges.

## Usage

Users can interact with the `ColorBoard` contract to:

- Set colors at specific coordinates using the `setColor` function.

- Retrieve colors at specific coordinates using the `getColor` function.

## Prerequisites

- run `yarn` to initialize dependencies.

## Contract Deployment

- This contract has been deployed to the Sepolia Testnest
[contract address](https://sepolia.etherscan.io/address/0xc210319Fdd691Bdd17C98Cc9821f4BEe2A4e1443)

- RUN `npx hardhat run scripts/deploy.ts --network sepolia` from the src dir to deploy the contract.

## UI Deployment
- This contract is deployed to gh pages.
[gh page](https://samsonajulor.github.io/board-dApp/)
- RUN `yarn deploy` from the client dir to deploy the frontend.
