
## Overview

**Wireshark** is a powerful, open-source network protocol analyzer. It is widely used for:

* Capturing and analyzing network traffic
* Troubleshooting network issues
* Reverse-engineering protocols
* Security auditing and forensics

Wireshark can inspect hundreds of protocols and is used by network engineers, penetration testers, and incident response teams.

---

## Installation

### Linux (Debian-based)

```bash
sudo apt update
sudo apt install wireshark
```

During installation, allow non-root users to capture packets if prompted.

### macOS

```bash
brew install wireshark
```

### Windows

* Download installer from: [https://www.wireshark.org/download.html](https://www.wireshark.org/download.html)

---

## Basic Workflow

1. **Start Wireshark**
   Launch the GUI or run `wireshark` in a terminal.

2. **Select Interface**
   Choose a network interface (e.g., `eth0`, `wlan0`) to capture traffic.

3. **Start Capture**
   Click **Start** or press `Ctrl+E`.

4. **Apply Filters**
   Use display filters to narrow down captured traffic.

5. **Stop Capture**
   Press `Ctrl+E` again or click **Stop**.

6. **Analyze Packets**
   Use the packet list, detail, and byte panes.

7. **Export or Save**
   Save as `.pcapng` or export in various formats.

---

## Capture Filters vs Display Filters

| Type               | Description                                  | Syntax Example                   |
| ------------------ | -------------------------------------------- | -------------------------------- |
| **Capture Filter** | Applied before packets are captured          | `port 80`                        |
| **Display Filter** | Applied after capture (in GUI or saved file) | `http && ip.addr == 192.168.1.1` |

Use **BPF syntax** (tcpdump-style) for capture filters.
Use **Wireshark syntax** for display filters.

---

## Display Filter Cheatsheet

### IP and Protocol

| Purpose          | Filter |
| ---------------- | ------ |
| Show all traffic | `ip`   |
| IPv6 only        | `ipv6` |
| ARP only         | `arp`  |
| ICMP traffic     | `icmp` |
| TCP traffic      | `tcp`  |
| UDP traffic      | `udp`  |

### Host and Port

| Purpose            | Filter                                      |
| ------------------ | ------------------------------------------- |
| Traffic to/from IP | `ip.addr == 192.168.1.1`                    |
| Traffic from IP    | `ip.src == 192.168.1.1`                     |
| Traffic to IP      | `ip.dst == 192.168.1.1`                     |
| Port equals        | `tcp.port == 80`                            |
| Source port        | `tcp.srcport == 80`                         |
| Destination port   | `tcp.dstport == 443`                        |
| IP + Port          | `ip.addr == 192.168.1.1 && tcp.port == 443` |

### Protocol-Specific

| Protocol | Filter Example |
| -------- | -------------- |
| HTTP     | `http`         |
| DNS      | `dns`          |
| FTP      | `ftp`          |
| SMTP     | `smtp`         |
| TLS/SSL  | `ssl` or `tls` |
| DHCP     | `bootp`        |

### TCP Flags

| Flag    | Filter                                     |
| ------- | ------------------------------------------ |
| SYN     | `tcp.flags.syn == 1`                       |
| ACK     | `tcp.flags.ack == 1`                       |
| SYN+ACK | `tcp.flags.syn == 1 && tcp.flags.ack == 1` |
| RST     | `tcp.flags.reset == 1`                     |
| FIN     | `tcp.flags.fin == 1`                       |

### HTTP Specific

| Description          | Filter                          |
| -------------------- | ------------------------------- |
| HTTP GET requests    | `http.request.method == "GET"`  |
| HTTP POST requests   | `http.request.method == "POST"` |
| HTTP Host header     | `http.host == "example.com"`    |
| HTTP contains string | `http contains "login"`         |

### DNS and Name Resolution

| Description        | Filter                          |
| ------------------ | ------------------------------- |
| All DNS traffic    | `dns`                           |
| Query for a domain | `dns.qry.name == "example.com"` |
| DNS response only  | `dns.flags.response == 1`       |

### TLS and Certificates

| Purpose                   | Filter                                                  |
| ------------------------- | ------------------------------------------------------- |
| TLS handshake only        | `tls.handshake`                                         |
| Show TLS certificate info | `tls.handshake.certificate`                             |
| TLS Server Name (SNI)     | `tls.handshake.extensions_server_name == "example.com"` |

---

## Useful Features

* **Follow TCP Stream**: Reconstruct full communication
* **Color Rules**: Highlight suspicious packets
* **Name Resolution**: Map IPs to domain/hostnames
* **Packet Marking**: Flag packets for export or review
* **Statistics Menu**:

  * Protocol Hierarchy
  * Conversations
  * Endpoints
  * IO Graphs

---

## Export Options

* `.pcapng` – Full packet captures
* `.txt`, `.csv`, `.json`, `.xml` – Export fields or summaries
* **Menu**: File → Export Specified Packets

---

## Command Line: tshark

`tshark` is the CLI version of Wireshark.

### Basic Capture

```bash
tshark -i wlan0 -w capture.pcapng
```

### Capture with Filter

```bash
tshark -i eth0 -f "tcp port 80" -w web_traffic.pcapng
```

### Display Summary with Filter

```bash
tshark -r capture.pcapng -Y "http.request"
```

---

## Best Practices

* Run as root or grant capture permissions with:

  ```bash
  sudo usermod -aG wireshark $USER
  ```
* Use capture filters to limit traffic volume.
* Save your filters for reuse.
* Always anonymize sensitive data before sharing captures.
* Never capture traffic on a network without legal permission.

---

## Resources

* Official Website: [https://www.wireshark.org/](https://www.wireshark.org/)
* Filter Reference: [https://wiki.wireshark.org/DisplayFilters](https://wiki.wireshark.org/DisplayFilters)
* Sample PCAPs: [https://www.netresec.com/?page=PcapFiles](https://www.netresec.com/?page=PcapFiles)
* Tshark Guide: [https://tshark.dev/](https://tshark.dev/)

