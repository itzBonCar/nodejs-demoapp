# Build Stage
ARG NODE_VERSION=24.12.0
FROM node:${NODE_VERSION}-alpine AS builder

ENV NODE_ENV=production
WORKDIR /app

# copy package*.json first, build it then copy rest of the files to speed up the build
COPY src/package*.json ./

# install packages under dependencies only and ignore devDependencies
# delete npm cache folder content
RUN npm ci --only=production && npm cache clean --force

# Copy the rest of the source files into the image
COPY src/ ./


# Prod Stage
ARG NODE_VERSION=24.12.0
FROM node:${NODE_VERSION}-alpine AS production

WORKDIR /app

# Create non-root system user and system group
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001

# Copy built application from builder stage
COPY --from=builder /app /app

# Ensure the non-root user can read the app files and dependencies
RUN chown -R nodejs:nodejs /app

# Switch to non-root user
USER nodejs

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=2 \
  CMD node -e "require('http').get('http://localhost:3000', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Run the application.
ENTRYPOINT ["npm"]
CMD ["start"]
