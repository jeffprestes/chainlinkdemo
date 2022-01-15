// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./chainlink-v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     * Network: Mumbai
     * Aggregator: SOYA/USD
     * Address: 0xBe6Cf84b9468d70526a3B61549BD67738316C24C
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0xBe6Cf84b9468d70526a3B61549BD67738316C24C);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (uint80, int, uint, uint, uint80) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return (roundID, price, startedAt, timeStamp, answeredInRound);
    }
}