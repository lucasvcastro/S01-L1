;; perigo e sempre uma keyword: :inofensiva, :agressiva ou :leviata
(defstruct criatura nome bioma profundidade perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~A | Bioma: ~A | Profundidade: ~D m | Perigo: ~A"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

;; devolve so as criaturas mais fundas que metros (lista nova)
(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list (make-criatura :nome "Peeper"
                       :bioma "Zona Rasa"
                       :profundidade 20
                       :perigo :inofensiva)
        (make-criatura :nome "Stalker"
                       :bioma "Floresta de Algas"
                       :profundidade 50
                       :perigo :agressiva)
        (make-criatura :nome "Reaper Leviathan"
                       :bioma "Zona de Queda"
                       :profundidade 300
                       :perigo :leviata)
        (make-criatura :nome "Ghost Leviathan"
                       :bioma "Abismo Perdido"
                       :profundidade 600
                       :perigo :leviata)))

(defun main ()
  (let ((textos (mapcar #'descreve-criatura *catalogo*)))
    (format t "--- Catalogo completo ---~%")
    (dolist (texto textos)
      (format t "~A~%" texto)))

  (let ((fundas (abaixo-de 100 *catalogo*)))
    (format t "--- Criaturas abaixo de 100 m ---~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~A~%" texto))
    (format t "Quantas: ~D~%" (length fundas))))

(main)