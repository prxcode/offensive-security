# Reconnaissance in Cybersecurity

**Reconnaissance** is the initial phase of a security assessment or penetration test, where the tester collects as much information as possible about a target system, organization, or network. The goal is to understand the environment, identify potential vulnerabilities, and map possible attack surfaces—*all without alerting the target if stealth is required*.

---

## Types of Reconnaissance

### 1. Active Reconnaissance

Active reconnaissance involves direct interaction with the target system. This may include network scanning, probing services, and querying servers. While it often yields more accurate and detailed results, it carries a higher risk of detection.

### 2. Passive Reconnaissance

Passive reconnaissance involves collecting data without direct interaction with the target. This includes analyzing publicly available resources such as websites, job listings, DNS records, and social media. It's stealthier but typically yields less granular information.

---

## Open Source Intelligence (OSINT)

OSINT refers to intelligence collected from publicly available sources. These can include:

* Search engines
* Social media platforms
* Public databases and archives
* Domain registration and DNS records
* Corporate websites and press releases

---

## Search Engine Techniques (e.g., "Google Dorking")

Search engines can reveal surprisingly detailed information through the use of advanced search operators. This technique, often referred to as “Google Dorking,” can be used to locate public but obscure data on the web, such as exposed files, configuration errors, or sensitive documents.

Common search operators include:

* `site:` — limits results to a specific domain
* `filetype:` — searches for specific file formats
* `inurl:` — targets URLs with specific patterns
* `intitle:` — looks for keywords in page titles
* `intext:` — searches within the body content

---

## Domain and DNS Analysis

DNS (Domain Name System) plays a vital role in directing internet traffic. Understanding DNS configurations and domain metadata can offer insight into a target’s infrastructure.

**Key DNS record types:**

* **A / AAAA** — IP address records (IPv4 / IPv6)
* **CNAME** — Canonical name mappings
* **MX** — Mail exchange servers
* **NS** — Name servers
* **SOA** — Start of authority (admin and refresh info)
* **TXT** — Miscellaneous text data, often used for verification

WHOIS lookups can reveal:

* Domain registrant information
* Registrar and expiration data
* Contact details and administrative info

---

## Social Reconnaissance

Organizations often leave indirect trails of information through their employees and public interactions. Social engineering or passive collection of employee data from professional or personal platforms can uncover valuable insights.

Sources for social recon:

* Professional networks (e.g., LinkedIn)
* Social media platforms
* Image reverse searches
* Public mentions in blogs, videos, or interviews

---

## Technology Fingerprinting

Identifying the technologies used on a website or application can help narrow down potential vulnerabilities. This includes recognizing frameworks, libraries, CMS platforms, web servers, and analytic tools.

Information can be gathered through:

* Website metadata
* HTTP headers
* Script and resource paths
* Online tech profiler services

---

## Subdomain Enumeration

Subdomains often host services or applications that are less protected or outdated. Mapping these subdomains helps expand the attack surface during assessments.

Subdomains can be discovered via:

* Public DNS records
* Certificate transparency logs
* OSINT tools and services
* Brute-forcing with wordlists
