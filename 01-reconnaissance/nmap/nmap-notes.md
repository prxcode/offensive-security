
## Overview

**Nmap (Network Mapper)** is a powerful open-source tool used for network discovery, security auditing, and port scanning. It is widely used by system administrators, network engineers, and ethical hackers to identify devices, services, operating systems, and vulnerabilities on a network.

---

## Purpose

Nmap is designed to:

* Discover hosts on a network.
* Detect open ports and services.
* Identify operating systems and device types.
* Perform version detection of services.
* Detect known vulnerabilities (via scripts).
* Audit network security configurations.

---

## Installation

### Linux (Debian-based)

```bash
sudo apt update
sudo apt install nmap
```

### macOS

```bash
brew install nmap
```

### Windows

Download from: [https://nmap.org/download.html](https://nmap.org/download.html) (includes Zenmap GUI)

---

## Basic Concepts

### Host Discovery

Determine which devices are online in a subnet.

### Port Scanning

Identify open TCP/UDP ports on a host.

### Service & Version Detection

Determine the services running on open ports, along with their versions.

### OS Detection

Estimate the operating system and device type.

### Scriptable Interaction (NSE)

Nmap Scripting Engine (NSE) uses Lua scripts to automate tasks like:

* Vulnerability scanning
* Brute-force attacks
* Malware detection
* SSL certificate inspection

---

## Basic Syntax

```bash
nmap [options] [target]
```

* `[target]`: IP address, hostname, or subnet (e.g., `192.168.1.1`, `example.com`, `10.0.0.0/24`)
* `[options]`: Flags to control scan behavior

---

## Common Scan Types

| Command                         | Description                                            |
| ------------------------------- | ------------------------------------------------------ |
| `nmap -sn 192.168.1.0/24`       | Ping scan – list online hosts only                     |
| `nmap 192.168.1.1`              | Basic port scan (top 1000 TCP ports)                   |
| `nmap -p 22,80,443 192.168.1.1` | Scan specific ports                                    |
| `nmap -sV 192.168.1.1`          | Service/version detection                              |
| `nmap -O 192.168.1.1`           | OS detection                                           |
| `nmap -A 192.168.1.1`           | Aggressive scan (OS, version, script scan, traceroute) |
| `nmap -T4 192.168.1.1`          | Faster scan timing (0 to 5, higher is faster)          |
| `nmap -Pn 192.168.1.1`          | Skip host discovery (useful if ICMP is blocked)        |

---

## Output Formats

* Normal (default)
* XML: `-oX output.xml`
* Grepable: `-oG output.txt`
* All formats: `-oA output`

Example:

```bash
nmap -A 192.168.1.1 -oA scan_results
```

---

## Advanced Features

### NSE (Nmap Scripting Engine)

Run custom or built-in scripts to detect vulnerabilities and gather detailed information.

```bash
nmap --script vuln 192.168.1.1
```

* Script categories: `auth`, `broadcast`, `brute`, `default`, `discovery`, `dos`, `exploit`, `external`, `fuzzer`, `intrusive`, `malware`, `safe`, `version`, `vuln`

List available scripts:

```bash
ls /usr/share/nmap/scripts/
```

Search scripts by keyword:

```bash
nmap --script-help=ssl*
```

---

## Scan Types by Protocol

* `-sS`: SYN scan (stealth scan, default and fast)
* `-sT`: TCP connect scan (less stealthy)
* `-sU`: UDP scan
* `-sA`: ACK scan (for firewall rule discovery)
* `-sN`, `-sF`, `-sX`: TCP null/fin/xmas scans (bypass firewalls)

---

## Timing and Performance

* `-T0` to `-T5`: Timing template
* `--min-rate` / `--max-rate`: Control packet sending rate
* `--host-timeout`: Abort scan of a host after timeout
* `--max-retries`: Set maximum probe retries

Example:

```bash
nmap -T4 --max-retries 3 --min-rate 1000 192.168.1.0/24
```

---

## Firewall/IDS Evasion

* `-f`: Fragment packets
* `--data-length`: Append random data to packets
* `--source-port 53`: Set source port (e.g., DNS) to bypass filters
* `-D RND:10`: Use decoys
* `--spoof-mac`: Spoof MAC address

Example:

```bash
nmap -sS -D RND:5 --spoof-mac 00:11:22:33:44:55 192.168.1.1
```

---

## Zenmap (GUI)

* Nmap's official GUI frontend
* Allows profile saving, scan comparison, and topology maps
* Cross-platform (Windows, macOS, Linux)

---

## Real-World Use Cases

* Network inventory and monitoring
* Vulnerability assessment (with NSE)
* Port security testing
* Firewall rule auditing
* Pre-engagement OSINT and reconnaissance
* Verifying patch effectiveness

---

## Best Practices

* Use `-T4` for speed but avoid overloading networks.
* Avoid aggressive scans (`-A`, `--script vuln`) on production systems without permission.
* Respect legal boundaries — always have authorization.
* Combine with other tools like `masscan`, `Nikto`, or `Metasploit` for broader testing.

---

## Summary Table

| Feature             | Description                              |
| ------------------- | ---------------------------------------- |
| Discovery           | Identifies live hosts                    |
| Port Scanning       | Lists open TCP/UDP ports                 |
| Service Detection   | Determines service and version           |
| OS Detection        | Guesses host operating system            |
| NSE                 | Script-based vulnerability scanning      |
| Output Formats      | Normal, XML, Grep, JSON (via `xml2json`) |
| GUI Tool            | Zenmap                                   |
| Supported Protocols | TCP, UDP, SCTP, ICMP                     |

---

## References

* Official Site: [https://nmap.org/](https://nmap.org/)
* NSE Docs: [https://nmap.org/nsedoc/](https://nmap.org/nsedoc/)
* Nmap Book (Free): [https://nmap.org/book/](https://nmap.org/book/)
* Cheatsheet: [https://github.com/trimstray/nmap-cheat-sheet](https://github.com/trimstray/nmap-cheat-sheet)

---
