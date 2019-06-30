#!/bin/bash
":"; exec emacs -Q  --script "$0" -f main -- "$@" # -*-emacs-lisp-*-
(defun main ()
  (require 'ox-publish)
  (setq org-publish-project-alist
        `(("al-compas"
           :with-author nil
           :with-toc nil
           ;;:with-creator nil
           :base-directory "~/proyectos/al-compas.github.io/org"
           
           :recursive t
           :publishing-directory "~/proyectos/al-compas.github.io/files"
           :publishing-function org-html-publish-to-html)))
  
  (org-publish "al-compas" t))

(main)
