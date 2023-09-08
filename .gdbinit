set disassembly-flavor intel

# Custom TUI layouts
tui new-layout asm-regs {-horizontal asm 3 regs 2} 2 status 0 cmd 1
tui new-layout src-regs {-horizontal src 3 regs 2} 2 status 0 cmd 1
tui new-layout godbolt {-horizontal src 1 asm 1} 2 status 0 cmd 1
tui new-layout aller {-horizontal {src 1 asm 1} 3 regs 2} 2 status 0 cmd 1
