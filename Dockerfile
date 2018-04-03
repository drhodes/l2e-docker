FROM python:2.7-jessie

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    libxml2-utils \
    python-lxml \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -e git+https://github.com/mitocw/latex2edx.git#egg=latex2edx

ENTRYPOINT ["/usr/bin/env", "latex2edx"]
CMD ["--help"]
