FROM python:3.8-slim

# Install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Run the application
EXPOSE 5000
CMD ["python", "app.py"]