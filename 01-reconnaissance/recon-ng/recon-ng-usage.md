
## Overview

**Recon-ng** is a full-featured web reconnaissance framework written in Python. It provides a powerful environment similar to Metasploit but tailored for **OSINT (Open-Source Intelligence)** and **reconnaissance**. It automates the process of gathering information about targets using modular components and built-in functionality.

---

## Purpose

Recon-ng is used to:

* Perform passive and active information gathering.
* Automate OSINT workflows using modular recon methods.
* Integrate with APIs (e.g., Shodan, GitHub, HaveIBeenPwned).
* Export data to various formats for analysis or reporting.
* Quickly discover relationships between domains, emails, hosts, etc.

---

## Installation

### Kali Linux

```bash
sudo apt install recon-ng
```

### Manual (Python/pip)

```bash
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
pip install -r REQUIREMENTS
python3 recon-ng
```

---

## Starting the Console

```bash
recon-ng
```

This launches an interactive CLI console similar to Metasploit.

---

## Interface Overview

* Workspace: Data is isolated per workspace (project).
* Modules: Scripts/tools for data collection or analysis.
* Database: All results are stored internally in SQLite.
* Keys: API keys can be configured and stored securely.
* Reporting: Export results to CSV, JSON, XML, etc.

---

## Basic Workflow

1. **Create workspace**

   ```bash
   workspaces create myproject
   ```

2. **Add target data**

   ```bash
   add domains example.com
   add companies "Example Inc"
   ```

3. **Load and run modules**

   ```bash
   modules load recon/domains-hosts/bing_domain_web
   show options
   set SOURCE example.com
   run
   ```

4. **View results**

   ```bash
   show hosts
   show contacts
   ```

5. **Export data**

   ```bash
   report csv /tmp/output.csv
   ```

---

## Core Commands

| Command       | Description                                  |
| ------------- | -------------------------------------------- |
| `workspaces`  | Create, list, select, delete workspaces      |
| `modules`     | Load recon, reporting, or exploitation tools |
| `keys`        | Manage API keys                              |
| `db`          | Show and manage database records             |
| `marketplace` | Install and update community modules         |
| `help`        | Show help information                        |
| `exit`        | Exit the console                             |

---

## Module Types

Modules are grouped by category. Common categories include:

### Recon Modules

* `recon/domains-contacts/` – Email/employee harvesting
* `recon/domains-hosts/` – Subdomain enumeration
* `recon/hosts-hosts/` – Network pivoting
* `recon/hosts-domains/` – Reverse DNS

### Reporting Modules

* `reporting/csv`
* `reporting/json`
* `reporting/list`

### Exploitation Modules

* Some modules may allow basic exploitation or web-based probing (limited use)

---

## API Key Configuration

Some modules require external APIs. Set keys like so:

```bash
keys add shodan_api your_key_here
keys list
```

Common APIs used:

* Shodan
* GitHub
* HaveIBeenPwned
* Google
* BinaryEdge

---

## Example Recon Workflow

```bash
# Start recon-ng
recon-ng

# Create new workspace
workspaces create acme

# Add target
add domains acme.com

# Use a subdomain enumeration module
modules load recon/domains-hosts/bing_domain_web
set SOURCE acme.com
run

# View discovered hosts
show hosts

# Use another module to find contact emails
modules load recon/hosts-contacts/whois_pocs
set SOURCE acme.com
run

# Export results
report csv /tmp/acme_recon.csv
```

---

## Data Handling

Recon-ng uses an internal database for all results. You can:

* `show domains`, `hosts`, `contacts`, etc.
* Use `delete` to remove entries
* Use `search` to filter

You can also write your own modules in Python using the Recon-ng API.

---

## Marketplace

To install additional community modules:

```bash
marketplace search github
marketplace install recon/domains-contacts/github_employees
```

---

## Exporting and Reporting

```bash
report csv /path/to/output.csv
report json /path/to/output.json
report html /path/to/output.html
```

---

## Best Practices

* Organize work into different workspaces per project.
* Always check required options using `show options`.
* Store API keys using the `keys` command to avoid retyping.
* Use passive recon modules first to avoid detection.
* Use reporting modules to generate deliverables for clients or documentation.

---

## Summary Table

| Feature           | Description                                   |
| ----------------- | --------------------------------------------- |
| Modular Framework | Extensible with Python-based modules          |
| Database          | Built-in SQLite for storing results           |
| API Integration   | Supports keys for Shodan, GitHub, etc.        |
| Output Formats    | CSV, JSON, HTML                               |
| Use Cases         | Subdomain discovery, email enumeration, OSINT |
| Skill Requirement | Intermediate; requires CLI usage              |

---

## Resources

* GitHub: [https://github.com/lanmaster53/recon-ng](https://github.com/lanmaster53/recon-ng)
* Wiki/Docs: [https://bit.ly/recon-ng-wiki](https://bit.ly/recon-ng-wiki) (may redirect or archived)
* API/Script Examples: Included in module source code

---
