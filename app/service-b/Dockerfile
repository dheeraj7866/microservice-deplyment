FROM node:16-slim

# Set working directory
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Run the application
EXPOSE 3000
CMD ["npm", "start"]