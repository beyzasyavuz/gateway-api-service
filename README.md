# API Gateway & Observability Lab

A production-ready DevOps infrastructure featuring an **Nginx Reverse Proxy & API Gateway** in front of a **FastAPI** microservice, complete with security rate limiting, response caching, and full observability via **Prometheus & Grafana**.

---

## Architecture & Features

### Nginx Gateway & Security
* **Rate Limiting:** Protects backend services by limiting clients to **2 requests/sec** (`rate=2r/s`) with a burst tolerance of 3 (`burst=3 nodelay`).
* **HTTP 429 Responses:** Rejects excessive spam requests with an explicit `429 Too Many Requests` status code.
* **In-Memory Caching:** Caches successful HTTP 200/302 responses for **10 seconds** to drastically reduce load on FastAPI.
* **Response Headers:** Exposes `X-Cache-Status` (`HIT` / `MISS`) headers for easy cache debugging.

### Observability & Metrics
* **Prometheus:** Scrapes and stores real-time metrics across services.
* **Grafana:** Visualizes system metrics and service health via custom dashboards.

---

## Getting Started

Start the entire stack with a single Docker Compose command:

```bash
docker compose up -d --build