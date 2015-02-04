;;; elisp --- simple elisp
;;; Commentary:

;;; code:

;;; BASICS

;; assign value to a symbol
(defparameter vern 11)

(defvar version 11)
(set 'version "24.3")

;; assign value to a variable
(setq version 11)
(setq version (1+ version))

(setq editor "emacs" version "24.3")    ; this is a comment

;; use let for local variables
(let (a b)
  (setq a 3)
  (setq b 4)
  (+ a b))

(setq y 2)

(let ((y 1)
      (z y))
  (list y z))

(let* ((y 1)
       (z y))    ; Use the just-established value of y.
  (list y z))




;;; list operations

;; list is a sequence of zero or more lisp exp enclosed in parens
()

;; car returns first element of the list.
(car '(a b c d))

;; cdr returns first element of the list.
(cdr '(a b c d))

;; list - make list from arguments
(list 'a 'x "asdf" 6)

(setq ll '("elisp.el" "test"))
(remove (buffer-name) ll)
(message "%s" ll)


(define-minor-mode esc-mode
  "Toggle esc-keys mode.
   A minor mode so that my key settings override annoying major modes."
  t " esc" 'esc-mode-map)




;; printing
(message "Master emacs")
(message "emacs version %s" "24.3")

;; arithmetic
(- 9 2 3)
(expt 2 3)

(integerp 3.)
(floatp 3.)

;; true false
(if nil "yes" "no")
(if () "yes" "no")
(if '() "yes" "no")
(if (list) "yes" "no")
(if t "yes" "no")
(if 0 "yes" "no")
(if "" "yes" "no")
(if [] "yes" "no")
(and t nil)
(or t nil)


;; conditioanls
(if (not (require 'elpy))
    (message "elpy is not installed")
  (message "elpy is installed"))

(when (not (require 'elpy))
  (message "elpy is not installed")
  (message "go for next package."))

(equal "abc" "abc")
(not (equal 3 4))


;; group a bunch of expressions
(message "a") (message "b")
(progn (message "a") (message "b"))
(progn 3 4 )

;; iteration
(setq x 0)

(while (< x 4)
  (print (format "yay %d" x))
  (setq x (1+ x)))


;; dolist
(setq animals '(gazelle giraffe lion tiger))

(defun reverse-list-with-dolist (list)
  "Reverse elements with dolist"
  (let (value)
    (dolist (element list value)
      (setq value (cons element value)))))

(reverse-list-with-dolist animals)



;; commands
(defun yay ()
  "Insert “Yay!” at cursor position."
    (insert "Yay!"))

(defun yay ()
  "Insert “Yay!” at cursor position."
  (interactive)
  (insert "Yay!"))

(defun myFunction (myArg)
  "Prints the argument"
  (interactive "p")
  (message "Your argument is: %d" myArg))

(defun myFunction (myStart myEnd)
  "Prints region start and end positions"
  (interactive "r")
  (message "Region begin at: %d, end at: %d" myStart myEnd))

(defun add-number (x y)
  "Add two numbers"
  (interactive)
  (message (+ x y)))
(add-number)


(defun add-number (x y)
  "…"
  (interactive "nN1: \n N2: \n")
  (message "sum is %d" (+ x y))
)




;; timers
(timer-create)

(print timer-list)
(print timer-idle-list)

;;(get-universal-time)
(current-time-string)
(current-time)



(setq real-auto-save-timer (timer-create))
(timer-set-time real-auto-save-timer (current-time)
                real-auto-save-interval)


(timer-set-function real-auto-save-timer 'real-auto-save)
(timer-activate real-auto-save-timer)




(defadvice do-auto-save (around maybe-run-after-save-hooks activate)
  (let (maybe-auto-save-buffers)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and auto-save-visited-file-name
                   (recent-auto-save-p)
                   (buffer-modified-p))
          (push buf maybe-auto-save-buffers))))
    ad-do-it
    (dolist (buf maybe-auto-save-buffers)
      (with-current-buffer buf
        (unless (buffer-modified-p)
          (message "Running after-save-hook in %s" (buffer-name))
          (run-hooks after-save-hook))))))




(defvar django-nonindenting-tags
  '("cache" "csrf_token" "cycle" "debug" "extends" "firstof" "include" "load" "now"
    "regroup" "ssi" "templatetag" "trans" "url" "widthratio")
  "List of tags that do not imply indentation (or require an end tag).")
(print django-nonindenting-tags)

(defvar django-indenting-tags
  '("autoescape" "block" "blocktrans" "comment" "elif" "else" "empty"
    "filter" "for" "if" "ifchanged" "ifequal" "ifnotequal" "plural" "spaceless" "verbatim" "with")
  "List of template tags that imply indentation.")

(defvar django-indenting-tags-regexp
  (regexp-opt pony-indenting-tags)
  "Regular expression matching a template tag that implies indentation.")


(defun sgml-indent-line-num ()
  "Indent the current line as SGML."
  (let* ((savep (point))
         (indent-col
          (save-excursion
            (back-to-indentation)
            (if (>= (point) savep) (setq savep nil))
            (sgml-calculate-indent))))
    (if (null indent-col)
        0
      (if savep
          (save-excursion indent-col)
        indent-col))))












;;; functions


;; connect to server sql
(sql-mysql (setq sql-user "root" sql-password "bacillus123"
                 sql-database "pearl" sql-server "192.168.0.100"))


;; check for files & load them
(defun load-file-if-exists (list)
  "Check for file & load it."
  (let (value)
    (dolist (element list value)
      (if (file-exists-p element)
          (load-file (expand-file-name e lement prelude-personal-dir))))))

(load-file-if-exists '("config.el" "kbd.el" "packages.el" "prelude-modules.el"))


;; mysql
(setq sql-mysql-login-params
      '((user :default "root")
        (database :default "pearl")
        (server :default "192.168.0.110")
        (port :default 5432)))


sort-lines
delete-trailing-whitespaces
count-words  # word count on current buffer

(defalias 'qrr 'query-replace-regexp)

(unless (file-exists-p "file.txt") (shell-command "touch file.txt"))


;;; variables
package-activate-list  - list of installed packages




;;; elisp.el ends here