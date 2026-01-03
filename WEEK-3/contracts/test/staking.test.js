const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Staking', function () {
  let owner, alice, bob;
  let MockERC20, mockA, mockB, Staking, staking;

  beforeEach(async () => {
    [owner, alice, bob] = await ethers.getSigners();
    MockERC20 = await ethers.getContractFactory('MockERC20');
    mockA = await MockERC20.deploy('StakeToken', 'STK', 18);
    await mockA.deployed();
    mockB = await MockERC20.deploy('RewardToken', 'RWD', 18);
    await mockB.deployed();

    // mint some tokens to alice and owner
    await mockA.mint(alice.address, ethers.parseUnits('1000', 18));
    await mockB.mint(owner.address, ethers.parseUnits('10000', 18));

    Staking = await ethers.getContractFactory('Staking');
    const rate = ethers.parseUnits('0.0000001', 18);
    staking = await Staking.deploy(mockA.target, mockB.target, rate);
    await staking.deployed();

    // owner funds reward pool
    await mockB.connect(owner).approve(staking.target, ethers.parseUnits('10000', 18));
    await staking.connect(owner).fundRewards(ethers.parseUnits('10000', 18));
  });

  it('stake -> accumulate rewards -> claim', async function () {
    // alice approves
    await mockA.connect(alice).approve(staking.target, ethers.parseUnits('100', 18));
    await staking.connect(alice).stake(ethers.parseUnits('100', 18));

    // move time forward
    await ethers.provider.send('evm_increaseTime', [3600]); // +1 hour
    await ethers.provider.send('evm_mine');

    const pending = await staking.pendingReward(alice.address);
    expect(pending).to.be.gt(0);

    const before = await mockB.balanceOf(alice.address);
    await staking.connect(alice).claimRewards();
    const after = await mockB.balanceOf(alice.address);
    expect(after).to.be.gt(before);
  });
});
