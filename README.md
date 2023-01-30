# x86 Examples

## Debugging

`gdb test` to start debugging with GDB. 

`tui e` to enable visual debugging. 
`la a` and `la r` to show assembly and registers.
(All this can go into `~/.gdbinit`.)

`b main` to set a breakpoint at `main`, then `r` to run.
`si` to step instructions, `ni` to step over calls.
