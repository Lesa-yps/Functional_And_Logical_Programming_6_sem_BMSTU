;; Функция создает список из трех элементов.
(defun my-list (a b c)
    (cons a (cons b (cons c Nil))))

;; Функция сортирует список из трех элементов в порядке возрастания.
(defun sort-lst (lst)
   (let ((a (car lst))    ;; Первый элемент
         (b (cadr lst))   ;; Второй элемент
         (c (caddr lst))) ;; Третий элемент
       (cond ((< a b) (cond ((< b c) (my-list a b c))  ;; a < b < c
                            ((< a c) (my-list a c b))  ;; a < c < b
                            (t (my-list c a b))))      ;; c < a < b
             ((< a c) (my-list b a c))                 ;; b < a < c
             ((< b c) (my-list b c a))                 ;; b < c < a
             (t (my-list c b a)))))                    ;; c < b < a

;; Функция сортирует список из трех элементов в порядке убывания.
(defun rev-sort-lst (lst)
    (let* ((sort_lst (sort-lst lst))   ;; Сортируем список по возрастанию
           (min_el (car sort_lst))     ;; Минимальный элемент
           (sr_el (cadr sort_lst))     ;; Средний элемент
           (max_el (caddr sort_lst)))  ;; Максимальный элемент
        (my-list max_el sr_el min_el))) ;; Возвращаем список в порядке убывания

;; Функция вычисляет сумму квадратов двух чисел.
(defun sum-squares-num (x y)
    (+ (* x x) (* y y)))

;; Основная функция, решающая задачу.
(defun solve-task (lst1 lst2)
    (let ((sort_lst1 (sort-lst lst1))  ;; Сортируем первый список
          (sort_lst2 (sort-lst lst2))) ;; Сортируем второй список
        (let ((el1 (sum-squares-num (car sort_lst1) (car sort_lst2))) ;; min1^2 + min2^2
              (el2 (+ (cadr sort_lst1) (cadr sort_lst2)))             ;; sr1 + sr2
              (el3 (- (caddr sort_lst1) (caddr sort_lst2))))          ;; max1 - max2
            (rev-sort-lst (my-list el1 el2 el3)))))                   ;; Возвращаем отсортированный по убыванию список

(print (solve-task '(2 1 3) '(6 5 4))) ;; Вывод результата
