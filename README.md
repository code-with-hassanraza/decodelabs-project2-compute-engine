# ⚙️ Project 2 — The Compute Engine
### DecodeLabs Cloud Computing Internship | Batch 2026

![AWS](https://img.shields.io/badge/AWS-EC2-orange?logo=amazon-aws)
![Nginx](https://img.shields.io/badge/Nginx-Web_Server-009639?logo=nginx)
![Amazon Linux](https://img.shields.io/badge/OS-Amazon_Linux_2023-FF9900?logo=linux)
![SSH](https://img.shields.io/badge/Auth-SSH_Key-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Live](https://img.shields.io/badge/Website-Live-green)

---

## 📋 Scenario
A growing company needs a live, server-side web presence with full control over
the compute environment. The mission: provision a virtual machine on AWS, harden
it with Security Group firewall rules, connect securely via SSH, deploy Nginx
as the web server, and serve a live production-ready website — all through
pure cloud infrastructure with zero local servers.

---

## 🎯 Mission Accomplished
- ✅ Launched EC2 instance (Server-Commander-01) on Amazon Linux 2023
- ✅ Configured Security Group with ports 22 (SSH), 80 (HTTP), 443 (HTTPS)
- ✅ Connected securely via SSH using .pem key pair authentication
- ✅ Installed and configured Nginx as the event-driven web server
- ✅ Deployed the DecodeLabs "Mission Accomplished" webpage via nano
- ✅ Website live and accessible at http://100.54.35.199

---

## 🏗️ Architecture

```
Developer (Local Machine)
     │
     │  SSH (Port 22) — .pem key authentication
     ▼
┌──────────────────────────────────────────────┐
│              AWS VPC (Default)               │
│                                              │
│   ┌────────────────────────────────────────┐ │
│   │    Security Group: launch-wizard-1     │ │
│   │                                        │ │
│   │    Port 22  → SSH    → My IP only      │ │
│   │    Port 80  → HTTP   → 0.0.0.0/0       │ │
│   │    Port 443 → HTTPS  → 0.0.0.0/0       │ │
│   └──────────────────┬─────────────────────┘ │
│                      │                       │
│   ┌──────────────────▼─────────────────────┐ │
│   │      EC2: Server-Commander-01           ││
│   │      t3.micro | Amazon Linux 2023       ││
│   │      Kernel-6.1 AMI                     ││
│   │                                         ││
│   │      Nginx (Event-Driven)               ││
│   │      /usr/share/nginx/html/             ││
│   │                                         ││
│   │   ┌─────────────────────────────────┐   ││
│   │   │  DecodeLabs: Mission Accomplished│  ││
│   │   │  index.html                      │  ││
│   │   └─────────────────────────────────┘   ││
│   └─────────────────────────────────────────┘│
└──────────────────────────────────────────────┘
          │
          │  HTTP Port 80 — Public Internet
          ▼
    Public Users → http://100.54.35.199
```

---

## 📁 Repository Structure

```
decodelabs-project2-compute-engine/
├── README.md
├── src/
│   ├── index.html
│   ├── style.css
│   └── script.js
├── config/
│   ├── security-group-rules.md
│   └── nginx-setup-commands.sh
└── screenshots/
    ├── 01-ec2-instance-running.png
    ├── 02-security-group-config.png
    ├── 03-ssh-connection-success.png
    ├── 04-nginx-active-running.png
    └── 05-live-webpage-on-ec2.png
```

---

## 🖥️ EC2 Instance Configuration

| Setting | Value |
|---|---|
| Instance Name | Server-Commander-01 |
| Instance Type | t3.micro (Free Tier) |
| AMI | Amazon Linux 2023 |
| Kernel | 6.1 |
| Region / AZ | us-east-1a (N. Virginia) |
| Key Pair | server-commander-key.pem |
| Web Server | Nginx (Event-Driven) |
| Website URL | http://100.54.35.199 |

---

## 🔒 Security Group Rules (launch-wizard-1)

| Type | Protocol | Port | Source | Purpose |
|---|---|---|---|---|
| SSH  | TCP | 22 | My IP only | Secure admin access |
| HTTTp | TCP | 80 | 0.0.0.0/0 | Public web traffic |
| HTTPS | TCP | 443 | 0.0.0.0/0 | Secure web traffic |

---

## 🚀 Nginx Setup Commands

```bash
# Update system packages (Amazon Linux 2023 uses dnf)
sudo dnf update -y

# Install Nginx web server
sudo dnf install nginx -y

# Start Nginx
sudo systemctl start nginx

# Enable Nginx to auto-start on reboot
sudo systemctl enable nginx

# Verify Nginx is running
sudo systemctl status nginx

# Create/edit the webpage using nano
sudo nano /usr/share/nginx/html/index.html
```

---

## 🌐 Live Website Preview

**URL:** http://100.54.35.199

```
┌──────────────────────────────────────────────────────┐
│                                                      │
│        ●  SERVER ONLINE  |  STATUS: ACTIVE           │
│                                                      │
│           Welcome to                                 │
│           DecodeLabs:                                │
│           Mission Accomplished                       │
│                                                      │
│   AWS EC2 Instance · Amazon Linux 2023 · Nginx       │
│   Deployed by Muhammad Hassan Raza                   │
│   Cloud Computing Intern · Batch 2026                │
│                                                      │
│  ┌──────────────────┐  ┌──────────────────────────┐  │
│  │  INSTANCE TYPE   │  │       WEB SERVER         │  │
│  │  t3.micro        │  │  Nginx (Event-Driven)    │  │
│  │  (Free Tier)     │  │                          │  │
│  └──────────────────┘  └──────────────────────────┘  │
│                                                      │
│  ┌──────────────────┐  ┌──────────────────────────┐  │
│  │ OPERATING SYSTEM │  │        SECURITY          │  │
│  │ Amazon Linux     │  │  SSH Key Auth            │  │
│  │ 2023 Kernel-6.1  │  │  SG Firewall             │  │
│  └──────────────────┘  └──────────────────────────┘  │
│                                                      │
│   DECODELABS CLOUD COMPUTING INTERNSHIP · PROJECT 2  │
└──────────────────────────────────────────────────────┘
```

**Design:** Dark terminal-style aesthetic with monospace font,
orange brand accent, green status indicator, 2×2 info card grid.

---

## 🆚 EC2 vs S3 Static Hosting

| Feature | S3 Static | EC2 + Nginx |
|---|---|---|
| Server Control | None | **Full root access** ✅ |
| Dynamic Content | No | **Yes (with backend)** ✅ |
| Custom Config | Limited | **Full Nginx config** ✅ |
| OS Access | None | **SSH + full Linux** ✅ |
| Cost Model | Per GB stored | Per hour running |
| Best For | Static files | **Server-side apps** ✅ |

---

## 📸 Screenshots
> See the `/screenshots` folder for step-by-step visual proof of the complete setup.

| Screenshot | What It Shows |
|---|---|
| 01-ec2-instance-running.png | EC2 console — Server-Commander-01 Running |
| 02-security-group-config.png | launch-wizard-1 inbound rules — ports 22, 80, 443 |
| 03-ssh-connection-success.png | Terminal — Amazon Linux 2023 SSH banner + prompt |
| 04-nginx-active-running.png | Terminal — `systemctl status nginx` showing active |
| 05-live-website-on-ec2.png | Browser — DecodeLabs Mission Accomplished page live |

---

## 🛠️ Technologies Used
- **Amazon EC2** — Virtual compute instance (t3.micro)
- **Amazon Linux 2023** — Server operating system (Kernel 6.1)
- **Nginx** — Event-driven web server
- **AWS Security Groups** — Stateful network firewall (launch-wizard-1)
- **SSH / .pem Key Pair** — Secure remote access authentication
- **nano** — Terminal text editor for file creation on server
- **HTML5** — Website source files

---

## 👤 Author
**Muhammad Hassan Raza**
Cloud Computing Intern @ DecodeLabs | Batch 2026
