MYSS SEGMENT PARA STACK 'S'
	DW 20 DUP (?)
MYSS ENDS

MYDS SEGMENT PARA 'D'
DIZI DB 1, 2, 3, 4, 5, 6, 7, 8, 9
ELEMAN DW 9
ISTENEN DB 5
INDEX DW -1
MYDS ENDS

MYCS SEGMENT PARA 'C'
	ASSUME CS:MYCS, SS:MYSS, DS:MYDS
MAIN PROC FAR
	PUSH DS
	XOR AX, AX
	PUSH AX
	MOV AX, MYDS
	MOV DS, AX
	MOV CX, ELEMAN
	XOR SI, SI
	MOV AH, ISTENEN
L1: CMP AH, DIZI[SI]
    JNE L2
    MOV INDEX, SI
    JMP L3
L2: INC SI
    LOOP L1
L3: RETF
MAIN ENDP
MYCS ENDS
	END MAIN

