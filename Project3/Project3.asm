;Author: Heeyoon Son
;Heeyoon_Son.asm
;This program will move all values position in the array by the "shift" value. If a value gets shifted out the last position it will simply wrap around to the fron of the array
;last modified: 10-15-2021
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
input BYTE 1,2,3,4,5,6,7,8
output BYTE lengthof input DUP(?)
shift DWORD 3
.code
main PROC
	mov esi, lengthof input
	sub esi, shift ;esi stores the index of the value in input that will become the first value for the output after the shift
	mov ecx, lengthof input 
	sub ecx, esi ;ecx should store the number of times a loop executes. In the first loop we need to get all the values that wrap around to the front of the array due to the shift, therefore ecx should be set to the total number of values in input that wrap around to the front of output
	mov edi, 0 ;edi represent the index of the destination. Our destination is the output array, so the output array must store values in the front first, therefore edi is set to 0

	;first loop l1 will insert all of the values in the input array that should "wrap around" to the front of the output array because of the shift
	l1:
		mov al, input[esi] 
		mov output[edi], al
		inc esi
		inc edi
	loop l1

	mov ecx, lengthof input
	sub ecx, shift ;the ecx is recalculated to the total number of remaining values in the input array that have yet been inserted into the outpur array.
	mov esi, 0 ;since the remaining values will reside in the front of the input array esi will need to be set to 0.

	;second loop l2 will insert all of the values in the input array that have been shifted by the "shift amount" but did not have to "wrap around" to the front of the output array.
	l2:
		mov al, input[esi]
		mov output[edi], al
		inc esi
		inc edi
	loop l2

main ENDP
END main