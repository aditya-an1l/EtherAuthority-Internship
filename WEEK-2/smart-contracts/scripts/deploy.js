const { ethers } = require("hardhat");

async function main() {
  // Deploy ERC20 Tokens
  const InternRewardToken = await ethers.getContractFactory("InternRewardToken");
  const irt = await InternRewardToken.deploy();
  await irt.deployed();
  console.log("InternRewardToken deployed to:", irt.address);

  const TaskCompletionToken = await ethers.getContractFactory("TaskCompletionToken");
  const tct = await TaskCompletionToken.deploy();
  await tct.deployed();
  console.log("TaskCompletionToken deployed to:", tct.address);

  const AttendanceToken = await ethers.getContractFactory("AttendanceToken");
  const at = await AttendanceToken.deploy();
  await at.deployed();
  console.log("AttendanceToken deployed to:", at.address);

  // Deploy ERC721 NFTs
  const InternshipCertificateNFT = await ethers.getContractFactory("InternshipCertificateNFT");
  const icNft = await InternshipCertificateNFT.deploy();
  await icNft.deployed();
  console.log("InternshipCertificateNFT deployed to:", icNft.address);

  const CourseCompletionNFT = await ethers.getContractFactory("CourseCompletionNFT");
  const ccNft = await CourseCompletionNFT.deploy();
  await ccNft.deployed();
  console.log("CourseCompletionNFT deployed to:", ccNft.address);

  const AchievementBadgeNFT = await ethers.getContractFactory("AchievementBadgeNFT");
  const abNft = await AchievementBadgeNFT.deploy();
  await abNft.deployed();
  console.log("AchievementBadgeNFT deployed to:", abNft.address);

  // Deploy NFTMinter with NFT addresses
  const NFTMinter = await ethers.getContractFactory("NFTMinter");
  const minter = await NFTMinter.deploy(icNft.address, ccNft.address, abNft.address);
  await minter.deployed();
  console.log("NFTMinter deployed to:", minter.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
