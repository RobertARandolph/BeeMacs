;;; Compiled snippets and support files for `snippet-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippet-mode
		     '(("lmg" "{::nomarkdown}\n  <a href=\"/assets/${1:directory}/${2:file}\">\n    <img src=\"/assets/$1/Thumbnails/$2\" alt=\"${3:alt-text}\">\n  </a>\n  <div class=\"image-caption\">${4:description}</div>\n{:/nomarkdown}" "Linked image" nil nil nil "/Users/robertrandolph/.emacs.d/snippets/snippet-mode/lmg" nil nil)
		       ("img" "{::nomarkdown}\n  <img src=\"/assets/$1/Thumbnails/$2\" alt=\"${3:alt-text}\">\n  <div class=\"image-caption\">${4:description}</div>\n{:/nomarkdown}" "UnLinked Image" nil nil nil "/Users/robertrandolph/.emacs.d/snippets/snippet-mode/img" nil nil)))


;;; Do not edit! File generated at Mon Jan 22 11:43:38 2018
