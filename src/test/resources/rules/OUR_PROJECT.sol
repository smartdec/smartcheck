pragma solidity ^0.4.8;

library SafeMath {
function safeMul(uint a, uint b) internal returns (uint) {
uint c = a * b;
assert(a == 0 || c / a == b);
return c;
}

function safeSub(uint a, uint b) internal returns (uint) {
assert(b <= a);
return a - b;
}

function safeAdd(uint a, uint b) internal returns (uint) {
uint c = a + b;
assert(c>=a && c>=b);
return c;
}

function assert(bool assertion) internal {
if (!assertion) throw;
}
}

library Utils {

function equal(bytes32 a, bytes32 b) internal constant returns (bool) {
if (a.length != b.length) {
return false;
}

for (uint i = 0; i < a.length; i++) {
if (a[i] != b[i]) {
return false;
}
}

return true;
}
}

contract AccessManager {
address public server; // Address, which the platform website uses.
address public guardian; // Address of the guardian, who confirms actions.
address public populous; // Address of the Populous bank contract.

function AccessManager(address _server, address _guardian) {
server = _server;
guardian = _guardian;
}

function isServer(address sender) public constant returns (bool) {
return sender == server;
}

function isGuardian(address sender) public constant returns (bool) {
return sender == guardian;
}

function isPopulous(address sender) public constant returns (bool) {
return sender == populous;
}

function changeServer(address _server) {
if (isGuardian(msg.sender) == false) { throw; }
server = _server;
}

function changeGuardian(address _guardian) {
if (isGuardian(msg.sender) == false) { throw; }
guardian = _guardian;
}

function changePopulous(address _populous) {
if (isGuardian(msg.sender) == false) { throw; }
populous = _populous;
}
}

contract withAccessManager {
AccessManager public AM;

function withAccessManager(address _accessManager) {
AM = AccessManager(_accessManager);
}

modifier onlyServer {
if (AM.isServer(msg.sender) == false) throw;
_;
}

modifier onlyGuardian {
if (AM.isGuardian(msg.sender) == false) throw;
_;
}

modifier onlyPopulous {
if (AM.isPopulous(msg.sender) == false) throw;
_;
}

function updateAccessManager(address _accessManager) onlyGuardian {
AM = AccessManager(_accessManager);
}

}

contract iERC20Token {
uint256 public totalSupply = 0;
/// @param _owner The address from which the balance will be retrieved
/// @return The balance
function balanceOf(address _owner) constant returns (uint256 balance);

/// @notice send `_value` token to `_to` from `msg.sender`
/// @param _to The address of the recipient
/// @param _value The amount of token to be transferred
/// @return Whether the transfer was successful or not
function transfer(address _to, uint256 _value) returns (bool success);

/// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
/// @param _from The address of the sender
/// @param _to The address of the recipient
/// @param _value The amount of token to be transferred
/// @return Whether the transfer was successful or not
function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

/// @notice `msg.sender` approves `_spender` to spend `_value` tokens
/// @param _spender The address of the account able to transfer the tokens
/// @param _value The amount of tokens to be approved for transfer
/// @return Whether the approval was successful or not
function approve(address _spender, uint256 _value) returns (bool success);

/// @param _owner The address of the account owning tokens
/// @param _spender The address of the account able to transfer the tokens
/// @return Amount of remaining tokens allowed to spent
function allowance(address _owner, address _spender) constant returns (uint256 remaining);

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract ContractReceiver {
function tokenFallback(address from, uint amount, bytes data);
}

contract ERC23Token is iERC20Token {

event ContractTransfer(address _to, uint _value, bytes _data);

function transfer(address _to, uint _value, bytes _data) returns (bool success) {
//filtering if the target is a contract with bytecode inside it
if(isContract(_to)) {
return transferToContract(_to, _value, _data);
} else {
return transferToAddress(_to, _value);
}
}

function transfer(address _to, uint _value) returns (bool success) {
//A standard function transfer similar to ERC20 transfer with no _data
if(isContract(_to)) {
bytes memory emptyData;
return transferToContract(_to, _value, emptyData);
} else {
return transferToAddress(_to, _value);
}
}

//function that is called when transaction target is an address
function transferToAddress(address _to, uint _value) returns (bool success) {
if (balances[msg.sender] >= _value && _value > 0 && balances[_to] + _value > balances[_to]) {
balances[msg.sender] -= _value;
balances[_to] += _value;
Transfer(msg.sender, _to, _value);

return true;
} else {
return false;
}
}

//function that is called when transaction target is a contract
function transferToContract(address _to, uint _value, bytes _data) returns (bool success) {
if (balances[msg.sender] >= _value && _value > 0 && balances[_to] + _value > balances[_to]) {
balances[msg.sender] -= _value;
balances[_to] += _value;
ContractReceiver reciever = ContractReceiver(_to);
reciever.tokenFallback(msg.sender, _value, _data);
Transfer(msg.sender, _to, _value);
ContractTransfer(_to, _value, _data);

return true;
} else {
return false;
}
}

//assemble the given address bytecode. If bytecode exists then the _addr is a contract.
function isContract(address _addr) constant returns (bool is_contract) {
uint length;
assembly {
// retrieve the size of the code on target address, this needs assembly
length := extcodesize(_addr)
}
if(length>0)
{
return true;
}
else
{
return false;
}
}

function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0 && balances[_to] + _value > balances[_to]) {
balances[_to] += _value;
balances[_from] -= _value;
allowed[_from][msg.sender] -= _value;
Transfer(_from, _to, _value);
return true;
} else { return false; }
}

