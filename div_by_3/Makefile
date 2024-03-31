test: div_by_3
	./div_by_3

div_by_3: testbench.v div_by_3.v 
	  iverilog $^ -o $@

clean:
	rm -f div_by_3

help:
	@echo "  test  - Run testbench"
	@echo "  clean - Remove most generated files"
	@echo "  help  - Display this text"

.PHONY: clean test help
