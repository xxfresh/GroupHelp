FROM node:23.11.1-alpine3.21

WORKDIR /app

# Install git, python3, make, g++, and canvas dependencies
RUN apk add --no-cache \
    git \
    python3 \
    make \
    g++ \
    libc6-compat \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    giflib-dev \
    pixman-dev

COPY package*.json ./

RUN npm install
RUN npm install bip39

COPY . .

CMD ["npm", "start"]