function balanceOf(address _owner) constant returns (uint256 balance) {
return balances[_owner];
}

function approve(address _spender, uint256 _value) returns (bool success) {
allowed[msg.sender][_spender] = _value;
Approval(msg.sender, _spender, _value);
return true;
}

function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
return allowed[_owner][_spender];
}

mapping (address => uint256) balances;
mapping (address => mapping (address => uint256)) allowed;
}

contract CurrencyToken is ERC23Token, withAccessManager {
bytes32 public name;
uint8 public decimals;                //How many decimals to show. ie. There could 1000 base units with 3 decimals. Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
bytes32 public symbol;                 //An identifier: eg SBX

function CurrencyToken (
address _accessManager,
bytes32 _tokenName,
uint8 _decimalUnits,
bytes32 _tokenSymbol)
withAccessManager(_accessManager)
{
name = _tokenName;                                   // Set the name for display purposes
decimals = _decimalUnits;                            // Amount of decimals for display purposes
symbol = _tokenSymbol;                               // Set the symbol for display purposes
}

function mintTokens(uint amount) onlyPopulous {
balances[AM.populous()] = SafeMath.safeAdd(balances[AM.populous()], amount);
totalSupply = SafeMath.safeAdd(totalSupply, amount);
}

function destroyTokens(uint amount) onlyPopulous returns (bool success) {
if (balances[AM.populous()] < amount) {
return false;
} else {
balances[AM.populous()] = SafeMath.safeSub(balances[AM.populous()], amount);
totalSupply = SafeMath.safeSub(totalSupply, amount);

return true;
}
}
}

contract Migrations {
address public owner;
uint public last_completed_migration;

modifier restricted() {
if (msg.sender == owner) _;
}

function Migrations() {
owner = msg.sender;
}

function setCompleted(uint completed) restricted {
last_completed_migration = completed;
}

function upgrade(address new_address) restricted {
Migrations upgraded = Migrations(new_address);
upgraded.setCompleted(last_completed_migration);
}
}

