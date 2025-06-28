# Scanning in Cybersecurity

**Scanning** is the systematic probing of networks, systems, or applications to identify:

* Open ports
* Running services
* Vulnerabilities
* Devices
* Security weaknesses

It usually follows **information gathering (reconnaissance)** and precedes **exploitation** in penetration testing.

---

## Types of Scanning

### 1. Port Scanning

* **Goal:** Identify open ports and services on a target.
* **Tools:** `nmap`, `masscan`, `netcat`
* **Techniques:**

  * TCP Connect Scan
  * SYN (Stealth) Scan
  * ACK Scan
  * UDP Scan

**Examples:**

```bash
nmap -sT target.com             # TCP Connect Scan
nmap -sS target.com             # SYN (Stealth) Scan
nmap -sA target.com             # ACK Scan
nmap -sU target.com             # UDP Scan
nmap -p- target.com             # Scan all ports
```

---

### 2. Network Scanning

* **Goal:** Discover active devices and their roles.
* **Tools:** `nmap`, `arp-scan`, `Angry IP Scanner`
* **Capabilities:**

  * Detect live hosts (ping sweep)
  * Identify operating systems
  * Find MAC addresses

**Examples:**

```bash
sudo arp-scan --interface=eth0 --localnet       # Scan local network for IP and MAC
nmap -sn 192.168.1.0/24                         # Ping sweep to find live hosts
nmap -O target.com                              # OS detection
```

---

### 3. Vulnerability Scanning

* **Goal:** Find known security weaknesses.
* **Tools:** `Nessus`, `OpenVAS`, `Nexpose`, `Qualys`
* **Checks for:**

  * CVEs
  * Misconfigurations
  * Weak passwords

**Nmap Examples (limited vuln detection):**

```bash
nmap --script vuln target.com              # General vuln scripts
nmap --script http-vuln-* target.com       # HTTP vuln checks
nmap --script smb-vuln-* target.com        # SMB vuln checks
```

---

### 4. Web Application Scanning

* **Goal:** Identify website vulnerabilities like XSS, SQLi, CSRF.
* **Tools:** `OWASP ZAP`, `Burp Suite`, `Nikto`, `w3af`, `arachni`
* **Focus:** Input validation, authentication, session handling

**Nmap Web Scan Examples:**

```bash
nmap -p 80,443 --script http-enum target.com         # Enumerate web paths
nmap --script http-sql-injection target.com          # SQL Injection tests
nmap --script http-xssed target.com                   # XSS detection
```

---

### 5. WAF & Firewall Scanning

* **Goal:** Detect presence/configuration of firewalls or WAFs.
* **Tools:** `wafw00f`, `hping3`, `nmap`

**Examples:**

```bash
wafw00f example.com
nmap -sA target.com                      # ACK scan to analyze firewall behavior
nmap -f target.com                       # Fragment packets to evade detection
```

---

### 6. Service & Version Scanning

* **Goal:** Identify software and service versions.
* **Tool:** `nmap -sV`

**Example:**

```bash
nmap -sV target.com
nmap -sV -p 21,22,80,443 target.com
```

---

### 7. OS Detection (Fingerprinting)

* **Goal:** Identify operating system by analyzing network stack behavior.
* **Tool:** `nmap -O`

**Example:**

```bash
nmap -O target.com
nmap -A target.com   # Aggressive scan (OS, version, scripts)
```

---

### 8. Compliance Scanning

* **Goal:** Verify adherence to standards like PCI-DSS, HIPAA, ISO 27001.
* **Tools:** Nessus Pro, Qualys, Tenable.io

**Example:**

```bash
nmap -sV target.com                               # Detect service versions
nmap -p 21,22,80,443 --script ssl-enum-ciphers target.com  # Check SSL/TLS config
```

---

### 9. Cloud & Container Scanning

* **Goal:** Identify misconfigurations and vulnerabilities in cloud and container environments.
* **Tools:** ScoutSuite, Prowler, Trivy, AquaSec

**Examples:**

```bash
nmap -sV cloud-host.example.com                      # Service detection on cloud VM
nmap -p 2375,2376 container-host.example.com        # Scan Docker daemon ports (if exposed)
```
