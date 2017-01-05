SCAD = $(wildcard *_adapter.scad)
STL = $(SCAD:%.scad=%.stl)

all: $(STL) copy

copy:
	rsync -avh -e "ssh -x" *.stl 10.0.0.119:~/replicator/plotter/

%.stl: %.scad
	openscad -o $@ $<
