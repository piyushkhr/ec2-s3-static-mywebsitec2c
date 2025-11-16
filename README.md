# ec2-s3-static-mywebsitec2c
Static website hosted on EC2 with images stored from S3. Fully automated using an EC2 User Data script. 

#Project Structure 

ec2-s3-static-website/
│
├── index.html # Main webpage
├── style.css # Styling
├── script.js # Button click logic
└── user-data.sh # EC2 boot script


# Features

- EC2 serves:
  - `index.html`
  - `style.css`
  - `script.js`
- S3 stores images:
  - `logo-design.png`
  - `banner.jpg`
  - `product.jpg`
- Apache automatically installs and starts
- Fully automated deployment with  *EC2 User Data*



#AWS Architecture Diagram  :

                      +-----------------------+
                      |      S3 Bucket - mybucketpykhr1028       |
                      |  images/             |
                      |  - logo-design.png           |
   +--------------+   |  - banner.jpg         |
   | User Browser |-->|  - product.jpg       |
   +--------------+   +-----------------------+
            |                     ▲
            |                     |
            v                     |
    +---------------------+       |
    |     EC2 Instance    |-------+
    |  Apache Web Server  |
    |  Serves:            |
    |   - index.html      |
    |   - style.css       |
    |   - script.js       |
    +---------------------+


