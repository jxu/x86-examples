# x86 Examples

## Running

`make` and target name to assemble and link.
Most binaries are designed to step through with a debugger and may not exit nicely.
DOS COM files are tested with emu2. 

## Debugging

`gdb test` to start debugging with GDB. 

`tui e` to enable visual debugging. 
`la a` and `la r` to show assembly and registers.
(All this can go into `~/.gdbinit`.)

`b _start` to set a breakpoint at `_start`, then `r` to run.
`si` to step instructions, `ni` to step over calls.
