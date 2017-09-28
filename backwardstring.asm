TITLE Copy a String in Reverse Order  (addsub.asm)

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD


.data
source BYTE " This is the source string", 0 
target BYTE SIZEOF source DUP('#') 

.code
main PROC

 mov esi, (OFFSET source) + (SIZEOF source) -1
 mov edi, OFFSET target
 mov ecx, SIZEOF source

L1: mov al, [esi]
 mov [edi], al
 dec esi              ; pointer to source string
 inc edi              ; pointer to target string
 loop L1
 
 mov esi, OFFSET target     ; offset of variable
 mov ebx, 1   ; byte format
 mov ecx, SIZEOF target-1 ; counter
 call Dumpmem
 
 exit

main ENDP
END main
