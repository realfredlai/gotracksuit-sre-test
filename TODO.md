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

## what kinds of things will SRE need to put in place for us to scale the team out and collaborate on this product more effectively?

First of all, we need to identify current pain points in software development life cycle (SDLC), and learn and capture lessons learnt from incident responses so that we can have knowledge sharing and continuous improve from past experience. With the help of a clearly defined SDLC and CI/CD automation, it ensures a confident and smooth release experience, leading to better productivity.

Secondly, I am keen to introduce developer self-service experience if it doesn't exist that empowers developers to manage routine tasks such as user onboarding via AFT, K8s cluster provisioning using Cluster API, product release with ArgoCD, etc,.

Thirdly, a culture of ownership is the key to success. As a SRE, not only do we own the SDLC but also we monitor application performance and reliability, take actions when incident happens. We can also have well-defined threshold and triggers in alerting to notify relevant team members based on severity levels.

Lastly, On a daily basis, we pride on team collaboration and communication efficiency, including documentation, project scope definition. So it makes sure that tasks the team work on are achievable, manageable and time-boxed.
