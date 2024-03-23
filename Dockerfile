# Use Node.js as base image
FROM node:latest

# Install pnpm
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Install dependencies using pnpm
RUN pnpm install

# Copy all files from current directory to working directory
COPY . .

# Expose port 8080
EXPOSE 8080

# Start Vue.js development server
CMD ["pnpm", "run", "dev"]
