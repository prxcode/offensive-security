from scapy.all import sniff

def packet_callback(packet):
    if packet.haslayer('IP'):
        ip_src = packet['IP'].src
        ip_dst = packet['IP'].dst
        print(f"Packet: {ip_src} -> {ip_dst}")

def start_sniffing():
    print("Sniffing network for packets...")
    sniff(prn=packet_callback, store=0)

if __name__ == "__main__":
    start_sniffing()