contract Crowdsale is withAccessManager {

event EventGroupCreated(uint groupIndex, string name, uint goal);
event EventGroupGoalReached(uint groupIndex, string _name, uint goal);
event EventNewBid(uint groupIndex, bytes32 bidderId, string name, uint value);
event EventAuctionOpen();
enum AuctionCloseReasons { GroupGoalReached, DeadlineReached, BorrowerClosed }
event EventAuctionClosed(uint8 reasonCode);
event EventAuctionWaiting();
event EventPaymentReceived(uint paidAmount);
event EventAuctionCompleted();

enum States { Pending, Open, Closed, WaitingForInvoicePayment, PaymentReceived, Completed }

States public status;

bytes32 public currencySymbol;
bytes32 public invoiceId;
string public _invoiceNumber;
bytes32 public borrowerId;
uint public invoiceAmount;
uint public fundingGoal;
uint public deadline;
uint public platformTaxPercent;

string public signedDocumentIPFSHash;

struct Bidder {
uint bidderIndex;
bytes32 bidderId;
string name;
uint bidAmount;
bool hasReceivedTokensBack; // This flag is set when losing group receives its tokens back or when winner group gets its winnings
}

struct Group {
uint groupIndex;
string name;
uint goal;
Bidder[] bidders;
uint amountRaised;
uint biddersReceivedTokensBack;
bool hasReceivedTokensBack; // This is set to true when the flag hasReceivedTokensBack is set to true for all bidders in the group
}

//Groups
Group[] public groups;
uint public groupsReceivedTokensBack;
uint public winnerGroupIndex;
bool public hasWinnerGroup;

uint public paidAmount;

bool public sentToBeneficiary;
bool public sentToLosingGroups;
bool public sentToWinnerGroup;

//Constructor
function Crowdsale(
address _accessManager,
bytes32 _currencySymbol,
bytes32 _borrowerId,
bytes32 _invoiceId,
string _invoiceNumber,
uint _invoiceAmount,
uint _fundingGoal,
uint _platformTaxPercent,
string _signedDocumentIPFSHash)
withAccessManager(_accessManager)
{
currencySymbol = _currencySymbol;
borrowerId = _borrowerId;
invoiceId = _invoiceId;
invoiceAmount = _invoiceAmount;
fundingGoal = _fundingGoal;
platformTaxPercent = _platformTaxPercent;
signedDocumentIPFSHash = _signedDocumentIPFSHash;

deadline = now + 24 hours;
status = States.Open;
}

modifier onlyOpenAuction() { if (status == States.Open) { _; } }

function checkDeadline() returns(bool) {
if (now > deadline) {
if (status == States.Open) {
status = States.Closed;
EventAuctionClosed(uint8(AuctionCloseReasons.DeadlineReached));
}
return true;
}
return false;
}

function getStatus() public constant returns (uint8) {
return uint8(status);
}

function getGroupsCount() public constant returns (uint) {
return groups.length;
}

function getGroup(uint groupIndex)
public constant
returns (string name, uint goal, uint biddersCount, uint amountRaised, bool hasReceivedTokensBack)
{
Group g = groups[groupIndex];

return (g.name, g.goal, g.bidders.length, g.amountRaised, g.hasReceivedTokensBack);
}

function getGroupBidder(uint groupIndex, uint bidderIndex)
public constant
returns (bytes32 bidderId, string name, uint bidAmount, bool hasReceivedTokensBack)
{
Bidder b = groups[groupIndex].bidders[bidderIndex];

return (b.bidderId, b.name, b.bidAmount, b.hasReceivedTokensBack);
}

function setBidderHasReceivedTokensBack(uint groupIndex, uint bidderIndex) onlyPopulous {
groups[groupIndex].bidders[bidderIndex].hasReceivedTokensBack = true;
groups[groupIndex].biddersReceivedTokensBack++;

if (groups[groupIndex].biddersReceivedTokensBack == groups[groupIndex].bidders.length) {
groups[groupIndex].hasReceivedTokensBack = true;
groupsReceivedTokensBack++;

if (groups.length == 1) {
setSentToLosingGroups();
setSentToWinnerGroup();
} else if (groups.length - 1 == groupsReceivedTokensBack) {
setSentToLosingGroups();
} else if (groups.length == groupsReceivedTokensBack) {
setSentToWinnerGroup();
}
}
}

function setPaidAmount(uint _paidAmount) onlyPopulous {
if (status == States.WaitingForInvoicePayment) {
paidAmount = _paidAmount;
status = States.PaymentReceived;

EventPaymentReceived(paidAmount);
}
}

function createGroup(string _name, uint _goal)
onlyOpenAuction
returns (uint8 err, uint groupIndex)
{
if(checkDeadline() == false && _goal >= fundingGoal && _goal <= invoiceAmount) {
groupIndex = groups.length++;
groups[groupIndex].groupIndex = groupIndex;
groups[groupIndex].name = _name;
groups[groupIndex].goal = _goal;

EventGroupCreated(groupIndex, _name, _goal);

return (0, groupIndex);
} else {
return (1, 0);
}
}

function findBidder(bytes32 bidderId) constant returns (uint8 err, uint groupIndex, uint bidderIndex) {
for(groupIndex = 0; groupIndex < groups.length; groupIndex++) {
for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.length; bidderIndex++) {
if (Utils.equal(groups[groupIndex].bidders[bidderIndex].bidderId, bidderId) == true) {
return (0, groupIndex, bidderIndex);
}
}
}
return (1, 0, 0);
}

