FROM node:23.11.1-alpine3.21

WORKDIR /app
COPY package*.json ./

# Install git before npm install
RUN apk add --no-cache git

RUN npm install
RUN npm install bip39

COPY . .

CMD ["node", "index.js"]
