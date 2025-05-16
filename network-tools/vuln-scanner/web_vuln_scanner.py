import requests

# Check for SQL Injection vulnerability
def check_sql_injection(url):
    payload = "' OR '1'='1"
    response = requests.get(url + payload)
    if "error" in response.text.lower():
        print(f"[+] SQL Injection vulnerability found at {url}")

# Check for basic XSS vulnerability
def check_xss(url):
    payload = "<script>alert('XSS')</script>"
    response = requests.get(url + payload)
    if payload in response.text:
        print(f"[+] XSS vulnerability found at {url}")

# Scan function
def scan(url):
    print(f"Scanning {url} for vulnerabilities...")
    check_sql_injection(url)
    check_xss(url)

if __name__ == "__main__":
    target_url = input("Enter the URL to scan: ")
    scan(target_url)
