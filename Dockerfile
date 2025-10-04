# Use the official Deno@2.4.2 image as the base image
FROM denoland/deno:alpine-2.4.2 AS builder

# Set default architecture to a linux-x86_64-compatible target for the container
ARG ARCH=x86_64-unknown-linux-gnu

# Create working directory
WORKDIR /app

# Copy source
COPY . .

# Compile the server to a standalone executable
RUN deno task build:server

# Production stage
FROM denoland/deno:alpine-2.4.2

WORKDIR /app

# Copy the compiled server from the builder stage
COPY --from=builder /app/server/build/server ./server/build/server

RUN chown -R deno:deno /app

# Drop to the non-root deno user for runtime
USER deno

# Expose the port the server will run on
EXPOSE 8080

# Command to run the compiled server
CMD ["server/build/server"]