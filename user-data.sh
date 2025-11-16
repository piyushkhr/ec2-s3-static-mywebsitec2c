#!/bin/bash
# Update packages
yum update -y

# Install Apache Web Server
yum install -y httpd

# Start & enable Apache
systemctl start httpd
systemctl enable httpd

# Go to web folder
cd /var/www/html

# ------------------------------
# Create index.html
# ------------------------------
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EC2 + S3 Static Website</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <img src="https://mybucketpykhr1028.s3.us-east-1.amazonaws.com/images/logo-design.png" 
             alt="Website Logo" class="logo">

        <h1>Welcome to My Static Website</h1>

        <img src="https://mybucketpykhr1028.s3.us-east-1.amazonaws.com/images/banner.jpg" 
             alt="Banner" class="banner">
    </header>

    <section class="content">
        <h2>Hosted on EC2 with Images from S3</h2>
        <p>This website loads HTML, CSS, and JavaScript from an EC2 instance and images from Amazon S3.</p>

        <img src="https://mybucketpykhr1028.s3.us-east-1.amazonaws.com/images/product.jpg" 
             alt="Product Image" class="product">

        <button id="btnMessage">Click Me</button>

        <p id="outputMessage"></p>
    </section>

    <footer>
        <p>Powered by EC2 + S3</p>
    </footer>

    <script src="script.js"></script>
</body>
</html>
EOF

# ------------------------------
# Create style.css
# ------------------------------
cat << 'EOF' > style.css
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: #f2f2f2;
}

header {
    text-align: center;
    padding: 20px;
    background: #2d6cdf;
    color: white;
}

.logo {
    width: 120px;
    margin-bottom: 10px;
}

.banner {
    width: 100%;
    max-height: 300px;
    object-fit: cover;
    border-bottom: 4px solid #1e4bb8;
}

.content {
    padding: 20px;
    text-align: center;
}

.product {
    width: 250px;
    margin: 20px auto;
    display: block;
}

button {
    padding: 10px 20px;
    background: #1e4bb8;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background: #123a8a;
}

footer {
    text-align: center;
    padding: 10px;
    background: #2d6cdf;
    color: white;
    margin-top: 20px;
}
EOF

# ------------------------------
# Create script.js
# ------------------------------
cat << 'EOF' > script.js
document.getElementById("btnMessage").addEventListener("click", function () {
    document.getElementById("outputMessage").innerText =
        "Button clicked! This message is powered by script.js from EC2.";
});
EOF

# Permissions
chmod -R 755 /var/www/html
chown -R apache:apache /var/www/html
