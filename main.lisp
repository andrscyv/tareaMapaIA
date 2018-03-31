#! /usr/local/bin/clisp
;(print *args*)
(setq idiniG (parse-integer (car *args*)))
;(print idiniG)
(setq idfinG (parse-integer (cadr *args*)))
;(print (= idiniG 0.2))
(setq abto '())
(setq crrdo '())
;(SETQ GRAFO '((12 5 7 1 2 3 4) (2 2 3 A) (4 7 15 C D E) (7 1 8 21 32 43) (8 4 6)))

;(SETQ GRAFO '((1 1 6 3) (2 1 3 3) (3 2 5 1 2 5) (4 5 6 5) (5 4 4 3 4 6 7) 
;	(6 3 2 5 7) (7 5 3 5 6 8 10) (8 5 1 7 9 10) (9 6 1 8 10) (10 6 2 7 8 9)))
;(setq grafo '( (1 1 1 2 3 21) (2 1 3 1 3 4) (3 5 2 1 2 4 ) (4 4 4 2 3 21 5 6)
;	(5 2 6 4 6 7) (6 5 6 4 5 7 12) (7 3 8 5 6 8 9) (8 2 9 7) (9 5 10 7 10) (10 6 9 9 11) (11 7 10 10 12)
;	(12 7 7 6 11 13) (13 8 6 12 14 15) (14 8 4 13 19) (15 10 7 13 16 18 19) (16 10 9 15 17) (17 13 10 16 18)
;	(18 13 6 17 15) (19 11 4 14 15 20) (20 13 1 19) (21 8 2 1 4)))
; (setq grafo
; '(
; (1 416 256 2 44 45)
; (2 448 240 1 3)
; (3 512 272 2 4)
; (4 496 304 3 5 39 43)
; (5 544 320 4 6 7)
; (6 608 256 5 7 8)
; (7 608 320 5 6 8 37)
; (8 656 288 6 7 37 36)
; (9 720 272 36 10 11)

; (10 752 304 9 11 12  34)
; (11 768 272 9 10 13)
; (12 816 320 10 13 33 14)
; (13 848 288 11 12 15)
; (14 848 352 12 15 31 32)
; (15 880 320 13 14 31 16)
; (16 944 352 15 31 17)
; (17 960 384 16 30 28 18)
; (18 992 400 17 28 19)
; (19 1040 400 18 27 25 20)

; (20 1072 368 19 24 21)
; (21 1104 320 20 23 22)
; (22 1168 288 21 23)
; (23 1152 352 21 22 24)
; (24 1120 400 20 23 25)
; (25 1088 416 26 19 24)
; (26 1056 464 27 25 65 64)
; (27 1040 448 19 26 28)
; (28 976 432 18 27 63 29 17)
; (29 944 448 28 62 61 30)

; (30 912 416 17 29 59 31)
; (31 896 384 15 16 30 32 14)
; (32 864 400 14 31 59 33)
; (33 800 384 12 32 57 34)
; (34 752 352 10 33 56 35)
; (35 704 368 36 34)
; (36 672 336 8 9 35 37)
; (37 640 368 8 36 55 38 7)
; (38 592 400 37 54 53 39)
; (39 544 368 4 38 40)

; (40 512 400 39 52 41 43)
; (41 480 400 40 42 50)
; (42 448 384 47 43 41)
; (43 464 352 4 40 42 44)
; (44 416 320 1 46 43 47)
; (45 384 288 1 46)
; (46 352 336 45 44)
; (47 384 368 44 48 49 50 42)
; (48 352 400 49 47)
; (49 384 448 48 47 50 78)

; (50 432 432 47 41 51 78 49)
; (51 496 480 50 52 79)
; (52 544 464 40 53 76 77 51)
; (53 576 448 52 38 75)
; (54 640 432 38 55 72)
; (55 672 416 54 37 56)
; (56 736 400 55 34 57)
; (57 784 432 56 33 58 71)
; (58 832 464 57 59 60)
; (59 880 448 58 32 30)

; (60 864 512 58 61 69 71)
; (61 912 528 60 29 67 68)
; (62 976 496 29 63 67)
; (63 1008 528 62 28 64 66)
; (64 1056 512 26 65 66 63)
; (65 1104 496 64 26)
; (66 1056 560 64 63 88)
; (67 944 560 61 62 88 68)
; (68 896 592 61 67 87 86 69)
; (69 816 576 60 68 86 84 70)

; (70 768 544 71 69 73)
; (71 768 496 57 60 70 72)
; (72 704 480 54 71 73 75)
; (73 688 560 72 70 84 74 81)
; (74 640 528 75 73 81)
; (75 624 496 74 72 53)
; (76 576 544 52 81 77)
; (77 528 528 52 76 80)
; (78 400 512 49 50 79)
; (79 464 560 78 51 80)

; (80 544 608 79 77 81 82)
; (81 608 592 80 76 74 73 82)
; (82 640 656 80 81 83)
; (83 720 688 82 84 85)
; (84 736 608 83 85 69 73)
; (85 784 640 83 84 86)
; (86 832 624 85 69 68)
; (87 960 640 68 88 89)
; (88 1008 608 67 66 89 87)
; (89 1040 672 88 87)) )

