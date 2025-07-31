FROM node:23.11.1-alpine3.21

WORKDIR /app

# Copy only package files for caching
COPY package*.json ./

# Install dependencies (bip39 should be in package.json)
RUN npm install

# Copy rest of the application
COPY . .

# Build the project
RUN npm run build

# Use a non-root user for security (optional)
# RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# USER appuser

EXPOSE 8000 443

CMD ["npm", "start"]
