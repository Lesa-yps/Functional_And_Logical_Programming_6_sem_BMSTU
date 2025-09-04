; 6. Напишите функцию, select-between, которая из списка-аргџмента, со-
; держащего только числа, выбирает только те, которые расположены
; между двумя указанными числами - границами-аргументами и возвра-
; щает их в виде списка (упорядоченного по возрастанию (+ 2 балла))

;(defun select-between-1 (lst left right)
;     (sort (reduce #'(lambda res_lst elem)
;                     (cond ((and (> elem left) (< elem right)) (cons elem res_lst))
;                           (t res_lst)))                                               lst :initial-value ()) #'<)

;(defun select-between (lst left right)
;  (sort (remove-if-not #'(lambda (x) (and (>= x left) (< x right))) lst) #'<=))

; Пример вызова
;(print (select-between '(7 4 8 6 2 4 -3 1 4 0) 2 8))
; -> (2 4 4 4 6 7)


(defun sum-lens-lst (list-of-list)
  (reduce #'+ (mapcar #'length list-of-list)))

(print (sum-lens-lst '((1 2) (3 4 5) ())))
;(print (sum-lens-lst '((1 2) (3 4 ))))
;(print (sum-lens-lst '(())))