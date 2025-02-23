// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract DidRegistry is ERC721URIStorage, Ownable {

    error CannotTransfer();
    error CannotApprove();
    error CannotApprovalForAll();

    uint256 private _tokenIdDid;

    event DidCreated(address indexed owner, uint256 indexed tokenId, string tokenURI);
    
    constructor() ERC721("I Putu Gunamanta Yuana", "PGM") Ownable() {}

    function createDID(string memory image) external onlyOwner {
        address _signer = msg.sender;
        
        uint256 tokenId = _tokenIdDid++;
        bytes memory _newMetadata = abi.encodePacked(
            '{"name": "Mandala Academy NFT #1', 
            '", "description": "A certificate NFT that student already completed the course", ',
            '"image_url": "', image, '"}'
        );

        string memory tokenURI = string(abi.encodePacked("data:application/json;base64,", Base64.encode(_newMetadata)));

        _safeMint(_signer, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        emit DidCreated(_signer, tokenId, tokenURI);
    }

    function transferFrom(address, address, uint256) public pure override(ERC721, IERC721) {
        revert CannotTransfer();
    }

    function approve(address, uint256) public pure override(ERC721, IERC721) {
        revert CannotApprove();
    }

    function setApprovalForAll(address, bool) public pure override(ERC721, IERC721) {
        revert CannotApprovalForAll();
    }
}
