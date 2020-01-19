.PHONY: deploy clean

deploy: build
	@echo "====> deploying to github"
	git worktree add /tmp/book gh-pages
	rm -rf /tmp/book/*
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push origin gh-pages

build:
	mdbook.exe build

clean:
	mdbook.exe clean
	git worktree remove /tmp/book --force