SCAD = $(wildcard *_adapter.scad)
#SCAD = apparent_systems.scad
STL = $(SCAD:%.scad=%.stl)

all: $(STL) copy
	@echo copied: $(STL)

copy:
	rsync -avh -e "ssh -x" *.stl alx@10.0.0.119:~/replicator/plotter//

%.stl: %.scad
	openscad -o $@ $<
