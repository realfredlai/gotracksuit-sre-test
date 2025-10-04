# What to do

## Tell us what we need to get the frontend application accessible from the web?

As the front is SPA, there are 3 popular hosting options to consider:

**AWS native**

- Dockerize and host within K8s, EC2, Lambda, etc,.
- S3 bucket + CloudFront solution
- amplify: Provide seamless development experience and is tightly coupled with AWS eco system

**Vercel**

- Simplified deployment similar to Amplify but in my opinion it has superior metrics and monitoring pre-configured. 

**Cloudflare workers**

- Comparable to Vercel but provides a better security features and edge computing performance.