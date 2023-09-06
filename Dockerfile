FROM python:3.9-slim
WORKDIR /app
COPY .. /app/
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    /usr/local/bin/pip3 install -r requirements.txt
EXPOSE 8080
HEALTHCHECK CMD python3 -c 'from urllib import request; request.urlopen("http://localhost:8080/_stcore/health")'
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
