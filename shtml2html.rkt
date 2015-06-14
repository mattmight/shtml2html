#lang racket

; shtml2html: A Racket script for converting basic shtml files to html.

; Copyright (C) 2015 Matthew Might

; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.


; ISSUES

;  + Only supports server-side include for `file`.

(require parser-tools/lex)
(require (prefix-in : parser-tools/lex-sre))

(define shtml-transformer
  (lexer
   [(:: "<!--#include" (:* " ") "file=\"" (:+ (:or alphabetic numeric "-" ".")) "\"" (:* " ")  "-->")
    (begin
      (define parts (string-split lexeme "\""))
      (define file-name (cadr parts))
      (define contents (call-with-input-file file-name port->string))
      (display contents)
      (shtml-transformer input-port))]
   
   [any-char
    (begin
      (display lexeme)
      (shtml-transformer input-port))]))


(shtml-transformer (current-input-port))

    
