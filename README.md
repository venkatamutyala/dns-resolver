# dns-resolver

A public, lightweight DNS resolver hosted on a Linux VPS. This project offers a direct, personal alternative to major ISP or corporate DNS providers.

📡 Server Details
You can configure your device or router to use the IPv4 address: `135.181.96.153` (WARNING: this is a dynamic IP, floating IPs cost more $)

⚠️ Performance & Limitations
Please be aware that this service is hosted on a budget-friendly VPS infrastructure ($3/month tier).
- Low Cache Retention: This resolver is configured with a very small cache size. You may experience higher latency for "cold" lookups compared to major providers like Cloudflare or Google.
- Single Point of Failure: This is currently a single-node setup. There is no redundancy or load balancing.
