; РАБОТАЕТ ПРИ ПЕРЕДАЧЕ ДАННЫХ С КОНЦА
; defun kek:
; '(1 0 1 1) -> 13 = 1101
; '(1 1) -> 3
; '(1 0 1) -> 5
; х - копит значение (инициализируется изначально нулём), а у - новопришедший элемент списка (бит)

(defun kek (lst)
  (reduce #'(lambda (y x)
              (+ (* x 2) y)) lst
          :initial-value 0
          :from-end t))
          
(print (kek '(1 0 1 1)))
(print (kek '(1 1)))
(print (kek '(1 0 1)))
(print (kek '()))
(print (kek '(1 1 1 1)))