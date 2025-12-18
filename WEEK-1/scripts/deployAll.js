// scripts/deployAll.js
async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const Hello = await ethers.getContractFactory("HelloWorld");
  const hello = await Hello.deploy("Hi from Sepolia!");
  await hello.deployed();
  console.log("Hello deployed to:", hello.address);

  const Counter = await ethers.getContractFactory("Counter");
  const counter = await Counter.deploy();
  await counter.deployed();
  console.log("Counter deployed to:", counter.address);

  const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
  const simpleStorage = await SimpleStorage.deploy();
  await simpleStorage.deployed();
  console.log("SimpleStorage deployed to:", simpleStorage.address);

  const OwnablePattern = await ethers.getContractFactory("OwnablePattern");
  const ownable = await OwnablePattern.deploy();
  await ownable.deployed();
  console.log("OwnablePattern deployed to:", ownable.address);

  const EtherTransfer = await ethers.getContractFactory("EtherTransfer");
  const etherTransfer = await EtherTransfer.deploy();
  await etherTransfer.deployed();
  console.log("EtherTransfer deployed to:", etherTransfer.address);

  const AccountOwnership = await ethers.getContractFactory("AccountOwnership");
  const acctOwn = await AccountOwnership.deploy();
  await acctOwn.deployed();
  console.log("AccountOwnership deployed to:", acctOwn.address);

  const StudentRegistration = await ethers.getContractFactory("StudentRegistration");
  const studentReg = await StudentRegistration.deploy();
  await studentReg.deployed();
  console.log("StudentRegistration deployed to:", studentReg.address);

  const SimpleVoting = await ethers.getContractFactory("SimpleVoting");
  const simpleVoting = await SimpleVoting.deploy();
  await simpleVoting.deployed();
  console.log("SimpleVoting deployed to:", simpleVoting.address);

  const InternshipTaskStatus = await ethers.getContractFactory("InternshipTaskStatus");
  const internTasks = await InternshipTaskStatus.deploy();
  await internTasks.deployed();
  console.log("InternshipTaskStatus deployed to:", internTasks.address);
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});
