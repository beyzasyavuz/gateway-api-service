# FinTech Nginx Reverse Proxy & Security Architecture

A secure, high-performance, and production-ready **Nginx Web Server Architecture** configured on **WSL2 (Ubuntu)**.

---

## Architecture & Key Features

### 1. Security & SSL/TLS
* **Self-Signed SSL Certificate:** Generated via `OpenSSL` supporting modern protocols (`TLSv1.2` & `TLSv1.3`).
* **HTTP to HTTPS Redirection:** Automatic `301 Moved Permanently` redirect from HTTP (`port 8080`) to HTTPS (`port 8443`).
* **Security Hardening:** Version info hidden (`server_tokens off;`) to mitigate footprinting and exploit targeting, alongside custom security headers.

### 2. Traffic Management & Reverse Proxy
* **Static Asset Serving:** Renders frontend static assets (`index.html`) directly from `/var/www/html`.
* **API Reverse Proxy:** Seamlessly proxies requests under `/api/` to the backend application running on `port 5000`.
* **Custom Error Handling:** Integrated custom-designed 404 error page.

### 3. DDoS Protection & Rate Limiting
* **Zone Configuration:** Strict rate limit set to 2 requests per second (`rate=2r/s`) per IP.
* **Burst Management:** Configured `burst=5 nodelay` to handle legitimate traffic spikes smoothly.
* **Overload Prevention:** Drops excessive requests with `503 Service Temporarily Unavailable` status to protect upstream services.

### 4. Performance & Observability
* **Gzip Compression:** Enabled for faster load times and reduced bandwidth consumption.
* **Access & Error Logging:** Configured real-time log tracking via `/var/log/nginx/`.

---

## Quick Start & Testing

### Validate Configuration
```bash
sudo nginx -t