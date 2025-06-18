FROM python:3.12-slim

WORKDIR /app

# Copy dependency files first for better layer caching
COPY pyproject.toml ./

# Install dependencies
RUN pip install --no-cache-dir -e .

# Copy application files
COPY main.py langgraph.json ./

# Set environment variables
ENV PYTHONPATH=/app
ENV PORT=8000

# Expose the port
EXPOSE 8000

# Run the application - use langgraph up for production
CMD ["langgraph", "up", "--host", "0.0.0.0", "--port", "8000"] 