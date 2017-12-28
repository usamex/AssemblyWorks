mys segment para stack 'stacks'
	dw 20 dup (?)
mys ends

myd 	segment para 'datas'
dizi 	db 6,5,4,3,2,1
n 		dw 6
myd 	ends

myc		segment para 'codes'
	assume cs:myc, ss:mys, ds: myd
main	proc	far
	push ds
	xor ax,ax
	push ax
	mov ax, myd
	mov ds, ax
	
	mov cx, n
	dec cx
	mov si,1
l1:	
	mov di, si
	dec di
	mov al, dizi[si]
	push cx
	mov cx,si
l2:
	cmp dizi[di], al
	jbe l3
	mov ah, dizi[di]
	mov dizi[di + 1], ah
	dec di
	loop l2
l3:	
	mov dizi[di + 1], al
	inc si
	pop cx
	loop l1
	retf
main	endp
myc		ends
	end main