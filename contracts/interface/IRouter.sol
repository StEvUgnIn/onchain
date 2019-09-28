pragma solidity >=0.5.0 <0.6.0;


/**
 * @title IRouter
 *
 * To avoid abuse the configuration need to be locked before the redirection is active
 *
 * Error messages
 * RO01: configuration is locked
 * RO02: configuration has not been locked
 * RO03: no valid routes were found
 * RO04: redirection has failed
 *
 * @author Cyril Lapinte - <cyril.lapinte@gmail.com>
 */
contract IRouter {

  function () external payable;
  function destinations(address _origin) public view returns (address[] memory);
  function destinationAbi(address _origin) public view returns (bytes4);
  function isConfigLocked() public view returns (bool);

  function setRoute(
    address _origin,
    address[] memory _destinations,
    bytes4 _destinationAbi
    ) public returns (bool);

  function lockConfig() public;

  event ConfigLocked();
  event RouteDefined(address origin, address[] destinations, bytes4 destinationAbi);
  event DestinationSwitched(address origin, uint256 activeDestination);
}
