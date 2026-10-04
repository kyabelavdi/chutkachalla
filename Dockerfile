# Use official Python 3.10.11 image
FROM python:3.10.11-slim

# Set work directory
WORKDIR /app

# Install system dependencies (if needed, can be removed if not using any OS deps)
RUN pip install --no-cache-dir --upgrade pip

# Copy requirements (if you use one)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# Run the Extractor module
CMD ["sh", "-c", "gunicorn app:app -b 0.0.0.0:8000 & python3 -m Extractor"]
