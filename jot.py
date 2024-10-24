#jotting Python code, no actual use.

import upnpy

# Initialize UPnP object
upnp = upnpy.UPnP()

# Discover UPnP devices (routers, gateways, etc.) on the network
print("Discovering UPnP devices...")
devices = upnp.discover()

# Check if any devices were found
if len(devices) == 0:
    print("No UPnP devices found on the network.")
    exit()

# Print the available devices
print(f"Found {len(devices)} UPnP devices:")
for i, device in enumerate(devices):
    print(f"[{i}] {device.friendly_name}")

# Select the first available device (usually the router)
device = devices[0]
print(f"Using device: {device.friendly_name}")

# Get the WANIPConnection (Internet Gateway Device - IGD) service
try:
    igd = device['WANIPConn1']  # WANIPConnection is the common IGD service
except KeyError:
    print("No WANIPConnection service found on this device.")
    exit()

# Get the local IP address of this machine
local_ip = upnp.local_ip
print(f"Local IP address: {local_ip}")

# Define the external and internal ports to forward
external_port = 9999
internal_port = 9999
protocol = 'TCP'  # Use 'TCP' or 'UDP'

# Add the port mapping
print(f"Requesting port forwarding: External Port {external_port} -> Internal Port {internal_port}")
igd.AddPortMapping(NewRemoteHost='',
                   NewExternalPort=external_port,
                   NewProtocol=protocol,
                   NewInternalPort=internal_port,
                   NewInternalClient=local_ip,
                   NewEnabled='1',
                   NewPortMappingDescription='UPnP Test',
                   NewLeaseDuration=0)

# Retrieve the external IP address of the router
external_ip = igd.GetExternalIPAddress()
print(f"External IP address of the router: {external_ip}")

# Verify if the port was mapped successfully
print("Verifying port mapping...")
port_mappings = igd.GetListOfPortMappings(NewStartPort=external_port, NewProtocol=protocol, NewRequestedPortCount=1)
if port_mappings:
    print(f"Port {external_port} is successfully forwarded to {local_ip}:{internal_port} ({protocol})")
else:
    print(f"Failed to map port {external_port}.")

# Press Enter to remove the port mapping and exit
input("Press Enter to remove the port mapping and exit...")

# Remove the port mapping
igd.DeletePortMapping(NewRemoteHost='', NewExternalPort=external_port, NewProtocol=protocol)
print(f"Port {external_port} mapping removed.")


