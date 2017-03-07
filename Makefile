SOURCES := slides.rst
BROWSER := xdg-open

.PHONE: all

all: hovercraft

hovercraft: $(SOURCES)
	@mkdir -p output/hovercraft
	hovercraft $< output/hovercraft
	$(BROWSER) output/hovercraft/index.html

landslide: $(SOURCES)
	@mkdir -p output/landslide
	landslide -d output/landslide/index.html $<
	$(BROWSER) output/landslide/index.html

clean:
	-rm -rf output/hovercraft
	-rm -rf output/landslide