function findBidder(uint groupIndex, bytes32 bidderId) constant returns (uint8 err, uint bidderIndex) {
for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.length; bidderIndex++) {
if (Utils.equal(groups[groupIndex].bidders[bidderIndex].bidderId, bidderId) == true) {
return (0, bidderIndex);
}
}
return (1, 0);
}

function bid(uint groupIndex, bytes32 bidderId, string name, uint value)
onlyOpenAuction
onlyPopulous
returns (uint8 err, uint finalValue, uint groupGoal, bool goalReached)
{
if(checkDeadline() == true || value == 0 || groups[groupIndex].goal == 0) {
return (1, 0, 0, false);
}

if (groups[groupIndex].amountRaised + value > groups[groupIndex].goal) {
value = SafeMath.safeSub(groups[groupIndex].goal, groups[groupIndex].amountRaised);
}

uint8 finderErr;
uint bidderIndex;

(finderErr, bidderIndex) = findBidder(groupIndex, bidderId);

if (finderErr == 0) {
groups[groupIndex].bidders[bidderIndex].bidAmount = SafeMath.safeAdd(groups[groupIndex].bidders[bidderIndex].bidAmount, value);
} else {
groups[groupIndex].bidders.push(Bidder(groups[groupIndex].bidders.length, bidderId, name, value, false));
}

groups[groupIndex].amountRaised = SafeMath.safeAdd(groups[groupIndex].amountRaised, value);

EventNewBid(groupIndex, bidderId, name, value);

goalReached = groups[groupIndex].amountRaised == groups[groupIndex].goal;

if (goalReached == true) {
winnerGroupIndex = groupIndex;
hasWinnerGroup = true;
status = States.Closed;

EventGroupGoalReached(groupIndex, groups[groupIndex].name, groups[groupIndex].goal);
EventAuctionClosed(uint8(AuctionCloseReasons.GroupGoalReached));
}

return (0, value, groups[groupIndex].goal, goalReached);
}

function borrowerChooseWinner(uint groupIndex)
onlyOpenAuction
onlyServer
{
if (groups[groupIndex].amountRaised > 0) {
winnerGroupIndex = groupIndex;
hasWinnerGroup = true;
status = States.Closed;

EventAuctionClosed(uint8(AuctionCloseReasons.BorrowerClosed));
}
}

function waitingForPayment() onlyServer returns(bool) {
return _waitingForPayment();
}

function _waitingForPayment() private returns(bool) {
if (status == States.Closed && sentToBeneficiary == true && sentToLosingGroups == true) {
// Tokens have been sent to beneficiary
// Tokens have been sent to loser groups

status = States.WaitingForInvoicePayment;
EventAuctionWaiting();
}
}

function getAmountForBeneficiary() public constant returns (uint8 err, uint amount) {
if (status == States.Closed && sentToBeneficiary == false) {
return (0, groups[winnerGroupIndex].amountRaised);
} else {
return (1, 0);
}
}

function setSentToBeneficiary() onlyPopulous {
sentToBeneficiary = true;

// We have only 1 group (the winning group) and we set
// the losing groups as refunded automatically.
if (groups.length == 1) {
setSentToLosingGroups();
}
}

function setSentToLosingGroups() private  {
sentToLosingGroups = true;

_waitingForPayment();
}

