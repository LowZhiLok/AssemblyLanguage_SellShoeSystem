.386
.model flat, stdcall
.stack 4096
includelib irvine32.lib
include D:\Irvine\irvine32.inc

.data 
;----------------------------------------- LOGO--------------------------------------------
	logoMsg	  db 0dh, 0ah, "  --   --  -  ____ -  -  ___ - - ____     -   --    _____  - ____ -  ___   ___  - _____   -   --   --  -- ", 0
	logoMsg1  db 0dh, 0ah, "   --  -    //   // - - /   \\- /    |  --   --    / ___/-  //  | - |  |-/   \\  //    \   --   ---   -  ", 0
	logoMsg2  db 0dh, 0ah, " -    --   ||   ||-  -- |     |-|  o  |    --   - (   \\_  -||  \__//  | |     |-||  O  | -   --  -   -  ", 0
	logoMsg3  db 0dh, 0ah, "  ---   -  ||   ||  - - |  O  | |  _  |  --   -  - \\__  |  ||   __    |-|  O  | || __ //   - ---  --  - ", 0
	logoMsg4  db 0dh, 0ah, " -   --   -||    \\___--|     |-|  |  | -    --    /  \\ |- ||  / -\\  | |     |-||   |   --     ---   --", 0
	logoMsg5  db 0dh, 0ah, "  -  -  --  \\       \\ |     |-|  |  |    --   -  \\    |  ||  |- -|  |-|     | ||   | -   --   --   -  ", 0
	logoMsg6  db 0dh, 0ah, " --   --   - \\______//- \\___/ -|__|__| --   -   - \\___| - \\_| - \\_/ -\\___/ -\\__/   --   -   --    ", 0


;----------------------------------- section 1 - LOGIN ------------------------------------
	welcomeMsg   db 0dh, 0ah, "Great to meet You! Please login before shopping.", 0
	welcomeMsg1  db 0dh, 0ah, "----------------------------------------------", 0
	loginMsg     db 0dh, 0ah, "USER ID: ", 0
	passwordMsg  db 0dh, 0ah, "Password: ", 0
	errorMsg1    db 0dh, 0ah, "*** INVALID USERID. ACCESS DENIED. ***", 0
	errorMsg2    db 0dh, 0ah, "*** INVALID PASSWORD. ACCESS DENIED. ***", 0
	successMsg     db 0dh, 0ah, "****** LOGIN SUCCESSFULLY *******", 0

	userID db "aaa", 0
	password db "123", 0
	;----------- 3 time chances to login -------------
	chance db 3, 0					

	;----------- userID input---------- -
	USERN LABEL BYTE
	NMAX   DB 4
	NACT   DB ?
	UNAME  DB 4 DUP(? ), 0

	;----------- PASSWORD Input-----------
	USERP LABEL BYTE
	PMAX   DB 4
	PACT   DB ?
	UPASS  DB 4 DUP(? ), 0
;------------------------------------- end section 1 ----------------------------------------


;==========================Welcome message & Enter information=============================
msg1 db "Welcome to our LOA Shoe Shop!", 0 
msg2 db 0dh,0ah, "-----------------------------", 0

msg3 db 0dh,0ah, ">> Customer's name: ", 0
customerName db 30 DUP(?), 0

msg4 db 0dh,0ah, ">> Customer's contact number: ", 0
customerContactNumber db 10 DUP(?), 0

msg5 db 0dh,0ah, ">> Customer's Location: ", 0
customerLocation db 100 DUP(?), 0

msg6 db 0dh,0ah, ">> Loyal customer status (Y/N): ", 0
msg7 db 0dh,0ah, "Invalid Input. Must enter Y/N", 0
answerYN db 0
loyalCustomer db 0
NoLoyalCustomer db 0
;=========================================================================================

;==========================Product Page=============================
msg8 db 0dh,0ah, "A - Men shoes        B - Girls shoes", 0
msg9 db 0dh,0ah, "------------------------------------", 0
msg10 db 0dh,0ah, "Please choose A/B >> ", 0
answerAB db 0
msg11 db 0dh,0ah, "Invalid input. Must enter A/B", 0
msg12 db 0dh,0ah, "## This is Men Shoes Menu ##", 0
msg13 db 0dh,0ah, "----------------------------", 0dh,0ah, "1. Oxford - RM921", 0dh,0ah, "2. Derby - RM289", 0dh,0ah, "3. Blucher - RM523", 0dh,0ah, "4. Chelsea Boot - RM280", 0dh,0ah, "5. Loafer - RM310", 0dh,0ah, "6. Brogues - RM235", 0dh,0ah, "0. Exit", 0
msg14 db 0dh,0ah, "Please enter 1-6 or 0 for exit: ", 0
menShoesNumbers db 0
msg15 db 0dh,0ah, "Invalid input. Must enter 1-6 or 0 for exit.", 0
msg16 db 0dh,0ah, "Quantity: ", 0
Oxfordquantity dword 0
Derbyquantity dword 0
Blucherquantity dword 0
ChelseaBootquantity dword 0
Loaferquantity dword 0
Broguesquantity dword 0

