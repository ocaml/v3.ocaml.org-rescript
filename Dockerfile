# Install dependencies only when needed
FROM node:14-alpine AS deps

RUN apk add --update --no-cache python g++ make

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Rebuild the source code only when needed
FROM node:14-alpine AS builder
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN yarn build

# Production image, copy all the files and serve them
FROM alpine:latest AS runner

WORKDIR /app

RUN apk add thttpd

COPY --from=builder /app/out .

EXPOSE 3000

CMD ["thttpd", "-D", "-h", "0.0.0.0", "-p", "3000", "-d", "/app", "-l", "-", "-M", "60"]
