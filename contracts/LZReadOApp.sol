// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract LZReadOApp {

    address public endpoint;
    uint32 public targetEid;
    address public targetContract;

    event ReadRequestSent(bytes callData);

    constructor(address _endpoint, uint32 _targetEid, address _targetContract) {
        endpoint = _endpoint;
        targetEid = _targetEid;
        targetContract = _targetContract;
    }

    function readContract(
        bytes calldata callData,
        uint256 messagingFee,
        bytes calldata extraOptions
    ) external payable {

        (bool success,) = endpoint.call{value: msg.value}(
            abi.encodeWithSignature(
                "lzRead(uint32,address,bytes,uint256,bytes)",
                targetEid,
                targetContract,
                callData,
                messagingFee,
                extraOptions
            )
        );

        require(success, "LZRead failed");

        emit ReadRequestSent(callData);
    }
}
