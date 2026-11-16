;; defstruct tambem cria copy-dominio, usado no item 6
(defstruct dominio nome elemento dificuldade mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

;; let* avalia em sequencia: primeiro filtra, depois transforma em textos
(defun rota (lista dificuldade-maxima)
  (let* ((acessiveis (remove-if-not
                      (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                      lista))
         (textos (mapcar
                  (lambda (d)
                    (format nil "~A - recompensa: ~,1F mora"
                            (dominio-nome d)
                            (recompensa-final d)))
                  acessiveis)))
    textos))

(defun main ()
  (let ((dominios (list (make-dominio :nome "Santuario das Chamas"
                                      :elemento :pyro
                                      :dificuldade 3
                                      :mora 1000)
                        (make-dominio :nome "Gruta das Mares"
                                      :elemento :hydro
                                      :dificuldade 2
                                      :mora 800)
                        (make-dominio :nome "Templo do Trovao"
                                      :elemento :electro
                                      :dificuldade 4
                                      :mora 1500)
                        (make-dominio :nome "Vale Gelado"
                                      :elemento :cryo
                                      :dificuldade 1
                                      :mora 500)
                        (make-dominio :nome "Jardim dos Ventos"
                                      :elemento :anemo
                                      :dificuldade 5
                                      :mora 2000))))

    (format t "--- Rota ate dificuldade 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~A~%" texto))

    (format t "Total de mora da lista inteira: ~,1F~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    ;; Lisp permite alterar valores: setf muda a COPIA, o original continua igual
    (let* ((original (first dominios))
           (copia (copy-dominio original)))
      (setf (dominio-mora copia) 9999)
      (format t "--- Copia com setf ---~%")
      (format t "Mora da copia: ~D~%" (dominio-mora copia))
      (format t "Mora do original: ~D~%" (dominio-mora original)))))

(main)