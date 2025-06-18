
## Overview

**Maltego** is an **open-source intelligence (OSINT)** and **graph-based link analysis** tool developed by Paterva. It is used for data mining and visualization of relationships between people, groups, websites, domains, infrastructure, and other digital assets.

---

## Purpose

Maltego helps investigators and security professionals to:

* **Uncover hidden relationships** between data points.
* **Perform reconnaissance** for ethical hacking.
* **Map infrastructure** (domains, IPs, WHOIS data, etc.).
* **Investigate people or organizations** using social footprinting.
* **Visualize data** in an intuitive graph-based layout.

---

## Core Concepts

### 1. **Entities**

Basic data units (nodes) like:

* Person
* Email address
* Domain
* Website
* Phone number
* IP address
* Organization
* Alias / Username

### 2. **Transforms**

Scripts/queries that extract more information based on an entity.

* E.g., Run a transform on a domain to get WHOIS data, DNS records, etc.
* Can be local or remote (API-based).

### 3. **Graphs**

Visual layout showing relationships between entities.

* Nodes = entities
* Edges = relationships (from transforms)

### 4. **Machines**

Automated sequences of transforms that investigate an entity fully.

---

## Maltego Interfaces

### Desktop GUI

* Platform to run transforms and visualize data.
* Compatible with Windows, macOS, Linux.

### Maltego CE (Community Edition)

* Free version with limitations (rate limits, limited transforms).

### Maltego Pro / Enterprise

* Paid versions with advanced features, collaboration, and premium transforms.

---

## Installation

### On Linux (e.g., Kali)

```bash
sudo apt update
sudo apt install maltego
```

### From Official Site

Download from: [https://www.maltego.com/downloads/](https://www.maltego.com/downloads/)

Create an account and sign in to use the community or commercial transforms.

---

## Basic Workflow

```text
[Start with Entity] -> [Run Transforms] -> [Analyze Graph] -> [Drill Down or Expand] -> [Export/Document Findings]
```

### Example:

1. Start with: `Domain (example.com)`
2. Run transforms:

   * DNS lookup
   * WHOIS information
   * MX/NS records
3. Discover linked emails, IPs, servers.
4. Expand nodes to discover more infrastructure.
5. Export to PDF, CSV, or GraphML.

---

## Useful Tools in Maltego

* **Transform Hub**: Marketplace for transforms (e.g., Shodan, VirusTotal, WhoisXML, Twitter).
* **Entity Palette**: Drag and drop entities.
* **Property Window**: View and edit properties of selected nodes.
* **Detail View**: Shows raw output from transforms.

---

## CLI/Command-line Use

Maltego itself is primarily GUI-based. However, advanced users can use:

### CaseFile (lightweight version)

No transforms, used for manual data input and graph building.

### iTDS (Internal Transform Distribution Server)

* Host custom transforms locally.
* Useful for scripting and automation.

### Custom Transforms (Python example)

```bash
#!/usr/bin/env python3
print("<MaltegoMessage>")
print("<MaltegoTransformResponseMessage>")
print("<Entities>")
print("<Entity Type='maltego.Domain'>")
print("<Value>example.com</Value>")
print("</Entity>")
print("</Entities>")
print("</MaltegoTransformResponseMessage>")
print("</MaltegoMessage>")
```

Make the script executable and define it in the Maltego UI under **Manage Transforms**.

---

## Exporting / Reporting

* Export Graph: PNG, PDF, CSV, XGMML, GraphML.
* Export Entity List: For reporting or feeding into other tools.
* Export Transforms Output: View raw data and reuse in analysis.

---

## Typical Use-Cases

* Penetration testing & Red Teaming
* Digital forensics
* Threat intelligence
* Cybercrime investigation
* Social media analysis
* Brand protection

---

## Key External Data Providers

* Shodan
* VirusTotal
* DNSDB
* Censys
* WhoisXML
* HaveIBeenPwned
* Twitter API
* Google Maps / GeoIP

---

## Resources

* Official Docs: [https://docs.maltego.com/](https://docs.maltego.com/)
* OSINT Framework: [https://osintframework.com/](https://osintframework.com/)
* Custom Transform Dev Guide: [https://docs.maltego.com/support/solutions/folders/15000017927](https://docs.maltego.com/...)

---

## Notes

* Always respect privacy and legality—**only investigate publicly available data**.
* Transforms might be rate-limited or require API keys.
* CE version has reduced capabilities (use Pro/Enterprise for full range).

---
