import { ethers } from "hardhat";

async function main() {
  
  const CorrientesHero = await ethers.getContractFactory("CorrientesHero");

  const corrientesHero = await CorrientesHero.deploy();

  await corrientesHero.deployed();

  
  console.log("CorrientesHero deployed address:", corrientesHero.address);

  /* await rooftopCoin.send(
    "0x70997970C51812dc3A010C7d01b50e0d17dc79C8",
    ethers.utils.parseEther("2")
  );

  console.log(await rooftopCoin.getBalance("0x70997970C51812dc3A010C7d01b50e0d17dc79C8"));

  console.log(await rooftopCoin.getBalance(await rooftopCoin.owner())); */

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
