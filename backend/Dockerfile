# Dockerfile for Flask + PostgreSQL backend
FROM python:3.11-slim

LABEL name="vehicle-app"

ENV APP_HOME="/app"

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

# Prepend Poetry and the virtual environment to the PATH
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"
ENV PYTHONPATH=$APP_HOME

# Set work directory
WORKDIR $APP_HOME

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install --upgrade pip && pip install poetry

# Copy only dependency files first for caching
COPY pyproject.toml poetry.lock ./

# Install project dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

# Copy the rest of the application
COPY . .

# Expose port (Flask default)
EXPOSE 5000

# Set environment variables for Flask
ENV FLASK_APP=run.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the Flask application directly with Python
CMD ["flask", "run"]