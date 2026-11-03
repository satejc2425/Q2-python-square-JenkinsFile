FROM python:3.11-slim
WORKDIR /app
COPY square.py .
CMD ["python" , "square.py"]
