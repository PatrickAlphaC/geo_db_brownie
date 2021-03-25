# GeoDB example

## Prerequisites

Please install or have installed the following:

- [nodejs and npm](https://nodejs.org/en/download/)
- [python](https://www.python.org/downloads/)
## Installation

1. [Install Brownie](https://eth-brownie.readthedocs.io/en/stable/install.html), if you haven't already. Here is a simple way to install brownie.

```bash
pip install eth-brownie
```

2. [Install ganache-cli](https://www.npmjs.com/package/ganache-cli)

```bash
npm install -g ganache-cli
```

3. Download the mix. 

```bash
brownie bake chainlink-mix
cd chainlink-mix
```

This will open up a new Chainlink project. Or, you can clone from source:

```bash
git clone https://github.com/PatrickAlphaC/chainlink-mix
cd chainlink-mix 
```

If you want to be able to deploy to testnets, do the following. 

1. Set your `WEB3_INFURA_PROJECT_ID`, and `PRIVATE_KEY` [environment variables](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html). You can get this by getting a free trial of [Infura](https://infura.io/). At the moment, it does need to be infura. You can find your `PRIVATE_KEY` from your ethereum wallet like [metamask](https://metamask.io/). 

Otherwise, you can build, test, and deploy on your local environment. 

### The GeoDB

You can read more about the [GeoDB oracle node.](https://docs.chain.link/docs/geodb-oracle-node)

### Running Scripts

This will deploy a smart contract to kovan and then read you the latest price via [Chainlink Price Feeds](https://docs.chain.link/docs/get-the-latest-price). 
```
brownie run scripts/deploy_and_fund_geodb.py --network kovan
brownie run scripts/request_and_read.py --network kovan
```

This will deploy, fund, request, and read the data from a geodb contract. The output of the `request_and_read.py` script will look something like:

```
Running 'scripts/request_and_read.py::main'...
Transaction sent: 0x5df5ab1cc9b8f07ecc684f300336ab0cab9c7a674b4cb620e48a9e67483288c1
  Gas price: 25.0 gwei   Gas limit: 143119   Nonce: 2943
/Users/patrick/code/brownie/brownie/network/event.py:238: UserWarning: 0x56dd6586DB0D08c6Ce7B2f2805af28616E082455: Event data has insufficient length
  warnings.warn(f"{address}: {exc}")
  GeoDB.requestUsers confirmed - Block: 24049581   Gas used: 130109 (90.91%)

13215900000000
```
## Resources

To get started with Brownie:

* [Chainlink Documentation](https://docs.chain.link/docs)
* Check out the [Chainlink documentation](https://docs.chain.link/docs) to get started from any level of smart contract engineering. 
* Check out the other [Brownie mixes](https://github.com/brownie-mix/) that can be used as a starting point for your own contracts. They also provide example code to help you get started.
* ["Getting Started with Brownie"](https://medium.com/@iamdefinitelyahuman/getting-started-with-brownie-part-1-9b2181f4cb99) is a good tutorial to help you familiarize yourself with Brownie.
* For more in-depth information, read the [Brownie documentation](https://eth-brownie.readthedocs.io/en/stable/).


Any questions? Join our [Discord](https://discord.gg/2YHSAey)

## License

This project is licensed under the [MIT license](LICENSE).
