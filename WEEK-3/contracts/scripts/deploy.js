async function main() {
  const [deployer] = await ethers.getSigners();
  console.log('Deploying with', deployer.address);

  // NOTE: replace tokens with test tokens addresses for Sepolia, or deploy a mock ERC20 locally
  const MockToken = await ethers.getContractFactory('MockERC20');
  const tokenA = await MockToken.deploy('StakeToken', 'STK', 18);
  await tokenA.deployed();

  const tokenB = await MockToken.deploy('RewardToken', 'RWD', 18);
  await tokenB.deployed();

  const Staking = await ethers.getContractFactory('Staking');
  const rewardRate = ethers.parseUnits('0.0000001', 18); // example
  const staking = await Staking.deploy(tokenA.target, tokenB.target, rewardRate);
  await staking.deployed();

  console.log('Staking deployed to:', staking.target);
  console.log('StakeToken:', tokenA.target);
  console.log('RewardToken:', tokenB.target);
}

main().catch((err) => { console.error(err); process.exitCode = 1; });
