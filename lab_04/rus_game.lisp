(setf *random-state* (make-random-state t)) ;; Инициализация генератора случайных чисел

(defun throw-dices (player)
  "Бросает два кубика и возвращает их значения."
  (let ((d1 (+ 1 (random 6)))
        (d2 (+ 1 (random 6))))
     (print (list "Игрок" player "выбросил" d1 d2))
     (list d1 d2 (+ d1 d2))))

(defun should-reroll? (lst-res-throw)
  "Проверяет, нужно ли перебрасывать кубики."
  (let ((d1 (car lst-res-throw))
        (d2 (cadr lst-res-throw)))
     (or (and (= d1 1) (= d2 1)) ;; Переброс, если выпало (1 1)
         (and (= d1 6) (= d2 6))))) ;; Переброс, если выпало (6 6)

(defun roll-dices-with-reroll (player)
  "Бросает кубики и выполняет переброс при необходимости."
    (let ((result (throw-dices player)))
       (if (should-reroll? result) (throw-dices player) result)))

(defun check-instant-win (sum)
  "Проверяет мгновенную победу (сумма 7 или 11)."
  (if (or (= sum 7) (= sum 11)) 'win sum))

(defun play-player (player)
  "Ход игрока: бросает кубики, применяет правила и возвращает результат."
  (let ((result (roll-dices-with-reroll player)))
     (check-instant-win (caddr result))))

(defun determine-winner (sum1 sum2)
  "Определяет победителя по результатам бросков."
  (cond ((> sum1 sum2) (print "Победил игрок 1!"))
        ((< sum1 sum2) (print "Победил игрок 2!"))
        (t (print "Ничья!"))))

(defun play ()
  "Запускает игру между двумя игроками и определяет победителя."
  (let ((p1 (play-player 1)))
    (if (eql p1 'win)
        (print "Победил игрок 1!")
        (let ((p2 (play-player 2)))
          (if (eql p2 'win)
              (print "Победил игрок 2!")
              (determine-winner p1 p2))))))

(play) ;; Запуск игры
