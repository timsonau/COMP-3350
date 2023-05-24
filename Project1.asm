;Heeyoon Son
;Heeyoon_Son.asm
;I referenced "Assembly Language for x86 Processors (Sixth edition)" to figure out array element access
;I also referenced https://stackoverflow.com/questions/1135679/does-using-xor-reg-reg-give-advantage-over-mov-reg-0 forum to compare the most optimal way to set the registar to 0

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
input BYTE 1,2,3,4,5,6,7,8
shift BYTE 2

.code
main PROC
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx

	mov ah, input
	add ah, shift

	mov al, [input+1] ;one byte offset
	add al, shift

	mov bh, [input+2]
	add bh, shift

	mov bl, [input+3]
	add bl, shift

	mov ch, [input+4]
	add ch, shift

	mov cl, [input+5]
	add cl, shift

	mov dh, [input+6]
	add dh, shift

	mov dl, [input+7]
	add dl, shift

	INVOKE ExitProcess, 0

main ENDP
END main