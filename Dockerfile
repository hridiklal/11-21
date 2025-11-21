# Use multi-architecture base image
FROM --platform=$BUILDPLATFORM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app/ .

# Install dependencies
RUN pip install --no-cache-dir flask gunicorn

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
