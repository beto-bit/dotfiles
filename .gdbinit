set verbose off
set debuginfod enabled on

# Custom TUI layouts
tui new-layout asm-regs {-horizontal asm 3 regs 2} 2 status 0 cmd 1
tui new-layout src-regs {-horizontal src 3 regs 2} 2 status 0 cmd 1
tui new-layout godbolt {-horizontal src 1 asm 1} 2 status 0 cmd 1
tui new-layout godbolt2 src 1 asm 1 status 0 cmd 1
tui new-layout aller {-horizontal {src 3 asm 2} 3 regs 2} 2 status 0 cmd 1
tui new-layout aller2 regs 1 src 1 asm 1 status 0 cmd 1

# Better GDB Defaults
set disassembly-flavor intel
set print asm-demangle on
set print pretty on