function setSentToWinnerGroup() private {
sentToWinnerGroup = true;
status = States.Completed;
groups[winnerGroupIndex].hasReceivedTokensBack = true;

EventAuctionCompleted();
}

}

contract CrowdsaleManager is withAccessManager {

struct CrowdsaleEntry {
address addr;
bytes32 borrowerId;
bytes32 invoiceId;
bytes32 invoiceNumber;
uint invoiceAmount;
uint fundingGoal;
}

CrowdsaleEntry[] crowdsales;
mapping(bytes32 => mapping(string => uint)) invoicesIndex;

function CrowdsaleManager(address _accessManager)
withAccessManager(_accessManager) {}

function createCrowdsale(
bytes32 _currencySymbol,
bytes32 _borrowerId,
bytes32 _invoiceId,
string _invoiceNumber,
uint _invoiceAmount,
uint _fundingGoal,
uint _platformTaxPercent,
string _signedDocumentIPFSHash)
onlyPopulous

returns (address crowdsaleAddr)
{
if (invoicesIndex[_borrowerId][_invoiceNumber] == _invoiceAmount) { throw; }
invoicesIndex[_borrowerId][_invoiceNumber] = _invoiceAmount;

crowdsaleAddr = new Crowdsale(
address(AM),
_currencySymbol,
_borrowerId,
_invoiceId,
_invoiceNumber,
_invoiceAmount,
_fundingGoal,
_platformTaxPercent,
_signedDocumentIPFSHash
);
}
}

contract iCrowdsale {
bytes32 public currencySymbol;
uint public invoiceAmount;
bytes32 public borrowerId;
uint8 public status;
uint public platformTaxPercent;

uint public winnerGroupIndex;
bool public sentToBeneficiary;
bool public sentToLosingGroups;
bool public sentToWinnerGroup;
uint public paidAmount;

function isDeadlineReached() returns(bool);
function getStatus() public constant returns (uint8);

function createGroup(string _name, uint _goal) returns (uint8 err, uint groupIndex);
function bid(uint groupIndex , bytes32 bidderId, string name, uint value) returns (uint8 err, uint finalValue, uint groupGoal, bool goalReached);
function getGroupsCount() public constant returns (uint);
function getGroup(uint groupIndex) public constant returns (string name, uint goal, uint biddersCount, uint amountRaised, bool hasReceivedTokensBack);
function getGroupBidder(uint groupIndex, uint bidderIndex) public constant returns (bytes32 bidderId, bytes32 name, uint bidAmount, bool hasReceivedTokensBack);

function getAmountForBeneficiary() public constant returns (uint8 err, uint amount);
function setBidderHasReceivedTokensBack(uint groupIndex, uint bidderIndex);
function setSentToBeneficiary();
function setPaidAmount(uint _paidAmount);
}

contract iCrowdsaleManager {
function createCrowdsale(
bytes32 _currencySymbol,
bytes32 _borrowerId,
bytes32 _invoiceId,
string _invoiceNumber,
uint _invoiceAmount,
uint _fundingGoal,
uint _platformTaxPercent,
string _signedDocumentIPFSHash)
returns (address);
}

