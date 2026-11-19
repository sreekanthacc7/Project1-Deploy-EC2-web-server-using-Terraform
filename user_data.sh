#!/bin/bash
set -euxo pipefail

# Update Ubuntu packages
apt-get update -y

# Install Nginx web server
DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

# Create the HTML website
cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevInfra Capstone Project 1</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eaf1fb;
            text-align: center;
            padding: 70px 20px;
        }

        .container {
            background: white;
            max-width: 650px;
            margin: auto;
            padding: 40px 25px;
            border-radius: 12px;
            box-shadow: 0 4px 20px #ccd6e5;
        }

        h1 {
            color: #153b76;
        }

        h2 {
            color: #2563eb;
        }

        p {
            color: #44546a;
            font-size: 18px;
        }

        .success {
            color: green;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>DevInfra Capstone Project 1</h1>
        <h2>Linux EC2 Web Server</h2>

        <p>Project by Sreekanth Reddy</p>
        <p>Cloud Platform: AWS</p>
        <p>Infrastructure as Code: Terraform</p>
        <p>Operating System: Ubuntu Linux</p>
        <p>Web Server: Nginx</p>

        <h2 class="success">
            Web Server Running Successfully!
        </h2>
    </div>
</body>
</html>
HTML

# Verify Nginx configuration
nginx -t

# Enable and start Nginx
systemctl enable --now nginx

# Restart Nginx
systemctl restart nginx

echo "Project 1 website setup completed"
