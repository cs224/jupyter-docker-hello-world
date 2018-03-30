
all: project-image

environment.yml: ../environment.yml
	cp $< $@

project-image: environment.yml
	docker build --tag $(DATA_SCIENCE_PROJECT):201803301252 --tag $(DATA_SCIENCE_PROJECT):latest .
