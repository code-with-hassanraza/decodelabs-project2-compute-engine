# Apache Setup Commands — EC2 Amazon Linux 2

# Update packages
sudo dnf update -y

# Install Nginx
sudo dnf install nginx -y

# Start Nginx
sudo systemctl start nginx

# Enable on boot
sudo systemctl enable nginx

# Check status
sudo systemctl status nginx

# Create/edit the webpage using nano
sudo nano /usr/share/nginx/html/index.html
