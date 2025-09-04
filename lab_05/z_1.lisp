; defun kek:
; '(1 0 1 1) -> 11
; '(1 1) -> 3
; '(1 0 1) -> 5
; у - копит значение (инициализируется изначально нулём), а х - новопришедший элемент списка (бит)

(defun kek (lst)
  (reduce #'(lambda (y x)
              (format t "x: ~A, y: ~A -> (+ (* ~A 2) ~A) = ~A~%"
                      x y y x (+ (* y 2) x))
              (+ (* y 2) x))
          lst
          :initial-value 0))
          
(print (kek '(1 0 1 1)))
(print (kek '(1 1)))
(print (kek '(1 0 1)))
(print (kek '()))
(print (kek '(1 1 1 1)))