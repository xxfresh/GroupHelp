
FROM node:23.11.1-alpine3.21

WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install bip39

COPY . .
RUN npm run build
EXPOSE 8000 443
CMD ["npm", "start"]
