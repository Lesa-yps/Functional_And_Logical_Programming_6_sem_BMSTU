(setf *random-state* (make-random-state t)) ;; Setting up random numbers

;; Rolls two dice for a given player and returns the results
(defun throw-dices (player)
  (let ((d1 (+ 1 (random 6)))
        (d2 (+ 1 (random 6))))
     (print (list "Player" player "rolled" d1 d2))
     (list d1 d2 (+ d1 d2))))

;; Checks if a reroll is needed (if both dice are 1s or 6s)
(defun should-reroll? (lst-res-throw)
  (let ((d1 (car lst-res-throw))
        (d2 (cadr lst-res-throw)))
     (or (and (= d1 1) (= d2 1))
         (and (= d1 6) (= d2 6)))))

;; Rolls dice and rerolls if necessary
(defun roll-dices-with-reroll (player)
    (let ((result (throw-dices player)))
       (if (should-reroll? result) (throw-dices player) result)))

;; Checks for an instant win (sum is 7 or 11)
(defun check-instant-win (sum)
  (if (or (= sum 7) (= sum 11)) 'win sum))

;; Handles a player's turn: rolls dice and checks for an instant win
(defun play-player (player)
  (let ((result (roll-dices-with-reroll player)))
     (check-instant-win (caddr result))))

;; Determines the winner based on dice sums
(defun determine-winner (sum1 sum2)
  ;; (print (list "Player_1=" sum1 " Player_1="  sum2))
  (cond ((> sum1 sum2) (print "Player 1 wins!"))
        ((< sum1 sum2) (print "Player 2 wins!"))
        (t (print "It's a draw!"))))

;; Runs the game: both players take turns, and the winner is determined
(defun play ()
  (let ((p1 (play-player 1)))
    (if (eql p1 'win)
        (print "Player 1 wins!")
        (let ((p2 (play-player 2)))
          (if (eql p2 'win)
              (print "Player 2 wins!")
              (determine-winner p1 p2))))))

(play)
