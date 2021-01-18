MD = $(wildcard *.md)
HTML = $(patsubst %.md,docs/%.html,$(MD))

all: $(HTML)

# for revealjs only
# --css=slide.css
docs/%.html: %.md docs
	pandoc -s -o $@ $<  -t slidy \
	--css=https://cdn.jsdelivr.net/gh/ickc/markdown-latex-css/fonts/fonts.min.css \
	--css=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css \
	--css=https://cdn.jsdelivr.net/gh/ickc/markdown-latex-css/css/common.min.css

docs/:
	mkdir -p $@

print-%:
	$(info $* = $($*))

github_deploy: all
	ghp-import --no-jekyll --push docs