msg17 db 0dh,0ah, "Added the products. Did you want to add again? (Y/N): ", 0
answerYN2 db 0
msg18 db 0dh,0ah, "Invalid Input. Must enter Y/N only.", 0
;=========== Men shoes price ===========
Oxford dword 921
Derby  dword 289
Blucher dword 523
ChelseaBoot dword 280
Loafer dword 310
Brogues dword 235
;=========== Men shoes price ===========

msg35 db 0dh,0ah, "## This is Girls Shoes Menu ##", 0
msg36 db 0dh,0ah, "----------------------------", 0dh,0ah, "1. Stilettos - RM 280", 0dh,0ah, "2. Kitten Heels - RM 300", 0dh,0ah, "3. Ankle Booties - RM 250", 0dh,0ah, "4. Ankle Strap Heels - RM 400", 0dh,0ah, "5. Wedges - RM 350", 0dh,0ah, "6. Cone Heels - RM 500", 0dh,0ah, "0. Exit", 0
girlShoesNumbers db 0
;=========== Girls shoes price ===========
Stilettos dword 280
KittenHeels  dword 300
AnkleBooties dword 250
AnkleStrapHeels dword 400
Wedges dword 350
ConeHeels dword 500

Stilettosquantity dword 0
KittenHeelsquantity dword 0
AnkleBootiesquantity dword 0
AnkleStrapHeelsquantity dword 0
Wedgesquantity dword 0
ConeHeelsquantity dword 0
;=========== Girls shoes price ===========
msg37 db 0dh,0ah, "Total Quantity of Stilettos: ", 0
msg38 db 0dh,0ah, "Total Quantity of Kitten Heels: ", 0
msg39 db 0dh,0ah, "Total Quantity of Ankle Booties: ", 0
msg40 db 0dh,0ah, "Total Quantity of Ankle StrapHeels: ", 0
msg41 db 0dh,0ah, "Total Quantity of Wedges: ", 0
msg42 db 0dh,0ah, "Total Quantity of ConeHeels: ", 0
;==========================Product Page=============================

;==========================Summary page=============================
msg19 db 0dh,0ah, "########## This is Summary Page ##########", 0
msg20 db 0dh,0ah, "Dear ", 0
msg21 db ",", 0
msg22 db 0dh,0ah, "Your phone number: ", 0
msg23 db 0dh,0ah, "Your location: ", 0
msg24 db 0dh,0ah, "This is your order products summary:", 0dh,0ah, "************************************", 0
msg25 db 0dh,0ah, "Total Quantity of Oxford: ", 0
msg26 db 0dh,0ah, "Total Quantity of Derby: ", 0
msg27 db 0dh,0ah, "Total Quantity of Blucher: ", 0
msg28 db 0dh,0ah, "Total Quantity of ChelseaBoot: ", 0
msg29 db 0dh,0ah, "Total Quantity of Loafer: ", 0
msg30 db 0dh,0ah, "Total Quantity of Brogues: ", 0
msg31 db 0dh,0ah, "Sub Total: ", 0
msg32 db "RM ", 0
msg33 db 0dh,0ah, "Discount (10%): ", 0
discount dword 10
divide dword 0
divide2 dword 100
totalDiscountPrice dword 0
msg34 db 0dh,0ah, "Total Payment: ", 0
subTotal dword ?
grandTotal dword 0
msg43 db 0dh,0ah, "Do you want to continue (Y/N)?: ", 0
msg44 db 0dh,0ah, "You are log out already and thank you welcome again", 0
answerYN3 db 0
;====================================================================

