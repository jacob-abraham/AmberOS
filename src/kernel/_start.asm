%ifndef _IC_START_ASM_
%define _IC_START_ASM_
bits 32


%ifndef STACK_OFFSET_32
%error "STACK_OFFSET_32 must be defined"
%endif

extern idt_init
extern main
global _start
_start:

    ; reset up stack
    mov esp, STACK_OFFSET_32
    xor ebp, ebp

    ; init idt for interrupts
    call idt_init

    call main
    jmp $

%endif
