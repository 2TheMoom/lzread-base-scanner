// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

interface ILayerZeroEndpointV2 {
    function lzRead(
        uint32 _dstEid,
        bytes calldata _target,
        bytes calldata _callData
    ) external payable;
}

contract LZReadOApp {

    address public endpoint;

    constructor(address _endpoint) {
        endpoint = _endpoint;
    }

    function readContract(
        uint32 targetEid,
        address targetContract,
        bytes calldata callData
    ) external payable {

        ILayerZeroEndpointV2(endpoint).lzRead{value: msg.value}(
            targetEid,
            abi.encode(targetContract),
            callData
        );
    }
}
