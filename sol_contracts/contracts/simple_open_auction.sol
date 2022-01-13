// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.11;

contract SimpleAuction {

    address payable public beneficiary;
    uint public auctionEndTime;

    //current state of the auction
    address public highestBidder;
    uint public highestBid;

    //allowed withdrawals of previous bids
    mapping(address => uint) pendingReturns;

    // disallows any change, default false
    bool ended;

    // events that will be emitted on changes
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // errors
    error AuctionAlreadyEnded();
    error BidNotHighEnough(uint highestBid);
    error AuctionNotYetEnded();
    error AuctionEndAlreadyCalled();

    // create simple auction
    constructor(
        uint biddingTime,
        address payable beneficiaryAddress
    ) {
        beneficiary = beneficiaryAddress;
        auctionEndTime = block.timestamp + biddingTime;
    }

    // bid on the auction
    function bid() external payable {
        // no args, all info is already part of this transaction
        
        // revert if bidding period is over
        if (block.timestamp > auctionEndTime)
            revert AuctionAlreadyEnded();

        // if the bid is not higher, send the money back
        // the 'revert' will revert all changes in this function
        // execution including the money
        if (msg.value <= highestBid)
            revert BidNotHighEnough(highestBid);

        // send money to highest bidder
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    //withdrawn a bid that was overbid
    function withdrawn() external returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }
}