(setq grafo
'(
(1 330 130 2 89 17) 
(2 387 145 1 3 86) 
(3 420 165 2 4 86) 
(4 467 185 3 5 15 16) 
(5 500 156 4 6) 
(6 540 198 5 7 14) 
(7 578 226 6 8 12 13) 
(8 605 204 7 81) 
(9 642 253 12 81 82) 

(10 690 287 24 82) 
(11 647 303 23 24 82) 
(12 606 265 7 9 83) 
(13 555 249 7 21 84) 
(14 511 220 6 15 84) 
(15 480 238 4 14 16 19 85) 
(16 444 215 4 15 85 86) 
(17 351 185 1 88 89) 
(18 391 254 30 87 88) 
(19 461 281 15 29 85) 

(20 506 279 29 84) 
(21 567 278 13 80 83) 
(22 598 308 23 83) 
(23 626 328 11 22 27 78) 
(24 672 325 10 11 78 79) 
(25 685 377 26 37 79) 
(26 645 365 25 35 78) 
(27 600 346 23 34 76) 
(28 547 330 32 80) 
(29 500 315 19 20 32 80) 

(30 400 300 31 18) 
(31 440 335 30) 
(32 526 348 28 29 33) 
(33 544 368 32 54 55) 
(34 583 379 27 54 76) 
(35 619 392 26 36 53 76) 
(36 642 406 35 51 75) 
(37 678 406 25 50 51) 
(38 713 418 49 50) 
(39 745 452 40 48 61) 

(40 782 454 39 47 48) 
(41 839 435 46 69 73) 
(42 857 384 70 71) 
(43 915 372 71 72) 
(44 907 417 45 72) 
(45 884 440 44 69 70) 
(46 835 458 41 47 69) 
(47 806 467 40 46 65 67 68 73) 
(48 761 474 39 40 64 65) 
(49 706 448 38 50 60 61) 

(50 688 427 37 38 49 51) 
(51 664 428 36 37 50 52) 
(52 640 444 51 58 59 75) 
(53 602 415 35 75 77) 
(54 566 395 33 34 55 77) 
(55 534 410 33 54 56) 
(56 563 436 55 57 77) 
(57 594 452 56 58) 
(58 621 464 52 57 74 75) 
(59 664 461 52 60 62 74) 

(60 691 468 49 59 61 62 63) 
(61 727 464 39 49 60 64) 
(62 676 485 59 60 63 74) 
(63 703 496 60 62 64) 
(64 741 495 48 61 63) 
(65 789 496 47 48 66) 
(66 814 520 65 67) 
(67 820 494 47 66 68) 
(68 844 486 47 67) 
(69 860 446 41 45 46 70) 

(70 862 412 42 45 69 72) 
(71 887 371 42 43 72) 
(72 885 403 43 44 70 71) 
(73 810 443 41 47) 
(74 644 477 58 59 62) 
(75 627 429 36 52 53 58) 
(76 611 366 27 34 35) 
(77 577 424 53 54 56) 
(78 650 343 23 24 26) 
(79 686 354 24 25) 

(80 534 299 21 28 29) 
(81 629 225 8 9) 
(82 666 279 9 10 11) 
(83 587 297 12 21 22) 
(84 522 250 13 14 20) 
(85 446 249 15 16 19) 
(86 406 201 2 3 16) 
(87 359 238 18 88) 
(88 381 221 18 87 17) 
(89 350 157 17 1)) )

