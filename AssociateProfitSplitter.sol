pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    //Setting the variables above as parameters in the constructor below
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = 0x99A4ee3581F68593ff28E4AD70d2118E6E7a9BE0;
        employee_two = 0xb2676C7b0d84B9DC8F67fFd6601e0855723d856D;
        employee_three = 0xA520A62e6B62FB9636D308bc0c0d5f3C05FDEebD;
    }
    //this should return 0 , if not deposit function needs correction
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3;

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value-amount*3);
        // the above takes care of the 1 or 2 wei left over to send back to HR
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit();
    }
}
