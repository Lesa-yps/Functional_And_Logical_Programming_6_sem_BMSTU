; task 1 (хвостовая рекурсия первого уровня)
(defun my_reverse (lst res)
    (cond ((null lst) res)
          (t (my_reverse (cdr lst) (cons (car lst) res)))))

(my_reverse '(1 2 (s 4) ty 4s) Nil)
==> (4S TY (S 4) 2 1)


; task 2 (найти первый непустой список)
(defun first_no_empty_elem_lst (lst)
    (cond ((null lst) Nil)
          ((and (listp (car lst)) (not (null (car lst)))) (car lst))
          (t (first_no_empty_elem_lst (cdr lst)))))

(first_no_empty_elem_lst '(1 () 2 (s 4) ty 4s))
==> (S 4)


; task 3a (умножить числовой список на число)
(defun multy_num (lst num)
    (cond ((null lst) Nil)
          (t (cons (* (car lst) num) (multy_num (cdr lst) num)))))

(multy_num '(1 4 13 5) 2)
==> (2 8 26 10)


; task 3б-1 (умножить числа из смешанного списка на число (верхнеуровнево))
(defun multy_num (lst num)
    (cond ((null lst) Nil)
          (t (cons (if (numberp (car lst)) (* (car lst) num) (car lst)) (multy_num (cdr lst) num)))))

(multy_num '(1 () 2 (s 4) ty 4s) 2)
==> (2 NIL 4 (S 4) TY 4S)


; task 3б-2 (умножить числа из смешанного списка на число (подуровни тоже обрабатываются))
(defun multy_num (lst num)
    (cond ((null lst) Nil)
          ((atom lst) lst)
          (t (cons (if (numberp (car lst)) (* (car lst) num) (multy_num (car lst) num)) (multy_num (cdr lst) num)))))

(multy_num '(1 () 2 (s 4) ty 4s) 2)
==> (2 NIL 4 (S 8) TY 4S)


; task 4 (выбрать числа в список между двумя переданными (+2 балла за сортировку результата))
(defun insert_help (x lst)
    (cond ((null lst) (list x))
          ((<= x (car lst)) (cons x lst))
          (t (cons (car lst) (insert_help x (cdr lst))))))

(insert_help 4 '(1 2 3 4 5 6 7))
==> (1 2 3 4 4 5 6 7)


(defun select-between (lst num1 num2 res)
    (cond ((null lst) res)
          ((or (and (<= (car lst) num1) (>= (car lst) num2))
               (and (<= (car lst) num2) (>= (car lst) num1))) (select-between (cdr lst) num1 num2 (insert_help (car lst) res)))
          (t (select-between (cdr lst) num1 num2 res))))

(select-between '(7 8 3 5 6 2 94 6 34 -2) 3 10 Nil)
==> (3 5 6 6 7 8)


; task 5a (сумма чисел одноуровневого смешанного списка)
(defun rec-add (lst)
    (cond ((null lst) 0)
          (t (+ (if (numberp (car lst)) (car lst) 0) (rec-add (cdr lst))))))

(rec-add '(1 2 s 4 ty 4s))
==> 7

; хвостовая рекурсия
(defun rec-add (lst res)
    (cond ((null lst)           res)
          ((numberp (car lst))  (rec-add (cdr lst) (+ (car lst) res)))
          (t                    (rec-add (cdr lst) res))))

(rec-add '(1 2 s 4 ty 4s) 0)
==> 7


; task 5б (сумма чисел структурированного списка)
(defun rec-add (lst)
    (cond ((null lst) 0)
          (t (+ (cond ((numberp (car lst)) (car lst))
                      ((atom (car lst)) 0)
                      (t (rec-add (car lst)))) (rec-add (cdr lst))))))

(rec-add '(1 () 2 (s 4) ty 4s))
==> 7


; task 6 (аналог nth)
(defun recnth (n lst)
    (cond ((null lst) Nil)
          ((= n 0) (car lst))
          (t (recnth (- n 1) (cdr lst)))))

(recnth 3 '(1 (3 4 t) 4s 5 r 4))
==> 5


; task 7 (проверка, что все элементы списка нечётные)
(defun allodd (lst)
    (cond ((null lst) t)
          ((evenp (car lst)) Nil)
          (t (allodd (cdr lst)))))

(allodd '(1 2 3))
==> NIL

(allodd '(1 5 3))
==> T


; task 8 (возврат первого нечётного числа из структурированного списка)
(defun first_odd (lst)
    (cond ((null lst) Nil)
          ((atom (car lst)) (if (and (numberp (car lst))(oddp (car lst)))
                                    (car lst) (first_odd (cdr lst))))
          (t (or (first_odd (car lst)) (first_odd (cdr lst))))))

(first_odd '(2 4 (s 6 t5) (t 3) ((e r ) 6 5)))
==> 3


; task 9 (cons-дополняемая рекурсия с одним тестом завершения возвращает квадрат чисел из числового списка)
(defun squaring-list (lst)
    (cond ((null lst) Nil)
          (t (cons (* (car lst) (car lst)) (squaring-list (cdr lst))))))

(squaring-list '(2 5 3 4 -6))
==> (4 25 9 16 36)


; task 9 (может обработать смешанный структурированный список) (по заданию не надо, но пусть будет)
(defun squaring-list (lst)
    (cond ((null lst) Nil)
          ((and (atom (car lst)) (numberp (car lst))) (cons (* (car lst) (car lst)) (squaring-list (cdr lst))))
          ((atom (car lst)) (cons (car lst) (squaring-list (cdr lst))))
          (t (cons (squaring-list (car lst)) (squaring-list (cdr lst))))))

(squaring-list '(2 5 3 (4) -6))
==> (4 25 9 (16) 36)

(squaring-list '(2 5t 3 (sd 4) () -6))
==> (4 5T 9 (SD 16) NIL 36)


; task 10 (преобразовать структурированный список в одноуровневый)
(defun perform-list (lst)
    (cond ((null lst) Nil)
          ((atom (car lst)) (cons (car lst) (perform-list (cdr lst))))
          (t (append (perform-list (car lst)) (perform-list (cdr lst))))))

(perform-list '(2 5t 3 (sd (ert 4)) () -6))
==> (2 5T 3 SD ERT 4 NIL -6)