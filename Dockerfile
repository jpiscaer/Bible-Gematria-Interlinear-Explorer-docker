# Use Python 3.12 slim image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Set working directory
WORKDIR /app

# Install system dependencies
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    gcc \
#    && rm -rf /var/lib/apt/lists/*

# Copy application files explicitly
COPY myproject.py /app/
COPY wsgi.py /app/
COPY myproject.ini /app/
COPY myproject.service /app/
COPY requirements.txt /app/

# unzip the database if present as zip
#RUN if [ -f Complete.zip ]; then unzip -o Complete.zip -d ${APP_DIR}; fi

# Copy database file
COPY Complete.db /app/

# Copy static directories
COPY static/ /app/static/
COPY LC_/ /app/LC_/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Create cache directory
RUN mkdir -p /app/CACHED_PAGES

# Set proper permissions for web-accessible directories
RUN chmod -R 755 /app/static/ /app/LC_/

# Verify all required files and directories are present
RUN echo "=== Verifying required files ===" && \
    ls -la /app/Complete.db && \
    echo "=== Static directory contents ===" && \
    ls -la /app/static/ && \
    echo "=== LC_ directory contents ===" && \
    ls -la /app/LC_/ | head -10 && \
    echo "=== Application files ===" && \
    ls -la /app/*.py && \
    echo "=== Testing LC_ file access ===" && \
    ls -la /app/LC_/*.jpg | head -3

# Expose port
EXPOSE 8000

# Run the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "--timeout", "120", "myproject:app"]
