# NullCoin

**A virtually worthless <a href="https://ethereum.org/en/developers/docs/standards/tokens/erc-20/">ERC20</a> token.**
* There are exactly $2^{256} - 1$ coins &ndash; maximum uint256 &ndash; in "circulation".
* Coins cannot be destroyed or minted. It's just not computationally plausible.
* While this is an ERC20 token, decimals are negligible for obvious reasons.
* ```./contracts/SafeMath.sol``` was taken from the <a href="https://openzeppelin.com/contracts/">OpenZeppelin</a> contracts library.

Not sure what I want to do with this... yet...<br />

## Instructions
### Basic Testing Using Truffle

1. Install then initiate <a href="https://www.trufflesuite.com/">Truffle</a>.
    ```
    $ npm install -g truffle
    $ truffle init
    ```
2. Copy paste repo files into directory where truffle was initated.
3. Run the following to deploy the contracts to the local Truffle network.
   ```
   $ truffle develop
   > compile
   > migrate
   ```