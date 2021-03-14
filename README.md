# NullCoin

**A virtually worthless ERC20 token.**
* There are exactly $2^{256} - 1$ coins &ndash; maximum uint256 &ndash; in "circulation".
* Coins cannot be destroyed or minted.

Not sure what I want to do with this... yet...
SafeMath.sol was taken from the OpenZeppelin contracts.

### Testing Using Truffle

1. Install then initiate <a href="https://www.trufflesuite.com/">Truffle</a>.
    ```
    $ npm install -g truffle
    $ truffle init
    ```
2. Copy paste ```contracts``` frome repo into directory.
3. Run the following to deploy the contracts to the local Truffle network.
   ```
   $ truffle develop
   > compile
   > migrate
   ```
