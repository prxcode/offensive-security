# Simple Network Sniffer (Packet Sniffer)

## Description
This is a simple network packet sniffer written in Python using the Scapy library. The sniffer listens to network traffic and prints details of the captured packets, including source and destination IP addresses. This tool is useful for learning about network traffic analysis and packet inspection.

## Features
- Captures network packets.
- Displays the source and destination IP addresses of each packet.
- Can be extended to capture and filter more specific packet data.

## Prerequisites
Before running the script, ensure you have the following:
- **Python 3.x**: Python version 3.x or above is required.
- **Scapy**: A Python library used for network packet manipulation.

You can install Scapy using the following command:
```bash
pip install scapy
```


## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/network-sniffer.git
   ```

2. **Run the Sniffer**:
   To start sniffing network packets, simply run the script:
   ```bash
   python packet_sniffer.py
   ```

   Once executed, the program will display network packets being captured along with their source and destination IP addresses.

## Example Output

```bash
Sniffing network for packets...
Packet: 192.168.1.1 -> 192.168.1.5
Packet: 192.168.1.5 -> 192.168.1.1
Packet: 192.168.1.5 -> 192.168.1.10
```

Each packet captured is printed, showing the source and destination IP addresses.

## Limitations
- This simple sniffer only shows the IP layer information. You can extend it to capture additional details like ports or protocol types (e.g., TCP/UDP).
- Depending on your network setup and the interface you're using, you may need elevated privileges (root or administrator) to capture network packets.

## Ethical Considerations
- **Only sniff networks you own or have explicit permission to monitor.**
- Unauthorized packet sniffing is illegal and unethical. Always ensure you have permission to monitor or capture network traffic before doing so.

## Additional Resources
For more details about Scapy and how to use it for advanced packet manipulation, you can refer to the [Scapy documentation](https://scapy.readthedocs.io/).


