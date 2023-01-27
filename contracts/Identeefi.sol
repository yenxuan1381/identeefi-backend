// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

contract Identeefi {
    address public owner;

    struct Product {
        string name;
        uint serialNumber;
        string description;
        string brand;
        string image;
        string[] history;
        bool status;
    }

     mapping(string => Product) products;

    struct productHistory {
        uint256 id;
        Actors actor;
        string location;
        uint256 timestamp;
    }

    enum Actors {manufacturer, supplier, retailer, owner}
    Actors public actors;

    function get_actor() public view returns (Actors) {
        return actors;
    }

    function set(Actors _actors) public {
        actors = _actors;
    }

    function registerProduct(string memory _name, string memory _manufacturer, string memory _serialNumber) public {
        products[_serialNumber] = Product(_name, _manufacturer, _serialNumber, new string[](0));
    }

    function addProductHistory(string memory _serialNumber, string memory _history) public {
        products[_serialNumber].history.push(_history);
    }

    function getProduct(string memory _serialNumber) public view returns (string memory, string memory, string memory, string[] memory) {
        return (products[_serialNumber].name, products[_serialNumber].manufacturer, products[_serialNumber].serialNumber, products[_serialNumber].history);
    }

}
    