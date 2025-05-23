MAKEFLAGS := -j $(shell nproc)

.PHONY: run clean format disasm raw

CC := gcc
CFLAGS := -std=c17 -g -O2 \
			-Wall -Wextra -Wpedantic \
			-Wdeprecated -Wunreachable-code -Wduplicated-branches \
			-Wduplicated-cond -Wswitch-enum \
			-Wundef -Wunused -Wshadow -Wredundant-decls \
			-Wdouble-promotion -Wfloat-equal -Wpointer-arith \
			-Wcast-qual -Wcast-align -Wconversion -Wold-style-definition \
			-Wvla -Wformat=2 -Wlogical-op -Wnull-dereference \
			-Werror=return-local-addr -Werror=return-type

LDFLAGS :=

TARGET := main
BUILDDIR := build

SRCS := main.c
OBJS := ${SRCS:%.c=${BUILDDIR}/%.o}


${TARGET}: ${OBJS}
	@ echo "Linking..."
	@ mkdir -p $(dir $@)
	@ ${CC} ${LDFLAGS} $^ -o $@

${BUILDDIR}/%.o: %.c
	@ echo "Compiling ${<}..."
	@ mkdir -p $(dir $@)
	@ ${CC} ${CFLAGS} -MD $< -c -o $@


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
	echo ${CFLAGS} | tr ' ' '\n' > $@


-include $(OBJS:.o=.d)