contract Populous is withAccessManager {

// Bank events
event EventNewCurrency(bytes32 tokenName, uint8 decimalUnits, bytes32 tokenSymbol, address addr);
event EventMintTokens(bytes32 currency, uint amount);
event EventDestroyTokens(bytes32 currency, uint amount);
event EventInternalTransfer(bytes32 currency, bytes32 fromId, bytes32 toId, uint amount);
event EventWithdrawal(address to, bytes32 clientId, bytes32 currency, uint amount);
event EventDeposit(address from, bytes32 clientId, bytes32 currency, uint amount);

// Auction events
event EventNewCrowdsale(address crowdsale);
event EventBeneficiaryFunded(address crowdsaleAddr, bytes32 borrowerId, bytes32 currency, uint amount);
event EventLosingGroupBidderRefunded(address crowdsaleAddr, uint groupIndex, bytes32 bidderId, bytes32 currency, uint amount);
event EventPaymentReceived(address crowdsaleAddr, bytes32 currency, uint amount);
event EventWinnerGroupBidderFunded(address crowdsaleAddr, uint groupIndex, bytes32 bidderId, bytes32 currency, uint bidAmount, uint benefitsAmount);

bytes32 constant LEDGER_SYSTEM_ACCOUNT = "Populous";
// This has to be the same one as in Crowdsale
enum States { Pending, Open, Closed, WaitingForInvoicePayment, PaymentReceived, Completed }

iCrowdsaleManager public CM;

// currencySymbol => (accountId => amount)
mapping(bytes32 => mapping(bytes32 => uint)) ledger;
mapping(bytes32 => address) currencies;
mapping(address => bytes32) currenciesSymbols;

function Populous(address _accessManager) withAccessManager(_accessManager) { }

function setCM(address _crowdsaleManager) {
CM = iCrowdsaleManager(_crowdsaleManager);
}

/**
BANK MODULE
*/
function createCurrency(bytes32 _tokenName, uint8 _decimalUnits, bytes32 _tokenSymbol)
onlyGuardian
{
// Check if currency already exists
if (currencies[_tokenSymbol] != 0x0) { throw; }

currencies[_tokenSymbol] = new CurrencyToken(address(AM), _tokenName, _decimalUnits, _tokenSymbol);

if (currencies[_tokenSymbol] == 0x0) { throw; }

currenciesSymbols[currencies[_tokenSymbol]] = _tokenSymbol;

EventNewCurrency(_tokenName, _decimalUnits, _tokenSymbol, currencies[_tokenSymbol]);
}

function getCurrency(bytes32 currency) constant returns (address) {
return currencies[currency];
}

function getCurrencySymbol(address currency) constant returns (bytes32) {
return currenciesSymbols[currency];
}

// Deposit function called by our external ERC23 tokens upon transfer to the contract
function tokenFallback(address from, uint amount, bytes data) {
bytes32 currencySymbol = currenciesSymbols[msg.sender];
if (currencySymbol.length == 0) { throw; }

bytes32 clientId;
assembly {
clientId := mload(add(data, 32))
}
if (CurrencyToken(msg.sender).destroyTokens(amount) == false) { throw; }

ledger[currencySymbol][clientId] = SafeMath.safeAdd(ledger[currencySymbol][clientId], amount);
EventDeposit(from, clientId, currencySymbol, amount);
}

function withdraw(address clientExternal, bytes32 clientId, bytes32 currency, uint amount) onlyGuardian {
if (currencies[currency] == 0x0 || ledger[currency][clientId] < amount) { throw; }

ledger[currency][clientId] = SafeMath.safeSub(ledger[currency][clientId], amount);

CurrencyToken(currencies[currency]).mintTokens(amount);
if (CurrencyToken(currencies[currency]).transfer(clientExternal, amount) == false) { throw; }

EventWithdrawal(clientExternal, clientId, currency, amount);
}

function mintTokens(bytes32 currency, uint amount)
onlyGuardian
returns (bool success)
{
return _mintTokens(currency, amount);
}

function _mintTokens(bytes32 currency, uint amount)
private
returns (bool success)
{
if (currencies[currency] != 0x0) {
ledger[currency][LEDGER_SYSTEM_ACCOUNT] = SafeMath.safeAdd(ledger[currency][LEDGER_SYSTEM_ACCOUNT], amount);
EventMintTokens(currency, amount);
return true;
} else {
return false;
}
}

function destroyTokens(bytes32 currency, uint amount)
onlyGuardian
returns (bool success)
{
return _destroyTokens(currency, amount);
}

function _destroyTokens(bytes32 currency, uint amount)
private
returns (bool success)
{
if (currencies[currency] != 0x0) {
ledger[currency][LEDGER_SYSTEM_ACCOUNT] = SafeMath.safeSub(ledger[currency][LEDGER_SYSTEM_ACCOUNT], amount);
EventDestroyTokens(currency, amount);
return true;
} else {
return false;
}
}

function getLedgerEntry(bytes32 currency, bytes32 accountId) constant returns (uint) {
return ledger[currency][accountId];
}

function transfer(bytes32 currency, bytes32 from, bytes32 to, uint amount) onlyServer {
_transfer(currency, from, to, amount);
}

function _transfer(bytes32 currency, bytes32 from, bytes32 to, uint amount) private {
if (ledger[currency][from] < amount) { throw; }

ledger[currency][from] = SafeMath.safeSub(ledger[currency][from], amount);
ledger[currency][to] = SafeMath.safeAdd(ledger[currency][to], amount);

EventInternalTransfer(currency, from, to, amount);
}
/**
END OF BANK MODULE
*/

/**
AUCTION MODULE
*/
function createCrowdsale(
bytes32 _currencySymbol,
bytes32 _borrowerId,
bytes32 _invoiceId,
string _invoiceNumber,
uint _invoiceAmount,
uint _fundingGoal,
uint _platformTaxPercent,
string _signedDocumentIPFSHash)
onlyServer
{
if (currencies[_currencySymbol] == 0x0) { throw; }

address crowdsaleAddr = CM.createCrowdsale(
_currencySymbol,
_borrowerId,
_invoiceId,
_invoiceNumber,
_invoiceAmount,
_fundingGoal,
_platformTaxPercent,
_signedDocumentIPFSHash
);

EventNewCrowdsale(crowdsaleAddr);
}

function bid(address crowdsaleAddr, uint groupIndex, bytes32 bidderId, string name, uint value)
onlyServer
returns (bool success)
{
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

uint8 err;
uint finalValue;
uint groupGoal;
bool goalReached;
(err, finalValue, groupGoal, goalReached) = CS.bid(groupIndex, bidderId, name, value);

if (err == 0) {
_transfer(CS.currencySymbol(), bidderId, LEDGER_SYSTEM_ACCOUNT, finalValue);
return true;
} else {
return false;
}
}

function fundBeneficiary(address crowdsaleAddr) {
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

uint8 err;
uint amount;
(err, amount) = CS.getAmountForBeneficiary();
if (err != 0) { return; }

bytes32 borrowerId = CS.borrowerId();
bytes32 currency = CS.currencySymbol();
_transfer(currency, LEDGER_SYSTEM_ACCOUNT, borrowerId, amount);

CS.setSentToBeneficiary();

EventBeneficiaryFunded(crowdsaleAddr, borrowerId, currency, amount);
}

/**
    @dev This function has to be split, because it might exceed the gas limit, if the groups and bidders are too many.
*/
function refundLosingGroups(address crowdsaleAddr) {
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

if (States(CS.getStatus()) != States.Closed) { return; }

bytes32 currency = CS.currencySymbol();
uint groupsCount = CS.getGroupsCount();
uint winnerGroupIndex = CS.winnerGroupIndex();

// Loop all groups
for (uint groupIndex = 0; groupIndex < groupsCount; groupIndex++) {
uint biddersCount;
bool hasReceivedTokensBack;
( , , biddersCount, , hasReceivedTokensBack) = CS.getGroup(groupIndex);

// Check if group is not winner group and has not already been refunded
if (groupIndex != winnerGroupIndex && hasReceivedTokensBack == false) {
// Loop all bidders
for (uint bidderIndex = 0; bidderIndex < biddersCount; bidderIndex++) {
bytes32 bidderId;
uint bidAmount;
bool bidderHasReceivedTokensBack;
(bidderId, , bidAmount, bidderHasReceivedTokensBack) = CS.getGroupBidder(groupIndex, bidderIndex);

// Check if bidder has already been refunded
if (bidderHasReceivedTokensBack == false) {
// Refund bidder
_transfer(currency, LEDGER_SYSTEM_ACCOUNT, bidderId, bidAmount);

// Save bidder refund in Crowdsale contract
CS.setBidderHasReceivedTokensBack(groupIndex, bidderIndex);

EventLosingGroupBidderRefunded(crowdsaleAddr, groupIndex, bidderId, currency, bidAmount);
}
}
}
}
}

function refundLosingGroupBidder(address crowdsaleAddr, uint groupIndex, uint bidderIndex) {
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

if (States(CS.getStatus()) != States.Closed) { return; }

uint winnerGroupIndex = CS.winnerGroupIndex();
if (winnerGroupIndex == groupIndex) {
return;
}

bytes32 bidderId;
uint bidAmount;
bool bidderHasReceivedTokensBack;
(bidderId, , bidAmount, bidderHasReceivedTokensBack) = CS.getGroupBidder(groupIndex, bidderIndex);

if (bidderHasReceivedTokensBack == false && bidderId.length != 0) {
bytes32 currency = CS.currencySymbol();
_transfer(currency, LEDGER_SYSTEM_ACCOUNT, bidderId, bidAmount);

// Save bidder refund in Crowdsale contract
CS.setBidderHasReceivedTokensBack(groupIndex, bidderIndex);

EventLosingGroupBidderRefunded(crowdsaleAddr, groupIndex, bidderId, currency, bidAmount);
}
}

function invoicePaymentReceived(address crowdsaleAddr, uint paidAmount) onlyServer {
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

if (States(CS.getStatus()) != States.WaitingForInvoicePayment || CS.sentToWinnerGroup() == true) { return; }

bytes32 currency = CS.currencySymbol();
_mintTokens(currency, paidAmount);

CS.setPaidAmount(paidAmount);

EventPaymentReceived(crowdsaleAddr, currency, paidAmount);
}

function fundWinnerGroup(address crowdsaleAddr) {
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

if (States(CS.getStatus()) != States.PaymentReceived) { return; }

uint winnerGroupIndex = CS.winnerGroupIndex();
uint biddersCount;
uint amountRaised;
bool hasReceivedTokensBack;

(, , biddersCount, amountRaised, hasReceivedTokensBack) = CS.getGroup(winnerGroupIndex);

if (hasReceivedTokensBack == true) { return; }

bytes32 currency = CS.currencySymbol();
uint paidAmount = CS.paidAmount();

for (uint bidderIndex = 0; bidderIndex < biddersCount; bidderIndex++) {
bytes32 bidderId;
uint bidAmount;
bool bidderHasReceivedTokensBack;
(bidderId, , bidAmount, bidderHasReceivedTokensBack) = CS.getGroupBidder(winnerGroupIndex, bidderIndex);

// Check if bidder has already been funded
if (bidderHasReceivedTokensBack == true) { continue; }

// Fund winning bidder based on his contribution
uint benefitsAmount = bidAmount * paidAmount / amountRaised;

_transfer(currency, LEDGER_SYSTEM_ACCOUNT, bidderId, benefitsAmount);

// Save bidder refund in Crowdsale contract
CS.setBidderHasReceivedTokensBack(winnerGroupIndex, bidderIndex);

EventWinnerGroupBidderFunded(crowdsaleAddr, winnerGroupIndex, bidderId, currency, bidAmount, benefitsAmount);
}
}

function fundWinnerGroupBidder(address crowdsaleAddr, uint bidderIndex) {
iCrowdsale CS = iCrowdsale(crowdsaleAddr);

if (States(CS.getStatus()) != States.PaymentReceived) { return; }

uint winnerGroupIndex = CS.winnerGroupIndex();

bytes32 bidderId;
uint bidAmount;
bool bidderHasReceivedTokensBack;
(bidderId, , bidAmount, bidderHasReceivedTokensBack) = CS.getGroupBidder(winnerGroupIndex, bidderIndex);

if (bidderHasReceivedTokensBack == false && bidderId.length != 0) {
uint amountRaised;
(, , , amountRaised, ) = CS.getGroup(winnerGroupIndex);

bytes32 currency = CS.currencySymbol();
uint paidAmount = CS.paidAmount();
// Fund winning bidder based on his contribution
uint benefitsAmount = bidAmount * paidAmount / amountRaised;

_transfer(currency, LEDGER_SYSTEM_ACCOUNT, bidderId, benefitsAmount);

// Save bidder refund in Crowdsale contract
CS.setBidderHasReceivedTokensBack(winnerGroupIndex, bidderIndex);

EventWinnerGroupBidderFunded(crowdsaleAddr, winnerGroupIndex, bidderId, currency, bidAmount, benefitsAmount);
}
}
/**
END OF AUCTION MODULE
*/
}
