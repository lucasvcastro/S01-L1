;; defstruct cria sozinho: make-erva, erva-nome, erva-preco-por-grama,
;; erva-toxicidade e erva-p
(defstruct erva nome preco-por-grama toxicidade)

;; cond testa de cima para baixo; t e o "senao"
(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

;; format nil devolve o texto (nao imprime)
(defun descreve-erva (erva)
  (format nil "~A - R$ ~,2F por grama - ~A"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar a erva em si mesma antes."
      "Erva liberada para o paciente."))

(defun main ()
  (let ((ervas (list (make-erva :nome "Cogumelo Sombrio"
                                :preco-por-grama 25.0
                                :toxicidade 9)
                     (make-erva :nome "Raiz de Gengibre"
                                :preco-por-grama 4.5
                                :toxicidade 5)
                     (make-erva :nome "Camomila"
                                :preco-por-grama 2.0
                                :toxicidade 1))))
    (dolist (e ervas)
      (format t "~A~%" (descreve-erva e))
      (format t "~A~%" (aviso e)))
    (format t "Dose de 10 g de ~A: R$ ~,2F~%"
            (erva-nome (second ervas))
            (preco-da-dose (second ervas) 10))))

(main)