MAKEFLAGS := -j $(shell nproc)

.PHONY: run clean format disasm raw

CXX := g++
CXXFLAGS := -std=c++20 -g -O2 \
			-Wall -Wextra -Wpedantic \
			-Wdeprecated -Wunreachable-code -Wduplicated-branches \
			-Wduplicated-cond -Wswitch-enum \
			-Wundef -Wunused -Wshadow -Wredundant-decls \
			-Wdouble-promotion -Wfloat-equal -Wpointer-arith \
			-Wcast-qual -Wcast-align -Wold-style-cast -Wconversion -Wnarrowing \
			-Wvla -Wnrvo -Wformat=2 -Wlogical-op -Wnull-dereference \
			-Woverloaded-virtual \
			-Werror=return-local-addr -Werror=return-type

LDFLAGS :=

TARGET := main
BUILDDIR := build

SRCS := main.cpp
OBJS := ${SRCS:%.cpp=${BUILDDIR}/%.o}


${TARGET}: ${OBJS}
	@ echo "Linking..."
	@ mkdir -p $(dir $@)
	@ ${CXX} ${LDFLAGS} $^ -o $@

${BUILDDIR}/%.o: %.cpp
	@ echo "Compiling ${<}..."
	@ mkdir -p $(dir $@)
	@ ${CXX} ${CXXFLAGS} -MD $< -c -o $@


run: ${TARGET}
	./${TARGET}

clean:
	rm -rf ${TARGET} ${OBJS}

format:
	clang-format -i ${SRCS}

disasm: ${TARGET}
	@ objdump -dC -M intel $< | bat --style=plain --wrap=never -l asm

raw: ${TARGET}
	@ hexyl $< | bat --style=plain

compile_flags.txt: Makefile
	echo ${CXXFLAGS} | tr ' ' '\n' > $@


-include $(OBJS:.o=.d)
