FROM node:lts-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /app

FROM base AS prod-deps
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --prod --frozen-lockfile

FROM base AS build
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm run build

FROM node:lts-alpine
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /app

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Copy production dependencies
COPY --from=prod-deps /app/node_modules ./node_modules

# Copy the built application
COPY --from=build /app/build ./build

# Expose port (Railway uses PORT env variable)
EXPOSE 3000
ENV NODE_ENV=production
ENV PORT=3000

# Start the application
CMD ["pnpm", "run", "start"]
