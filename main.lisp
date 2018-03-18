(SETQ GRAFO '((12 5 7 1 2 3 4) (2 2 3 A) (4 7 15 C D E) (7 1 8 21 32 43) (8 4 6)))

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


(setq abto '())
(setq p '(( nil nil 1) (nil nil 3) (nil nil 3) (nil nil 7) (nil nil 9)) )
(setq p2 '( (1) (4)  (6)  (12)  (2)))
(setq p3 '( (1) (4) (5) (6) (7) (12)  (2)))
(setq crrdo '())

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
	(insertaPrioridadAbto (list idhijo idini prioHijo (+acum (costo idini idhijo)))))

(defun aEstrella (nodoini idfin acum)
	(loop for x in (DAMEHIJOS (car ini))
      do (print x) ))

(aEstrella ())



