FROM python:3.12.3-slim

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

WORKDIR /app

CMD ['flask', 'run', '-h', '0.0.0.0', '-p', '5000]