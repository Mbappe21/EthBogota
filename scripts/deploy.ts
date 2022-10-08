import { ethers } from "hardhat";

async function main() {
  const SimpleWalletDeployer = await ethers.getContractFactory(
      "SimpleWalletDeployer"
  );
  const simpleWalletDeployer = await SimpleWalletDeployer.deploy();
  await simpleWalletDeployer.deployed();

  console.log(
      `deployed to ${simpleWalletDeployer.address}`
  );

  const entryPoint = "0x602aB3881Ff3Fa8dA60a8F44Cf633e91bA1FdB69";
  const owner = "0x91AdDB0E8443C83bAf2aDa6B8157B38f814F0bcC";

  const bytes = ethers.utils.toUtf8Bytes("test");
  const salt = ethers.utils.keccak256(bytes);
  const simpleWallet = await simpleWalletDeployer.deployWallet(entryPoint, owner, salt);
  console.log("SimpleWallet: ", simpleWallet);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
