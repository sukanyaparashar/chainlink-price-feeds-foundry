// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

/*interface AggregatorV3Interface {
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
    function getNeonSolPrice(address priceFeedAddress) external view returns (int256){
        (, int256 price, , , ) = AggregatorV3Interface(
            priceFeedAddress
        ).latestRoundData();
        return price;
    }

    function getNeonSolDecimals(address priceFeedAddress) external view returns (uint8){
        uint8 decimal = AggregatorV3Interface(
            priceFeedAddress
        ).decimals();
        return decimal;
    }

    function getNeonSolDescription(address priceFeedAddress) external view returns (string memory){
        string memory description = AggregatorV3Interface(
            priceFeedAddress
        ).description();
        return description;
    }

    function getNeonSolVersion(address priceFeedAddress) external view returns (uint256){
        uint256 version = AggregatorV3Interface(
            priceFeedAddress
        ).version();
        return version;
    }
}*/
