// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/ChainlinkTest.sol";

contract ChainlinkTestTest is Test {

    ChainlinkTest public priceFeed;

    function setUp() public {
        priceFeed = new ChainlinkTest(0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d);
    }

    function testNeonSol5() public {
        int256 price = priceFeed.getNeonSolPrice();
        emit log_named_int("Price:", price);
    }

    function testNeonSol6() public {
        uint8 decimals = priceFeed.getNeonSolDecimals();
        emit log_named_uint("Decimals:", decimals);
    }

    function testNeonSol7() public {
        string memory description = priceFeed.getNeonSolDescription();
        emit log_named_string("Description:", description);
    }

    function testNeonSol8() public {
        uint256 version = priceFeed.getNeonSolVersion();
        emit log_named_uint("Version:", version);
    }

}
