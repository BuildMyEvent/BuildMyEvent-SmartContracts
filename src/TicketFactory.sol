// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "./Ticket.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract TicketFactory is AccessControl {
    Ticket[] private ticketAddresses;

    address private ticketFactoryOwner;

    constructor() {
        ticketFactoryOwner = msg.sender;
    }

    function createEventTickets(string memory name, string memory symbol, address owner) external {
        Ticket ticket = new Ticket(owner, name, symbol);
        ticketAddresses.push(ticket);
    }

    function getTickets() external view returns (Ticket[] memory) {
        return ticketAddresses;
    }

}
