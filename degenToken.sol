// 1.	Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
// 2.	Transferring tokens: Players should be able to transfer their tokens to others.
// 3.	Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// 4.	Checking token balance: Players should be able to check their token balance at any time.
// 5.	Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    struct GameStoreItem {
            string name;
            uint256 price;
    }
    GameStoreItem[] public products;

    constructor() ERC20("Degen", "DGN"){
        products.push(GameStoreItem("Sword", 600));
        products.push(GameStoreItem("Armor", 500)); 
        products.push(GameStoreItem("Shield", 750));  
        products.push(GameStoreItem("Heal Potion", 50));  
        products.push(GameStoreItem("Pet", 350));  
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough DGN Tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough DGN Tokens");
        burn(_value);
    }

    function showStoreItems() external view returns (string memory message, string[] memory itemNames, uint256[] memory itemIndexes) {
    uint256 itemCount = products.length;
    itemNames = new string[](itemCount);
    itemIndexes = new uint256[](itemCount);

    for (uint256 i = 0; i < itemCount; i++) {
        itemNames[i] = products[i].name;
        itemIndexes[i] = i;
    }

    message = "The following are the names and indexes of the products in our store:";
    return (message, itemNames, itemIndexes);
}

    event RedeemFunc(address indexed sender, uint256 itemIndex, uint256 balance, string productName);
    
    function redeemTokens(uint256 _prodIndex) external payable {
    GameStoreItem storage item = products[_prodIndex];
    uint256 itemPrice = item.price;
    require(_prodIndex < products.length, "We don't have that in our store");
    require(itemPrice <= balanceOf(msg.sender), "You do not have enough DGN Tokens");

    _burn(msg.sender, itemPrice);
    emit RedeemFunc(msg.sender, _prodIndex, balanceOf(msg.sender), item.name);
}

}
