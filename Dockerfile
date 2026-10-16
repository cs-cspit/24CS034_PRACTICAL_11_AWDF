# Practical 11: Frontend Dockerfile for React (Vite)
# Step 3 & Supplementary Problem 2: Multi-Stage Build to reduce image size

# Stage 1: Build the React Application
FROM node:18 AS build
WORKDIR /app

# Copy dependency manifests first to leverage Docker layer caching
COPY package*.json ./

# Install dependencies inside the container
RUN npm install

# Copy source code and build production distribution
COPY . .
RUN npm run build

# Expose Vite preview port
EXPOSE 5173

# Serve production preview accessible across Docker container network
CMD ["npm", "run", "preview", "--", "--host"]
