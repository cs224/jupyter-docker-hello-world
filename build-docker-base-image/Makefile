
TAG_DATE=201812030859

jupyter-docker-base-image:
	docker build --build-arg HTTP_PROXY=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTPS_PROXY} --build-arg http_proxy=${HTTP_PROXY} --build-arg https_proxy=${HTTPS_PROXY} --tag jupyter-docker-base-image:${TAG_DATE} --tag jupyter-docker-base-image:latest .

rstudio:
	docker build --build-arg HTTP_PROXY=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTPS_PROXY} --build-arg http_proxy=${HTTP_PROXY} --build-arg https_proxy=${HTTPS_PROXY} --tag rstudio-docker-base-image:${TAG_DATE} --tag rstudio-docker-base-image:latest -f Dockerfile-rstudio .

pycharm:
	docker build --build-arg HTTP_PROXY=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTPS_PROXY} --build-arg http_proxy=${HTTP_PROXY} --build-arg https_proxy=${HTTPS_PROXY} --tag pycharm-docker-base-image:${TAG_DATE} --tag pycharm-docker-base-image:latest -f Dockerfile-pycharm .
