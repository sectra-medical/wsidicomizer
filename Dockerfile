FROM python:3.8-slim-bookworm

ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

# System deps:
# libopenslide0 and gcc needed for openslide extra
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    libturbojpeg0 \
    libopenslide0 \
    gcc \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app
# Copy in the config files:
COPY pyproject.toml ./

# Copy in everything else and install:
COPY . .
# Install with openslide extra. bioformats extra requires adding java
RUN pip install -e .[openslide]

# Run image with docker run -v /[slides folder]/:/slides wsidicomizer [arguments]
ENTRYPOINT ["wsidicomizer"]


