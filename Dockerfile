# Use the official Python image from the Docker Hub
FROM nvidia/cuda:12.6.2-cudnn-runtime-ubuntu24.04

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code into the container
COPY . .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

RUN cd mathlib4 && lake build

RUN cd ..

CMD ["python3", "quick_start.py"]

