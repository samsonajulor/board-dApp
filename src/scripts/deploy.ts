import { ethers } from "hardhat";

async function main() {
  const ColorBoard = await ethers.deployContract('ColorBoard', []);

  await ColorBoard.waitForDeployment();

  console.log(
    `ColorBoard deployed to ${ColorBoard.target}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
