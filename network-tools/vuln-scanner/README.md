# Web Application Vulnerability Scanner

## Description
This Python-based scanner helps identify basic web application vulnerabilities such as SQL Injection (SQLi) and Cross-Site Scripting (XSS). It sends test payloads to the provided URL and checks for responses that indicate vulnerabilities.

## Features
- Checks for SQL Injection vulnerabilities by injecting common payloads.
- Checks for Cross-Site Scripting (XSS) vulnerabilities by injecting simple script tags.
- Easy to extend with additional vulnerability checks.

## Prerequisites
Make sure you have Python installed (Python 3.x recommended) and the following dependencies:
```bash
pip install requests
```

## Usage
Clone the repository:
```bash
git clone https://github.com/yourusername/web-vuln-scanner.git
```
## Run the Scanner: Run the script and enter the target URL when prompted:
```
python web_vuln_scanner.py
```
## Example Output:
```
Enter the URL to scan: http://example.com
Scanning http://example.com for vulnerabilities...
[+] SQL Injection vulnerability found at http://example.com'
[+] XSS vulnerability found at http://example.com<script>alert('XSS')</script>```
