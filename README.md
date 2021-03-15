# NullCoin

**A virtually worthless <a href="https://ethereum.org/en/developers/docs/standards/tokens/erc-20/">ERC20</a> token.**
* There are exactly $2^{256} - 1$ coins &ndash; maximum uint256 &ndash; in "circulation".
* Coins cannot be minted nor burned.
* While this is an ERC20 token, decimals are negligible for obvious reasons.
* ```./contracts/SafeMath.sol``` was taken from the <a href="https://openzeppelin.com/contracts/">OpenZeppelin</a> contracts library.
* Function names are taken after those of the equilvalent functions in <a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol">@OpenZeppelin/contracts/contracts/token/ERC20/ERC20.sol</a>

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
4. Test away.
5. Miscellaneous commands for ```truffle(develop)``` that are useful.
   - Instance of contract
       ```
       > enc = await NullCoin.deployed()
       ```
   - Getting an array of the truffle test accounts
       ```
       > let accounts = await web3.eth.getAccounts()