.code
main proc
again:
    mov Oxfordquantity, 0
    mov Derbyquantity, 0
    mov Blucherquantity, 0
    mov ChelseaBootquantity, 0
    mov Loaferquantity, 0 
    mov Broguesquantity, 0
    mov Stilettosquantity, 0
    mov KittenHeelsquantity, 0
    mov AnkleBootiesquantity, 0
    mov AnkleStrapHeelsquantity, 0
    mov Wedgesquantity, 0
    mov ConeHeelsquantity, 0
    mov grandTotal, 0
    mov totalDiscountPrice, 0
    mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	;-------------- LOGO Display --------------------
    call Crlf
	lea edx, logoMsg
	call WriteString
	lea edx, logoMsg1
	call WriteString
	lea edx, logoMsg2
	call WriteString
	lea edx, logoMsg3
	call WriteString
	lea edx, logoMsg4
	call WriteString
	lea edx, logoMsg5
	call WriteString
	lea edx, logoMsg6
	call WriteString
	call Crlf
	call Crlf
	mov eax, 1000			;delay 1 second
	call Delay

	;-------------- LOGIN section ----------------
	lea edx, welcomeMsg
	call WriteString
	lea edx, welcomeMsg1
	call WriteString

reEnter :
	;-------- Display LOGIN Msg ------------
	lea edx, loginMsg
	call WriteString

	;-------- Receive UserID ------------
	mov ecx, lengthOf UNAME
	lea edx, UNAME
	call ReadString

	;-------- Display PASSWORD Msg ------------
	lea edx, passwordMsg
	call WriteString

	;-------- Receive PASSWORD ------------
	mov ecx, lengthOf UPASS
	lea edx, UPASS
	call ReadString

	;-------- Verify userID ------------
	mov ecx, 3
	mov esi, 0

vUserN:
	mov al, uname[esi]
	cmp al, userID[esi]
	jne error1
	inc esi
	loop vUserN

	;-------- Verify PASSWORD ------------
	mov ecx, 3
	mov edi, 0

vUserP:
	mov al, upass[edi]
	cmp al, password[edi]
	jne error2
	inc edi
	loop vUserP

	;-------- If Correct ------------
	jmp validUser

	;--------LOGIN ERROR Msg Output------------
error1:
	lea edx, errorMsg1
	call WriteString
	jmp retry

error2 :
	lea edx, errorMsg2
	call WriteString
	jmp retry

retry :
	;------------ 3 CHANCE to Login------------
	mov al, chance
	dec al
	mov chance, al
	cmp chance, 0
	je terminate

	jmp reEnter

validUser :
	mov eax, 1000			;delay 1 second
	call Delay
	lea edx, successMsg
	call WriteString
	call Crlf
	call Crlf
	mov eax, 2000			;delay 2 seconds
	call Delay

;-------------------- end LOGIN section ----------------------

;-------------------- MENU section ----------------------

    ;## display welcome message ##
    lea edx, msg1
    call writeString
    lea edx, msg2
    call writeString

    ;################################## enter customer information ##################################
    lea edx, msg3       ;customer name
    call writeString
    mov ecx, lengthOf customerName
    lea edx, customerName
    call ReadString

    lea edx, msg4       ;customer Contact Number
    call writeString
    mov ecx, lengthOf customerContactNumber
    lea edx, customerContactNumber
    call ReadString

    lea edx, msg5       ;customer Location
    call writeString
    mov ecx, lengthOf customerLocation
    lea edx, customerLocation
    call ReadString

L1:
    lea edx, msg6           ;loyal customer
    call writeString
    call readChar
    call WriteChar
    mov answerYN, al
    mov al, answerYN        ;check input validation
    mov loyalCustomer, al
    mov NoLoyalCustomer, al
    cmp al, 79h             ;79h = "y"
    je product_type
    cmp al, 59h             ;59h = "Y"
    je product_type
    cmp al, 6eh             ;6eh = "n"
    je product_type
    cmp al, 4eh             ;4eh = "N"
    je product_type
    jmp must_YN

must_YN:
    lea edx, msg7           ;Invalid Input. Must enter Y/N
    call WriteString
    jmp L1
    ;################################## enter customer information ##################################

    ;################################## Product Page ##################################
product_type:
	mov eax, 1000			;delay 1 second
	call Delay
    call Crlf
    lea edx, msg8
    call WriteString
    lea edx, msg9
    call WriteString
    lea edx, msg10
    call WriteString
    call readChar
    call WriteChar
    mov answerAB, al
    mov al, answerAB        ;check input validation
    cmp al, 41h             ;41h = "A"
    je menShoes
    cmp al, 61h             ;59h = "a"
    je menShoes
    cmp al, 42h             ;42h = "B"
    je girlShoes
    cmp al, 62h             ;62h = "b"
    je girlShoes
    jmp must_AB

