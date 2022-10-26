# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8501

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

CMD ["uvicorn","main:app","--reload","--host","0.0.0.0","--port","8000"]