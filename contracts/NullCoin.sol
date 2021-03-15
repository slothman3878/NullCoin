// SPDX-License-Identifier: MIT
// All methods are named after the equivalent functions in @OpenZeppelin/contracts/token/ERC20/ERC20.sol

pragma solidity >=0.8.0 <0.9.0;

contract NullCoin {
    //Maximum uint256
    uint256 constant MAX_INT = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

    string private _name;
    string private _symbol;
    uint256 immutable private _totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(string memory name, string memory symbol, uint256 totalSupply) {
        _name = name;
        _symbol = symbol;
        if(totalSupply == 0) { totalSupply = MAX_INT; }
        _totalSupply = totalSupply;
        balances[msg.sender] = totalSupply; 
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function balanceOf(address _owner) public view returns (uint256 balance) { return balances[_owner]; }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        allowed[_from][_to] -= _value;
        balances[_from] -= _value;
        balances[_to] += _value;
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) { return allowed[_owner][_spender]; }

    function increaseAllowance(address _spender, uint256 _increaseValue) public returns (bool success) {
        allowed[msg.sender][_spender] += _increaseValue;
        return true;
    }

    function decreaseAllowance(address _spender, uint256 _decreaseValue) public returns (bool success) {
        allowed[msg.sender][_spender] -= _decreaseValue;
        return true;
    }
}