;; Goal of this emacs script is to easily be able to convert coffee files
;; to javascript files
(defun convert-coffee-2-js ()
  (interactive)
  (let ((do-it (y-or-n-p "Delete coffee file?"))
        (coffee-filename (buffer-file-name))
        (js-filename (concat (file-name-sans-extension buffer-file-name) ".js")))
    (shell-command
     (format "decaffeinate %s" coffee-filename))
    (if do-it
        (progn
          (spacemacs/delete-current-buffer-file)
          (find-file js-filename)))))
