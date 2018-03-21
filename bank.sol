pragma solidity ^0.4.0;

contract bankcontract {
    // undsigned variable   1,2,3,4 
    // signed variable -1,-2,-3,-4,1,2,3,4
    uint private balance;   // 잔액 
    address public owner;   // 계좌주
    // 생성자 : 계약이 만들어질 때만 호출 된다.
    function bankcontract() public {
        // msg : 함수를 호출 할 수 있는 정보를 담고 있는 객체
        // sender : contract를 만든 사람의 account 주소
        owner = msg.sender;
    }
    
    // payable 키워드 : 지불할 수 있는 - 누군가 이더리움을 보내도 자동으로 못받게 막는다.
    function deposit() public payable {
        balance += msg.value;
    }
    
    // amount : 출금액
    function withdraw(uint amount) public {
        if(msg.sender == owner && balance >= amount) {
            balance -= amount;
            // 보내고 에러 발생 시 롤백
            if(!msg.sender.send(amount)) {
                balance += amount;
            }
        }
    } 
    
    function getBalance() public constant returns (uint){
        return balance;
    }
}
