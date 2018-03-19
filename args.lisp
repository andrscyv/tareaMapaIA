#! /usr/local/bin/clisp
(print *args*)

(setq ini (parse-integer (car *args*)))
(print ini)