must_AB:
    lea edx, msg11
    call WriteString
    jmp product_type

menShoes:
	mov eax, 1000			;delay 1 second
	call Delay
    call Crlf
    lea edx, msg12
    call WriteString
    lea edx, msg13
    call WriteString
    call Crlf
    lea edx, msg14
    call WriteString
    call readChar
    call WriteChar
    mov menShoesNumbers, al
    mov al, menShoesNumbers        ;check input validation
    cmp al, 31h             ;31h = "1"
    je addedOxford 
    cmp al, 32h             ;32h = "2"
    je addedDerby 
    cmp al, 33h             ;33h = "3"
    je addedBlucher 
    cmp al, 34h             ;34h = "4"
    je addedChelseaBoot
    cmp al, 35h             ;35h = "5"
    je addedLoafer 
    cmp al, 36h             ;36h = "6"
    je addedBrogues 
    cmp al, 30h             ;30h = "0"
    je product_type
    jmp invalid_menShoesNumbers

addedOxford:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Oxfordquantity, eax
    jmp ask_want_to_addProduct

addedDerby:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Derbyquantity, eax
    jmp ask_want_to_addProduct

addedBlucher:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Blucherquantity, eax
    jmp ask_want_to_addProduct

addedChelseaBoot:
    lea edx, msg16
    call WriteString
    call ReadInt
    add ChelseaBootquantity, eax
    jmp ask_want_to_addProduct

addedLoafer:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Loaferquantity, eax
    jmp ask_want_to_addProduct

addedBrogues:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Broguesquantity, eax
    jmp ask_want_to_addProduct

ask_want_to_addProduct:
	mov eax, 1000			;delay 1 second
	call Delay
    ;### Ask want to add product again ###
    lea edx, msg17
    call WriteString
    call ReadChar
    call WriteChar
    mov answerYN2, al
    mov al, answerYN2        ;valid the input
    cmp al, 79h             ;79h = "y"
    je menShoes
    cmp al, 59h             ;59h = "Y"
    je menShoes
    cmp al, 6eh             ;6eh = "n"
    je Summary
    cmp al, 4eh             ;4eh = "N"
    je Summary
    jmp must_YN_2
    
invalid_menShoesNumbers:
    lea edx, msg15
    call WriteString
    jmp menShoes

must_YN_2:
    lea edx, msg18
    call WriteString
    jmp ask_want_to_addProduct

girlShoes:
	mov eax, 1000			;delay 1 second
	call Delay
    call Crlf
    lea edx, msg35
    call WriteString
    lea edx, msg36
    call WriteString
    call Crlf
    lea edx, msg14
    call WriteString
    call readChar
    call WriteChar
    mov girlShoesNumbers, al
    mov al, girlShoesNumbers        ;check input validation
    cmp al, 31h             ;31h = "1"
    je addedStilettos 
    cmp al, 32h             ;32h = "2"
    je addedKittenHeels 
    cmp al, 33h             ;33h = "3"
    je addedAnkleBooties
    cmp al, 34h             ;34h = "4"
    je addedAnkleStrapHeels
    cmp al, 35h             ;35h = "5"
    je addedWedges 
    cmp al, 36h             ;36h = "6"
    je addedConeHeels
    cmp al, 30h             ;30h = "0"
    je product_type
    jmp invalid_girlShoesNumbers

addedStilettos:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Stilettosquantity, eax
    jmp ask_want_to_addProduct_2

addedKittenHeels:
    lea edx, msg16
    call WriteString
    call ReadInt
    add KittenHeelsquantity, eax
    jmp ask_want_to_addProduct_2

addedAnkleBooties:
    lea edx, msg16
    call WriteString
    call ReadInt
    add AnkleBootiesquantity, eax
    jmp ask_want_to_addProduct_2

addedAnkleStrapHeels:
    lea edx, msg16
    call WriteString
    call ReadInt
    add AnkleStrapHeelsquantity, eax
    jmp ask_want_to_addProduct_2

addedWedges:
    lea edx, msg16
    call WriteString
    call ReadInt
    add Wedgesquantity, eax
    jmp ask_want_to_addProduct_2

addedConeHeels:
    lea edx, msg16
    call WriteString
    call ReadInt
    add ConeHeelsquantity, eax
    jmp ask_want_to_addProduct_2

