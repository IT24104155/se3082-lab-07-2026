MPICC ?= mpicc
MPIRUN ?= mpirun
NP ?= 4

PROGRAMS = Exercise01/program \
           Exercise02/sum_scatter \
           Exercise03/sum_gather \
           Exercise04/sum_reduce \
           Exercise05/sum_allreduce \
           Exercise06/sum_scan

.PHONY: all run clean

all: $(PROGRAMS)

Exercise01/program: Exercise01/sum_bcast.c
	$(MPICC) -o $@ $<

Exercise02/sum_scatter: Exercise02/sum_scatter.c
	$(MPICC) -o $@ $<

Exercise03/sum_gather: Exercise03/sum_gather.c
	$(MPICC) -o $@ $<

Exercise04/sum_reduce: Exercise04/sum_reduce.c
	$(MPICC) -o $@ $<

Exercise05/sum_allreduce: Exercise05/sum_allreduce.c
	$(MPICC) -o $@ $<

Exercise06/sum_scan: Exercise06/sum_scan.c
	$(MPICC) -o $@ $<

run: all
	$(MPIRUN) -np $(NP) ./Exercise01/program
	$(MPIRUN) -np $(NP) ./Exercise02/sum_scatter
	$(MPIRUN) -np $(NP) ./Exercise03/sum_gather
	$(MPIRUN) -np $(NP) ./Exercise04/sum_reduce
	$(MPIRUN) -np $(NP) ./Exercise05/sum_allreduce
	$(MPIRUN) -np $(NP) ./Exercise06/sum_scan

clean:
	rm -f $(PROGRAMS)
