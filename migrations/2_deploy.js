//const SafeMath = artifacts.require("SafeMath");
const NullCoin = artifacts.require("NullCoin");

module.exports = function (deployer) {
  //deployer.deploy(SafeMath);
  deployer.deploy(NullCoin, "Null Coin", "ENC");
};
