MD = $(wildcard *.md)
HTML = $(patsubst %.md,docs/%.html,$(MD))

all: $(HTML)

docs/%.html: %.md docs
	pandoc -s -o $@ $<  -t slidy --css=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css --css=slide.css

docs/:
	mkdir -p $@

print-%:
	$(info $* = $($*))
