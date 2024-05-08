# Use the official Node.js image as base
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY ./src/package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY ./src .

# Expose port
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
