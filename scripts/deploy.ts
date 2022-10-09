import { ethers } from "hardhat";

async function main() {
  const ContributionPoolFactory = await ethers.getContractFactory(
      "ContributionPoolFactory"
  );
  const contributionPoolFactory = await ContributionPoolFactory.deploy();
  await contributionPoolFactory.deployed();

  console.log(
      `ContributionPoolFactory deployed to ${contributionPoolFactory.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
