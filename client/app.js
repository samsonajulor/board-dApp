// Contract address and ABI (update with your contract details)
const contractAddress = '0x3961D75424804db67024F6397732525f2614948f';
const contractABI = [
  {
    inputs: [],
    stateMutability: 'nonpayable',
    type: 'constructor',
  },
  {
    inputs: [],
    name: 'BOARD_SIZE_X',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'BOARD_SIZE_Y',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    name: 'board',
    outputs: [
      {
        internalType: 'string',
        name: '',
        type: 'string',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    name: 'colors',
    outputs: [
      {
        internalType: 'string',
        name: '',
        type: 'string',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'x',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: 'y',
        type: 'uint256',
      },
    ],
    name: 'getColor',
    outputs: [
      {
        internalType: 'string',
        name: '',
        type: 'string',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'x',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: 'y',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: 'color',
        type: 'uint256',
      },
    ],
    name: 'setColor',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
];

// MetaMask setup
async function connectToMetaMask() {
  if (window.ethereum) {
    try {
      await window.ethereum.enable();
      alert('Connected to MetaMask!');
    } catch (error) {
      console.error('MetaMask connection error:', error);
    }
  } else {
    alert('MetaMask not detected. Please install MetaMask.');
  }
}

// Set Color function
async function setColor() {
  const x = parseInt($('#xCoordinate').val());
  const y = parseInt($('#yCoordinate').val());
  const color = parseInt($('#color').val());

  if (!isNaN(x) && !isNaN(y) && !isNaN(color)) {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const contract = new ethers.Contract(contractAddress, contractABI, signer);

    try {
      await contract.setColor(x, y, color);
      $('#result').text(`Color set successfully at (${x}, ${y})`);
    } catch (error) {
      $('#result').text(`Error setting color: ${error.message}`);
    }
  } else {
    $('#result').text('Invalid input. Please check the coordinates and color.');
  }
}

// Get Color function
async function getColor() {
  const x = parseInt($('#getXCoordinate').val());
  const y = parseInt($('#getYCoordinate').val());

  if (!isNaN(x) && !isNaN(y)) {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const contract = new ethers.Contract(contractAddress, contractABI, provider);

    try {
      const color = await contract.getColor(x, y);
      $('#result').text(`Color at (${x}, ${y}): ${color}`);
    } catch (error) {
      $('#result').text(`Error retrieving color: ${error.message}`);
    }
  } else {
    $('#result').text('Invalid input. Please check the coordinates.');
  }
}

function generateGrid() {
  const gridContainer = $('.grid-container');

  for (let y = 0; y < 5; y++) {
    for (let x = 0; x < 7; x++) {
      const gridItem = $('<div></div>').addClass('grid-item').attr('data-x', x).attr('data-y', y);

      gridContainer.append(gridItem);
    }
  }
}

$(document).ready(function () {
  $('#connectButton').click(connectToMetaMask);
  $('#setColorButton').click(setColor);
  $('#getColorButton').click(getColor);
  generateGrid();
});
