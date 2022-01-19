# simple script to fetch cryptocurrency prices

import requests

# add your iexapi key here
api_key = 'YOUR KEY HERE'

# pass in coin's symbol. list of symbols below
def get_coin_price(symbol):
    api_url = f'https://cloud.iexapis.com/stable/crypto/{symbol}/price?token={api_key}'
    raw = requests.get(api_url).json()
    price = raw['price']
    return float(price)

# fetch btc price
btc = get_coin_price('btcusd')
print("Price of bitcoin: {} USD".format(btc))

# add here any other coin want to get the price