;;BUSCA UN NODO EN UNA LISTA CON BASE EN SU IDNODO
;;REGRESA nil CUANDO NO ENCUENTRA AL NODO
(DEFUN ENCUENTRANODO (IDNODO LISTA)
    (COND
        ((NULL LISTA) '())
        ((= IDNODO (CAR (CAR LISTA))) (CAR LISTA))
        (T (ENCUENTRANODO IDNODO (CDR LISTA)))
    )
)

;;REGRESA UNA LISTA CON LOS IDNODOS DE LOS HIJOS DEL IDNODO BUSCADO
;;USA LA FUNCIÓN ENCUENTRANODO PARA LOGRARLO
;;SOLO BUSCA EN LA LISTA LLAMADA GRAFO
;;NO LANZA EXCEPCIONES

(DEFUN DAMEHIJOS (IDNODO)
    (NTHCDR 3 (ENCUENTRANODO IDNODO GRAFO))
)

(DEFUN COSTO (IDNODO1 IDNODO2)
    (LET ((Z (MAPCAR #'- (SUBSEQ (ENCUENTRANODO IDNODO1 GRAFO) 1 3) (SUBSEQ (ENCUENTRANODO IDNODO2 GRAFO) 1 3)))) (SQRT (APPLY #'+ (MAPCAR #'* Z Z))))
)

;;
;;====================================
;;PRUEBAS
;;====================================
;;

;;DEBE ENCONTRAR EL NODO CON IDNODO IGUAL A 12
;;BUSCANDO EN LA LISTA GRAFO
;;(PRINT (ENCUENTRANODO 12 GRAFO))

;;REGRESA UNA LISTA CON LOS HIJOS DEL NODO CON IDNODO IGUAL A 8
;(PRINT (DAMEHIJOS 8))

;;REGRESA UNA LISTA CON LOS HIJOS DEL NODO CON IDNODO IGUAL A 4
;(PRINT (DAMEHIJOS 4))

;;ENCUENTRA EL COSTO DE IR DEL NODO CON IDNODO 12 A 2
;;USANDO LA DISTANCIA EUCLIDIANA ENTRE LOS DOS NODOS
;(print 'costo)
;(PRINT (COSTO 2 12))

;;ENCUENTRA EL COSTO DE IR DEL NODO CON IDNODO 2 A 4
;;USANDO LA DISTANCIA EUCLIDIANA ENTRE LOS DOS NODOS


;;=============================================
;;================ANDRES=======================
;;=============================================



(setq p '(( nil nil 1) (nil nil 3) (nil nil 3) (nil nil 7) (nil nil 9)) )
(setq p2 '( (1) (4)  (6)  (12)  (2)))
(setq p3 '( (1) (4) (5) (6) (7) (12)  (2)))


;;Si n > lenght lst => regresa toda la lista
(defun primerosn (n lst)
	(if (<= n (length lst)) (reverse (nthcdr (- (length lst) n) (reverse lst))) lst))
;;Pruebas
;(print (primerosn 0 p))
;;(print (primerosn 6 p))

;;Regresa posición en donde insertar nodo por prioridad
(defun indicePrioridadAbto (nodo lst)
	(cond 
		((null lst))
		((<= (caddr nodo) (caddar lst)))
		(T (incf iPrioridadAbto) (indicePrioridadAbto nodo (cdr lst)))))
;pruebas
;(setq iPrioridadAbto 0)
;(print p)
;(indicePrioridadAbto '(nil nil 8) p)
;(print iPrioridadAbto )

;Inserta en lista abto con respecto a la prioridad (minimiza)
(defun insertaPrioridadAbto (nodo)
	(setq iPrioridadAbto 0) (indicePrioridadAbto nodo abto)
	(setq abto (append (primerosn iPrioridadAbto abto) (list nodo) (nthcdr iPrioridadAbto abto))))
;pruebas
;(setq abto p)
;(insertaPrioridadAbto '( nil nil 5))
;(print abto)

(defun existeEnCerrado (idnodo)
	(not (null (ENCUENTRANODO idnodo crrdo) )))
;pruebas
;(setq crrdo p2)
;(print p2)
;(print (existeEnCerrado 23))

(defun sigAbiertoNoCerrado ()
	(setq auxSigAbierto '())
	(loop
		(setq auxSigAbierto (pop abto))
		(when (null auxSigAbierto) (return auxSigAbierto))
		(when (not (existeEnCerrado (car auxSigAbierto))) (return auxSigAbierto))))
;pruebas
;(setq abto p3)
;(setq crrdo p2)
;(print abto)
;(print crrdo)
;(print (sigAbiertoNoCerrado))
;(print (sigAbiertoNoCerrado))
(defun procesaHijo (idini idfin idhijo acum)
	(setq prioHijo (+ acum (costo idini idhijo) (costo idhijo idfin) ))
	(insertaPrioridadAbto (list idhijo idini prioHijo (+ acum (costo idini idhijo)))))

(defun aEstrella (nodoini idfin acum)
	(loop for x in (DAMEHIJOS (car nodoini))
      do (procesaHijo (car nodoini) idfin x acum) )
	(push nodoini crrdo)
	(setq sigEstrella (sigAbiertoNoCerrado))
	(if (not (= (car sigEstrella) idfin)) (aEstrella sigEstrella idfin (cadddr sigEstrella)) (construyeSol sigEstrella) ))

(setq sol '())
(defun construyeSol (nodofin)
	(cond
		((null (cadr nodofin)) (push nodofin sol))
		(T (push nodofin sol) (setq nodofin (ENCUENTRANODO (cadr nodofin) crrdo)) (construyeSol nodofin) )))

(defun listaId (sol)
	(apply #'list (mapcar #'car sol)))

;(print 'resultado)
(setq nodoIniG `(,idiniG nil 0 0))
;(print nodoIniG)
(aEstrella nodoIniG idfinG 0)
(print (listaId sol))
;(print 'abto)
;(print abto)
;(print 'crrdo)
;(print crrdo)



