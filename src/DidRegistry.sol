// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract DidRegistry is ERC721 {

    error NotOwner();
    error MetadataNotChange();

    uint256 private _tokenIdDid; // 0

    enum DidType {
        Claimer,
        Verifier
    }

    struct DID {
        DidType didType;
        address owner;
        uint256 tokenId;
        string metadata;
    }

    mapping(uint256 => DID) public dids;

    event DidCreated(uint256 indexed tokenId, address indexed owner, string metadata);
    event DidModify(uint256 indexed tokenId, string metadata);

    constructor() ERC721("Mandala Academy Blockchain", "MAB") {}

    function createDID(DidType setDidType, string calldata setMetadata) external returns(uint256 tokenId) {
        tokenId = _tokenIdDid++;
        address _signer = msg.sender;
        _mint(_signer, tokenId);
        dids[tokenId] = DID(setDidType, _signer, tokenId, setMetadata);
        emit DidCreated(tokenId, _signer, setMetadata);
    }

    function modifyDid(uint256 tokenId, string memory newMetadata) external {
        if(_ownerOf(tokenId) != msg.sender) {
            revert NotOwner();
        }

        DID storage _did = dids[tokenId];
        if(keccak256(abi.encodePacked(_did.metadata)) == keccak256(abi.encodePacked(newMetadata))) {
            revert MetadataNotChange();
        }

        _did.metadata = newMetadata;
        emit DidModify(tokenId, newMetadata);
    }

    function getDid(uint256 tokenId) public view returns (DID memory) {
        return dids[tokenId];
    }
}
