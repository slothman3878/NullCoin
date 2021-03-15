const NullCoin = artifacts.require("NullCoin");

// Change values of "Null Coin" and "ENC" to whatever you please.
module.exports = function (deployer) {
  deployer.deploy(NullCoin, "Null Coin", "ENC", 1000);
};
