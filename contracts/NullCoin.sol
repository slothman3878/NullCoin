// SPDX-License-Identifier: MPL-2.0

pragma solidity ^0.8.0;

import {SafeMath} from "./SafeMath.sol";

contract NullCoin {
    //Maximum uint256
    uint256 constant MAX_INT = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

    using SafeMath for uint256;

    string private _name;
    string private _symbol;
    //private uint8 _decimals;
    uint256 private _totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor() {
        _name = "Null Coin";
        _symbol = "ENC";
        _totalSupply = MAX_INT;

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function name() public view returns (string memory) { return _name; }

    function symbol() public view returns (string memory) { return _symbol; }

    //function decimals() public view returns (uint8)

    function totalSupply() public view returns (uint256) { return _totalSupply; }

    function balanceOf(address _owner) public view returns (uint256 balance) { return balances[_owner]; }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        (bool _success, uint256 _remainder) = balances[msg.sender].trySub(_value);
        if(_success) {
            balances[msg.sender] = _remainder;
            (, balances[_to]) = balances[_to].tryAdd(_value);
            emit Transfer(msg.sender, _to, _value);
        }
        return _success;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        (bool _success, uint256 _allowance_remainder) = allowed[_from][_to].trySub(_value);
        if(_success) {
            allowed[_from][_to] = _allowance_remainder;
            (, balances[_from]) = balances[_from].trySub(_value);
            (, balances[_to]) = balances[_to].tryAdd(_value);
            emit Transfer(_from, _to, _value);
        }
        return _success;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) { return allowed[_owner][_spender]; }
}