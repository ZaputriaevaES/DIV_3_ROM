test: memory
	./memory

memory: testbench.v rom.v 
	  iverilog $^ -o $@

clean:
	rm -f memory

help:
	@echo "  test  - Run testbench"
	@echo "  clean - Remove most generated files"
	@echo "  help  - Display this text"

.PHONY: clean test help
