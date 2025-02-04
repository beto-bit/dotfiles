CXX := g++
CXXFLAGS := -std=c++20 -O2 -Wall -Wextra -Wpedantic \
			-Wdeprecated -Wundef -Wunused -Wunreachable-code \
			-Wshadow -Wredundant-decls -Wswitch-enum \
			-Wdouble-promotion -Wfloat-equal -Wpointer-arith \
			-Wcast-qual -Wcast-align -Wold-style-cast -Wconversion \
			-Werror=return-local-addr -Werror=return-type

.PHONY: run clean

main: main.cpp

run: main
	./main

clean:
	rm -rf main main.o

compile_flags.txt: Makefile
	echo ${CXXFLAGS} | tr ' ' '\n' > $@

