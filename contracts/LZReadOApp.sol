// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

interface ILayerZeroEndpointV2 {
    function lzRead(
        uint32 _dstEid,
        bytes calldata _target,
        bytes calldata _callData
    ) external view returns (bytes memory);
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
    ) external view returns (bytes memory) {

        return ILayerZeroEndpointV2(endpoint).lzRead(
            targetEid,
            abi.encode(targetContract),
            callData
        );
    }
}
