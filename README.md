# DegenToken Smart Contract

The DegenToken contract is an ERC20 token that includes additional functionalities tailored for a gaming platform, Degen Gaming. It allows the minting, transferring, redeeming, checking balances, and burning of tokens. Players can redeem tokens for items in an in-game store.

## Functions

1. **Minting Tokens**: Allows the contract owner to mint new tokens and distribute them as rewards to players.

2. **Transferring Tokens**: Enables players to transfer their tokens to other players.

3. **Redeeming Tokens**: Players can redeem their tokens for items available in the in-game store. An event is emitted upon successful redemption.

4. **Checking Balance**: Players can check their token balance at any time.

5. **Burning Tokens**: Allows players to burn their tokens when they are no longer needed.

6. **Show Store Items**: Displays the names and indexes of all items available in the in-game store.

## Deployment

1. **Set Up Development Environment**
   - Install MetaMask, a cryptocurrency wallet, as a browser extension. Set it up and connect it to the Avalanche Fuji C-Chain testnet.
   - Go to the [Avalanche Faucet](https://core.app/tools/testnet-faucet/?subnet=c&token=c) to request AVAX tokens, which are needed for gas fees on the testnet.

2. **Write and Compile the Contract**
   - Open [Remix IDE](https://remix.ethereum.org/), an online Solidity development environment.
   - Create a new file in Remix and paste the DegenToken smart contract code into the editor.
   - Use the Solidity compiler in Remix to compile the smart contract. Ensure the compiler version matches the pragma version specified in the contract (`pragma solidity ^0.8.9;`).

3. **Configure Deployment Settings**
   - In Remix, go to the "Deploy & Run Transactions" tab.
   - Select "Injected Web3" as the environment. This will connect Remix to MetaMask.
   - Ensure that MetaMask is connected to the Avalanche Fuji C-Chain testnet and that you have sufficient AVAX tokens.

4. **Deploy the Contract**
   - In the Remix deployment tab, select the compiled DegenToken contract.
   - Click the "Deploy" button. MetaMask will prompt you to confirm the transaction. Confirm it and wait for the deployment to complete.
   - Once deployed, you will see the contract address in Remix. Copy this address for future interactions.

5. **Verify and Interact with the Contract**
   - Go to [Snowtrace](https://testnet.snowtrace.io/), the block explorer for the Avalanche testnet.
   - Search for your deployed contract using the contract address.
   - Use Remix or Snowtrace's contract interaction tools to interact with the deployed contract. You can mint tokens, transfer tokens, redeem tokens for in-game items, check balances, and burn tokens as described in the contract functions.

## Author
Mia Enciso
