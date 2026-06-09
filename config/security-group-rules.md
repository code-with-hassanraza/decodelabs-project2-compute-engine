# Security Group: launch-wizard-1
# Instance: Server-Commander-01

| Type  | Protocol | Port | Source    | Purpose             |
|-------|----------|------|-----------|---------------------|
| SSH   | TCP      | 22   | My IP     | Secure admin access |
| HTTP  | TCP      | 80   | 0.0.0.0/0 | Public web traffic  |
| HTTPS | TCP      | 443  | 0.0.0.0/0 | Secure web traffic  |
