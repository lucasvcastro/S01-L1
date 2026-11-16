(defstruct garota-magica nome escuridao bruxas)

;; recursao: grupo vazio vale 0; senao soma a primeira com o resto
(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

;; mapcar extrai as bruxas de cada garota e reduce soma tudo
(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

;; retorna uma garota NOVA; a original nao muda
(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((grupo (list (make-garota-magica :nome "Sayaka Miki"
                                          :escuridao 70
                                          :bruxas 4)
                      (make-garota-magica :nome "Mami Tomoe"
                                          :escuridao 35
                                          :bruxas 20)
                      (make-garota-magica :nome "Kyoko Sakura"
                                          :escuridao 55
                                          :bruxas 15)))
         (nova (make-garota-magica :nome "Homura Akemi"
                                   :escuridao 30
                                   :bruxas 8))
         ;; cons cria um grupo novo com a garota na frente
         (grupo-novo (cons nova grupo))
         (sayaka (first grupo))
         (sayaka-purificada (purifica sayaka 40)))

    (format t "Escuridao total do grupo: ~D~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~D~%" (total-de-bruxas grupo))

    (format t "--- Uma nova garota faz o contrato ---~%")
    (format t "Escuridao total do grupo original: ~D~%" (escuridao-total grupo))
    (format t "Escuridao total do grupo novo: ~D~%" (escuridao-total grupo-novo))

    (format t "--- Purificando ~A ---~%" (garota-magica-nome sayaka))
    (format t "Escuridao da original: ~D~%" (garota-magica-escuridao sayaka))
    (format t "Escuridao da purificada: ~D~%"
            (garota-magica-escuridao sayaka-purificada))))

(main)