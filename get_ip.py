import miniupnpc

def get_external_ip():
    u = miniupnpc.UPnP()
    u.discoverdelay = 200
    u.discover()
    u.selectigd()
    # print('external ip address: {}'.format(u.externalipaddress()))
    return u.externalipaddress()

