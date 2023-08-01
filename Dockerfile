FROM python:3.7

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    dvipng \
    libxml2-utils \
    python3-lxml \
    texlive \
    texlive-latex-extra \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
	git+https://github.com/plastex/plastex.git@d85adb4800407bdb8ff17a5757faef8de0f1fde3 \
	unidecode \
	-e git+https://github.com/mitocw/latex2dnd.git#egg=latex2dnd \
	-e git+https://github.com/drhodes/latex2edx.git@exp#egg=latex2edx

COPY entry.sh /usr/local/bin/entry.sh
ENTRYPOINT ["/usr/local/bin/entry.sh"]
