pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";

contract GeoDB is ChainlinkClient {
  
    uint256 public users;
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    constructor(address _oracle, string memory _jobId, uint256 _fee, address _link) public {
        if (_link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(_link);
        }
        // Kovan
        // oracle = 0x56dd6586DB0D08c6Ce7B2f2805af28616E082455;
        // jobId = "ef0e16c96ce04795b261725db827ba32";
        // fee = 0.1 * 10 ** 18; // 0.1 LINK
        oracle = _oracle;
        jobId = stringToBytes32(_jobId);
        fee = _fee;
    }
    
    /**
     * Create a Chainlink request to retrieve API response, find the target
     * data, then multiply by 1000000000000000000 (to remove decimal places from data).
     */
    function requestUsers() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        req.add("lat", "45.7905");
        req.add("lng", "11.9202");
        req.add("radius", "500000");
        req.add("start", "2021-01-01 20:00:00");
        req.add("end", "2021-02-21 20:30:00");
        return sendChainlinkRequestTo(oracle, req, fee);
    }
    
    /**
     * Receive the response in the form of uint256
     */ 
    function fulfill(bytes32 _requestId, uint256 _users) public recordChainlinkFulfillment(_requestId)
    {
        users = _users;
    }

    function stringToBytes32(string memory source) public pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
}
