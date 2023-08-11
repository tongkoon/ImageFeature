# 
FROM python:3.9

# 
WORKDIR /ImageHog

# 
COPY ./requirements.txt /ImageHog/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /ImageHog/requirements.txt

# 
COPY ./app /ImageHog/app

ENV PYTHONPATH "${PYTHONPATH}:/ImageHog"

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

# 
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]