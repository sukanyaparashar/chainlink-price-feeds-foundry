// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/ChainlinkTest.sol";
import {console} from "forge-std/console.sol";

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract ChainlinkTestTest is Test {

    function testNeonSol1() public {
        (, int256 price, , , ) = AggregatorV3Interface(
            0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d
        ).latestRoundData();
        emit log_named_int("Price:", price);
    }

    function testNeonSol2() public {
        uint8 decimals = AggregatorV3Interface(
            0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d
        ).decimals();
        emit log_named_uint("Decimals:", decimals);
    }

    function testNeonSol3() public {
        string memory description = AggregatorV3Interface(
            0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d
        ).description();
        emit log_named_string("Description:", description);
    }

    function testNeonSol4() public {
        uint256 version = AggregatorV3Interface(
            0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d
        ).version();
        emit log_named_uint("Version:", version);
    }

    /******** With contract *********/

    //ChainlinkTest public priceFeed;

    /*function setUp() public {
        priceFeed = new ChainlinkTest();
        console.log("Price Feed Address:", address(priceFeed));
    }*/

    /*function testNeonSol5() public {
        int256 price = priceFeed.getNeonSolPrice(0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d);
        emit log_named_int("Price:", price);
    }

    function testNeonSol6() public {
        uint8 decimals = priceFeed.getNeonSolDecimals(0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d);
        emit log_named_uint("Decimals:", decimals);
    }

    function testNeonSol7() public {
        string memory description = priceFeed.getNeonSolDescription(0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d);
        emit log_named_string("Description:", description);
    }

    function testNeonSol8() public {
        uint256 version = priceFeed.getNeonSolVersion(0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d);
        emit log_named_uint("Version:", version);
    }*/

}
