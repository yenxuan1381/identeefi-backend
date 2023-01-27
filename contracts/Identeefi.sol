// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

contract Identeefi {
    address public owner; 

    struct Product {
        string name;
        string serialNumber;
        string description;
        string image;
        productHistory[] history;
        bool status;
    }

    mapping(string => Product) products;

    struct productHistory {
        string id;
        string actor;
        string location;
        string timestamp;
    }

    function registerProduct(string memory _name, string memory _serialNumber, string memory _description, string memory _image, bool _status) public {
        products[_serialNumber] = Product(_name, _serialNumber, _description, _image, new productHistory[](0), _status);
    }

    function addProductHistory(string memory _serialNumber, string memory _id, string memory _actor, string memory _location, string memory _timestamp) public {
        products[_serialNumber].history.push(productHistory(_id, _actor, _location, _timestamp));
    }

    function getProduct(string memory _serialNumber) public view returns (string memory, string memory, string memory, string memory, productHistory[], memory, bool) {
        return (products[_serialNumber].name, products[_serialNumber].serialNumber,products[_serialNumber].description, products[_serialNumber].image, products[_serialNumber].history, products[_serialNumber].status);
    }

}
    