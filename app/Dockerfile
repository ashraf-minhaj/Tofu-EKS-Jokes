#########################################
# author: ashraf minhaj
# email : ashraf_minhaj@yahoo.com
# 
# date: 13-02-24
# backend demo application 
#########################################

FROM python:3.10 as builder

WORKDIR /app

COPY src/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# runner stage
FROM python:3.10-slim as runner

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

# COPY main.py .
COPY src/ /app

RUN useradd -m backend; chown backend:backend /app
USER backend

EXPOSE 5005

CMD ["python", "main.py"]