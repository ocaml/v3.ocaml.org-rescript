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

# Production image containing only the static files
FROM alpine:latest AS data

WORKDIR /data

COPY --from=builder /app/out .
