#!/usr/bin/python3
import os
from brownie import GeoDB, accounts, network, config, interface


def main():
    dev = accounts.add(os.getenv(config['wallets']['from_key']))
    GeoDB.deploy(
        config['networks'][network.show_active()]['geodb_oracle'],
        config['networks'][network.show_active()]['geodb_jobid'],
        config['networks'][network.show_active()]['fee'],
        config['networks'][network.show_active()]['link_token'],
        {'from': dev})
    geo_db = GeoDB[len(GeoDB) - 1]
    interface.LinkTokenInterface(config['networks'][network.show_active()]['link_token']).transfer(
        geo_db, 1000000000000000000, {'from': dev})
    print("Funded {}".format(geo_db.address))
