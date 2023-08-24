// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/TestERC20.sol";

contract TestERC20Test is Test {

    TestERC20 public testERC20;

    function setUp() public {
        testERC20 = new TestERC20("Test Token", "TEST");
    }

    function testDecimals() public {
        uint256 decimals = testERC20.decimals();
        emit log_named_uint("Decimals:", decimals);
    }

}
