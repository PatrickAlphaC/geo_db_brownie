#!/usr/bin/python3
import os
import time
from brownie import GeoDB, accounts, config


def main():
    dev = accounts.add(os.getenv(config['wallets']['from_key']))
    # Get the most recent PriceFeed Object
    geo_db = GeoDB[len(GeoDB) - 1]
    geo_db.requestUsers({'from': dev})
    time.sleep(25)
    print(geo_db.users())