ask_want_to_addProduct_2:
    ;### Ask want to add product again ###
    lea edx, msg17
    call WriteString
    call ReadChar
    call WriteChar
    mov answerYN2, al
    mov al, answerYN2        ;valid the input
    cmp al, 79h             ;79h = "y"
    je girlShoes
    cmp al, 59h             ;59h = "Y"
    je girlShoes
    cmp al, 6eh             ;6eh = "n"
    je girlSummary
    cmp al, 4eh             ;4eh = "N"
    je girlSummary
    jmp must_YN_3
    
invalid_girlShoesNumbers:
    lea edx, msg15
    call WriteString
    jmp girlShoes

must_YN_3:
    lea edx, msg18
    call WriteString
    jmp ask_want_to_addProduct_2
    ;################################## Product Page ##################################

    ;################################## Summary Page ##################################
Summary:
    ;##### Summary message #####
	call Crlf
	mov eax, 3000			;delay 3 second
	call Delay
    lea edx, msg19
    call writeString
    call Crlf

    ;##### Display customer name #####
    lea edx, msg20
    call writeString
    lea edx, customerName
    call writeString
    lea edx, msg21
    call writeString
    call Crlf

    ;## Display phone number ##
    lea edx, msg22
    call writeString
    lea edx, customerContactNumber
    call writeString

    ;## Display location ##
    lea edx, msg23
    call writeString
    lea edx, customerLocation
    call writeString
    call Crlf

    lea edx, msg24
    call writeString
    
    ;## Display Total Quantity ##
    lea edx, msg25      ;Oxford quantity
    call writeString
    mov eax, Oxfordquantity 
    call WriteDec
    lea edx, msg26      ;Derby quantity
    call writeString
    mov eax, Derbyquantity 
    call WriteDec
    lea edx, msg27      ;Blucher quantity
    call writeString
    mov eax, Blucherquantity 
    call WriteDec
    lea edx, msg28      ;ChelseaBoot quantity
    call writeString
    mov eax, ChelseaBootquantity 
    call WriteDec
    lea edx, msg29      ;Loafer quantity
    call writeString
    mov eax, Loaferquantity 
    call WriteDec
    lea edx, msg30      ;Brogues quantity
    call writeString
    mov eax, Broguesquantity 
    call WriteDec
    call Crlf

    ;## Display Sub Total ##
    lea edx, msg31
    call writeString
    lea edx, msg32
    call writeString
    mov eax, Oxfordquantity
    mov ebx, Oxford
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, Derbyquantity
    mov ebx, Derby  
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, Blucherquantity
    mov ebx, Blucher 
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, ChelseaBootquantity
    mov ebx, ChelseaBoot    
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, Loaferquantity
    mov ebx, Loafer 
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, Broguesquantity
    mov ebx, Brogues 
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    
    mov eax, grandTotal
    call WriteDec

    ;## Show total discount price ##
    mov al, loyalCustomer
    cmp al, 79h                      ; valid is loyal customer or not
    je calculateDiscount
    cmp al, 59h                      ; valid is loyal customer or not
    je calculateDiscount
    mov al, NoLoyalCustomer
    cmp al, 6eh                      ; valid is loyal customer or not
    je NoCalculateDiscount
    cmp al, 4eh                      ; valid is loyal customer or not
    je NoCalculateDiscount

calculateDiscount:
    call crlf
    lea edx, msg33
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, grandTotal
    mov ebx, discount
    mul ebx
    mov divide, eax
    mov eax, divide
    mov ebx, divide2
    div ebx
    mov totalDiscountPrice, eax
    call WriteDec
    call Crlf
    lea edx, msg34
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, grandTotal
    sub eax, totalDiscountPrice
    call WriteDec
    jmp WantToContinue

NoCalculateDiscount:
    call Crlf
    lea edx, msg33
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, 0
    mov discount, eax
    call WriteDec
    call Crlf
    lea edx, msg34
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, grandTotal
    call WriteDec
    jmp WantToContinue

    ;## Ask want to continue or not ##
WantToContinue:
    lea edx, msg43
    call WriteString
    call ReadChar
    call WriteChar
    mov answerYN3, al
    mov al, answerYN3        ;valid the input
    cmp al, 79h             ;79h = "y"
    je again
    cmp al, 59h             ;59h = "Y"
    je again
    cmp al, 6eh             ;6eh = "n"
    je thankYouMessage
    cmp al, 4eh             ;4eh = "N"
    je thankYouMessage
    jmp must_YN_4

