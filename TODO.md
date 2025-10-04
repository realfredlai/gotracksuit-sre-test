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

## Regarding monitoring and observability for this application, what do you think we need in place, and are there any changes to the implementation we might need to make to accomplish this?

Deno itself comes with robust metrics and traces features by leveraging OpenTelemtry and Grafana. I found some implementation details at: https://docs.deno.com/examples/grafana_tutorial. 

Besides, often times, backend applications using K8s can be easily integrated with Prometheus for monitoring and observability. 

I have created a microservice-basic chart in ./helm directory where it helps the integration with Prometheus for monitoring and observability alongside Grafana.
