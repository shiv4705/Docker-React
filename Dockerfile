# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the container's working directory
COPY . .

# Build the React application for production
RUN npm run build

# Install a simple HTTP server to serve the static files
RUN npm install -g serve

# Expose the port that the server runs on
EXPOSE 5000

# Command to run the application
CMD ["serve", "-s", "build"]