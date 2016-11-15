NAME = deploy_talk
VERSION = 1

all: build_compiler compile build_release

build_compiler:
	docker build -f Dockerfile.build -t $(NAME)-build:latest .

#  The CMD in the Dockerfile actually defaults to this, but is repeated for clarity
compile:
	docker run --rm -v `pwd`:/app -e MIX_ENV=prod $(NAME)-build:latest \
		mix do compile, phoenix.digest, release --verbose

build_release:
	docker build -f Dockerfile.release -t $(NAME):$(VERSION) .

run:
	docker run --rm -p 4000:4000 $(NAME):$(VERSION)

clean:
	docker rmi $(NAME):$(VERSION)
	docker rmi $(NAME)-build:latest
	rm -rf rel/deploy_talk
