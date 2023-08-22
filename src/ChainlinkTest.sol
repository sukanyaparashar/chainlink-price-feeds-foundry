// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

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

contract ChainlinkTest {

    AggregatorV3Interface internal priceFeed;

    constructor(address _feedAddress) {
        priceFeed = AggregatorV3Interface(
            _feedAddress
        );
    }

    function getNeonSolPrice() external view returns (int256){
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return price;
    }

    function getNeonSolDecimals() external view returns (uint8){
        uint8 decimal = priceFeed.decimals();
        return decimal;
    }

    function getNeonSolDescription() external view returns (string memory){
        string memory description = priceFeed.description();
        return description;
    }

    function getNeonSolVersion() external view returns (uint256){
        uint256 version = priceFeed.version();
        return version;
    }
}
