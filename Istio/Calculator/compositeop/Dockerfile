FROM python:alpine
WORKDIR /app

COPY requirements.txt /app
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app.py /app/

EXPOSE 80
CMD [ "python", "./app.py" ]