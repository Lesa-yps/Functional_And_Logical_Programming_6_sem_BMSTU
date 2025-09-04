(defun my_reverse (lst res)
    (cond ((null lst) res)
          (t (my_reverse (cdr lst) (cons (car lst) res)))))

(defun my_reverse (lst res)
    (cond ((null lst) res)
          (t `(,@(my_reverse (cdr lst) (cons (car lst) res))))))

(print (my_reverse `(,(+ 1 2 3) ,@(list 7 8) ,(list 7 8)) Nil))

; --> ((7 8) 8 7 6)