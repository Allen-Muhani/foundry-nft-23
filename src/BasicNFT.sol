// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenCounter;

    mapping(uint256 => string) private s_tokenIdToTokenURI;

    constructor() ERC721("Dogie", "Dog") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public returns (uint256) {
        uint256 newItemId = s_tokenCounter;
        _safeMint(msg.sender, newItemId);
        s_tokenIdToTokenURI[newItemId] = tokenUri;
        s_tokenCounter++;
        return newItemId;
    }

    function tokenURI(uint256 tokenID) public view override returns (string memory){
        return s_tokenIdToTokenURI[tokenID];
    }
}

