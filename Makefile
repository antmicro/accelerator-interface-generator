SBT?=sbt
MAIN?=AIG.AcceleratorDriver

SBT?=sbt
TB=ControllerSpec

WIDTH=600
HEIGHT=398
IMG=test-img.gray

TAG := $(shell cd src/fastvdma-chisel && git describe --tags --abbrev=0)
export TAG
CONFIG_FILE ?= "config.json"
CONFIG_ARG = $(if $(CONFIG_FILE),--config-path $(CONFIG_FILE),)

verilog: setup
	$(SBT) "runMain $(MAIN)"

setup:
	python3 tools/gen/accelerator_integration/aig_gen.py $(CONFIG_ARG)

test: setup
	$(SBT) "Test / testOnly -t *$(TB)"
	convert -size $(WIDTH)x$(HEIGHT) -depth 8 out.rgba -alpha off out.png

cocotb_test: verilog
	pytest cocotb-tests

clean:
	$(SBT) clean
	rm -f *.v *.fir *.f *anno.json *.rgba *.png
	rm -frd test_run_dir/

%:
	sphinx-build -M $@ docs build $(SPHINXOPTS) $(0)

.PHONY: setup verilog cocotb_test