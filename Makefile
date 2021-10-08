GCP_PROJECT ?= pluralsh
APP_NAME ?= spilo
APP_VSN ?= 13.2
BUILD ?= `git rev-parse --short HEAD`
DKR_HOST ?= dkr.plural.sh
PGVERSION ?= 13
BASE_IMAGE ?= registry.opensource.zalan.do/library/ubuntu-18.04

build:
	cd postgres-appliance && docker build --build-arg PGVERSION=$(PGVERSION) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		-t gcr.io/$(GCP_PROJECT)/$(APP_NAME):$(APP_VSN) \
		-t $(DKR_HOST)/postgres/$(APP_NAME):$(APP_VSN) .

push:
	docker push gcr.io/$(GCP_PROJECT)/$(APP_NAME):$(APP_VSN)
	docker push $(DKR_HOST)/postgres/$(APP_NAME):$(APP_VSN)