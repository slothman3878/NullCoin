# NullCoin

**A virtually worthless ERC20 token.**
* There are exactly $2^{256} - 1$ coins &ndash; maximum uint256 &ndash; in "circulation".
* Coins cannot be destroyed or minted. It's just not computationally plausible.
* ```./contracts/SafeMath.sol``` was taken from the <a href="https://openzeppelin.com/contracts/">OpenZeppelin</a> contracts library.

Not sure what I want to do with this... yet...<br />

## Instructions
### Basic Testing Using Truffle

1. Install then initiate <a href="https://www.trufflesuite.com/">Truffle</a>.
    ```
    $ npm install -g truffle
    $ truffle init
    ```
2. Copy paste ```./contracts``` from repo into directory.
3. Run the following to deploy the contracts to the local Truffle network.
   ```
   $ truffle develop
   > compile
   > migrate
   ```