thankYouMessage:
    lea edx, msg44
    call WriteString
    call Crlf
    jmp terminate

must_YN_4:
    lea edx, msg18
    call WriteString
    jmp WantToContinue
;==================================== girls summary ========================================
girlSummary:
    ;##### Summary message #####
    call Crlf
    lea edx, msg19
    call writeString
    call Crlf

    ;##### Display customer name #####
    lea edx, msg20
    call writeString
    lea edx, customerName
    call writeString
    lea edx, msg21
    call writeString
    call Crlf

    ;## Display phone number ##
    lea edx, msg22
    call writeString
    lea edx, customerContactNumber
    call writeString

    ;## Display location ##
    lea edx, msg23
    call writeString
    lea edx, customerLocation
    call writeString
    call Crlf

    lea edx, msg24
    call writeString
    
    ;## Display Total Quantity ##
    lea edx, msg37      ;Stilettos quantity
    call writeString
    mov eax, Stilettosquantity 
    call WriteDec
    lea edx, msg38      ;Kitten Heels quantity
    call writeString
    mov eax, KittenHeelsquantity 
    call WriteDec
    lea edx, msg39      ;Ankle Booties quantity
    call writeString
    mov eax, AnkleBootiesquantity 
    call WriteDec
    lea edx, msg40      ;Ankle Strap Heels quantity
    call writeString
    mov eax, AnkleStrapHeelsquantity 
    call WriteDec
    lea edx, msg41      ;Wedges quantity
    call writeString
    mov eax, Wedgesquantity 
    call WriteDec
    lea edx, msg42      ;Cone Heels quantity
    call writeString
    mov eax, ConeHeelsquantity 
    call WriteDec
    call Crlf

    ;## Display Sub Total ##
    lea edx, msg31
    call writeString
    lea edx, msg32
    call writeString
    mov eax, Stilettosquantity
    mov ebx, Stilettos
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, KittenHeelsquantity
    mov ebx, KittenHeels  
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, AnkleBootiesquantity
    mov ebx, AnkleBooties 
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, AnkleStrapHeelsquantity
    mov ebx, AnkleStrapHeels    
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, Wedgesquantity
    mov ebx, Wedges 
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    ;call Crlf

    mov eax, ConeHeelsquantity
    mov ebx, ConeHeels 
    mul ebx
    mov subTotal, eax
    mov eax, subTotal
    add grandTotal, eax
    ;call WriteDec
    
    mov eax, grandTotal
    call WriteDec

    ;## Show total discount price ##
    mov al, loyalCustomer
    cmp al, 79h                      ; valid is loyal customer or not
    je calculateDiscount2
    cmp al, 59h                      ; valid is loyal customer or not
    je calculateDiscount2
    mov al, NoLoyalCustomer
    cmp al, 6eh                      ; valid is loyal customer or not
    je NoCalculateDiscount2
    cmp al, 4eh                      ; valid is loyal customer or not
    je NoCalculateDiscount2

calculateDiscount2:
    call crlf
    lea edx, msg33
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, grandTotal
    mov ebx, discount
    mul ebx
    mov divide, eax
    mov eax, divide
    mov ebx, divide2
    div ebx
    mov totalDiscountPrice, eax
    call WriteDec
    call Crlf
    lea edx, msg34
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, grandTotal
    sub eax, totalDiscountPrice
    call WriteDec
    jmp WantToContinue2

NoCalculateDiscount2:
    call Crlf
    lea edx, msg33
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, 0
    mov discount, eax
    call WriteDec
    call Crlf
    lea edx, msg34
    call WriteString
    lea edx, msg32
    call WriteString
    mov eax, grandTotal
    call WriteDec
    jmp WantToContinue2

    ;## Ask want to continue or not ##
WantToContinue2:
    lea edx, msg43
    call WriteString
    call ReadChar
    call WriteChar
    mov answerYN3, al
    mov al, answerYN3        ;valid the input
    cmp al, 79h             ;79h = "y"
    je again
    cmp al, 59h             ;59h = "Y"
    je again
    cmp al, 6eh             ;6eh = "n"
    je thankYouMessage2
    cmp al, 4eh             ;4eh = "N"
    je thankYouMessage2
    jmp must_YN_5

thankYouMessage2:
    lea edx, msg44
    call WriteString
    call Crlf
    jmp terminate

must_YN_5:
    lea edx, msg18
    call WriteString
    jmp WantToContinue2
    ;################################## Summary Page ##################################

terminate:
	exit

main endp
end main
