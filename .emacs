
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-image-file-mode t)
 '(column-number-mode t)
 '(default-buffer-file-coding-system (quote utf-8-unix) t)
 '(delete-by-moving-to-trash t)
 '(display-time-mode t)
 '(electric-pair-mode t)
 '(frame-title-format "emacs@%b" t)
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "d:/Documents/Programming/")
 '(initial-scratch-message "Happy hacking and enjoy yourself!")
 '(package-selected-packages
   (quote
    (yasnippet-snippets magit nhexl-mode csv-mode cmake-mode markdown-mode org python company-lsp flycheck company-auctex auctex lsp-mode highlight-indent-guides yasnippet company solarized-theme)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;; Initialize Chinese font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Microsoft YaHei UI")))

;; Initialize coding system
(prefer-coding-system 'utf-8-unix)

;; Set right control key for Surface
(setq w32-apps-modifier 'control)

;; (setq w32-pass-rwindow-to-system nil
;;       w32-rwindow-modifier 'control)
;; (define-key key-translation-map [apps] 'event-apply-control-modifier)

;; Initialize system environment
(defun system-env-init ()
  (when (eq system-type 'windows-nt)
    (setenv "PATH" "$EMACSPATH;$Path" t)
    (setenv "HOME" "$emacs_dir" t)
    ;; (setenv "C_INCLUDE_PATH" "D:\\GNU\\mingw64\\include;D:\\GNU\\mingw64\\x86_64-w64-mingw32\\include")
    ;; (setenv "CPLUS_INCLUDE_PATH" "D:\\GNU\\mingw64\\include;D:\\GNU\\mingw64\\lib\\gcc\\x86_64-w64-mingw32\\7.3.0\\include\\c++;D:\\GNU\\mingw64\\lib\\gcc\\x86_64-w64-mingw32\\7.3.0\\include\\c++\\x86_64-w64-mingw32;D:\\GNU\\mingw64\\lib\\gcc\\x86_64-w64-mingw32\\7.3.0\\include\\c++\\backward;D:\\GNU\\mingw64\\x86_64-w64-mingw32\\include")
    ;; (setenv "LIBRARY_PATH" "D:\\GNU\\mingw64\\lib;D:\\GNU\\mingw64\\lib\\gcc\\x86_64-w64-mingw32\\lib;D:\\GNU\\mingw64\\x86_64-w64-mingw32\\lib")
    ;; (setenv "GTAGSLIBPATH" "D:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\5.0.1\\CMSIS\\Include;D:\\Keil_v5\\ARM\\PACK\\Keil\\STM32F1xx_DFP\\2.2.0\\Device;E:\\Programming\\STM32\\EmacsSemanticSetting;")
    (setenv "DICTIONARY" "en_GB")
    (setenv "PYTHONIOENCODING" "UTF-8")
    (setenv "ProgramW6432" "D:\\GNU")
    (setenv "WAFDIR" "D:\\Documents\\Programming\\Python\\waf")))
(system-env-init)

;; Initialize packages
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Initialize user packages
;; (setq load-path (append '("~/.emacs.d/user" "~/.emacs.d/user/company-words" "~/.emacs.d/user/lsp-clangd") load-path))
;; (load "loaddefs")

;; Initialize theme and layout
(load-theme 'solarized-dark t)

;; Initialize external global minor mode
(ido-mode t)
(global-company-mode t)

;; ispell setting
(setq ispell-program-name "hunspell"
      ispell-complete-word-dict "c:/GNU/hunspell-1.3.2-3-w32-bin/share/hunspell/wordsEn.dic")

;; magit setting
(global-set-key (kbd "C-x g") 'magit-status)

;;----------------------external package setting-----------------------------

;; hightlight-indent-guides-mode setting
(setq highlight-indent-guides-method 'character)

;; lsp-mode setting
(setq lsp-prefer-flymake nil)
;; (require 'lsp)
;; (require 'lsp-clients)
;; (setq lsp-auto-configure nil)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

;; (define-key lsp-ui-mode-map [remap xref-find-definitions] 'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] 'lsp-ui-peek-find-references)
;;   lsp stdio client for python
;; (lsp-define-stdio-client lsp-python "python"
;; 			 (lambda () default-directory)
;; 			 '("pyls"))
;; (lsp-define-stdio-client lsp-python "python"
;; 			 (lambda () default-directory)
;; 			 '("C:/Users/ZYF/.vscode/extensions/ms-python.python-2018.10.1/languageServer.0.1.60/Microsoft.Python.LanguageServer.exe"))
;;   lsp stdio client for c/c++/objc/objc++
;; (lsp-define-stdio-client lsp-clangd "clangd"
;; 			 (lsp-make-traverser "compile_commands.json")
;; 			 '("clangd")
;; 			 :ignore-regexps
;;                          '("^Error -[0-9]+: .+$"))

;;---------------------------minor mode setting------------------------------
;; company-mode setting
(setq company-transformers '(company-sort-by-occurrence))

;; company-dabbrev setting
(setq company-dabbrev-downcase nil)

;;----------------------------major mode setting-----------------------------
;; prog-mode setting
(add-hook 'prog-mode-hook (lambda()
			    (linum-mode t)
			    (yas-minor-mode t)
			    (hs-minor-mode t)
			    (highlight-indent-guides-mode t)))

;; cc-mode setting
(setq c-default-style "stroustrup")
(setq c-basic-offset 4)
(add-hook 'c-mode-common-hook (lambda()
				(lsp)
				(setq tab-width 4)
				(flycheck-mode t)
				(setq-local company-transformers nil)
				(setq-local company-lsp-cache-candidates nil)
				(setq-local company-backends '((company-yasnippet company-lsp company-keywords company-dabbrev company-files)))))

;; python-mode setting
;;   original python-mode setting
(setq python-shell-prompt-detect-failure-warning nil
      python-shell-completion-native-enable nil
      python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt")

(add-hook 'python-mode-hook (lambda()
			      (lsp)
			      (setq tab-width 4)
			      (setq-local indent-tabs-mode nil)
			      (setq-local company-backends '((company-yasnippet company-lsp company-files)))))
;;   Set Python process coding system
(add-hook 'inferior-python-mode-hook (lambda()
				       (set-process-coding-system (get-process "Python") 'utf-8-unix 'utf-8-unix)))

;; verilog-mode setting
(setq verilog-auto-newline nil)
(add-hook 'verilog-mode-hook (lambda ()
			       (setq-local indent-tabs-mode nil)
			       (setq-local company-backends '((company-yasnippet company-capf company-files)))))


;; text-mode setting
(add-hook 'text-mode-hook (lambda()
			    (linum-mode t)
			    (yas-minor-mode t)
			    (setq-local company-backends '((company-yasnippet company-dabbrev company-files)))))

;; TeX-mode setting for LaTeX
(setq TeX-engine 'xetex
      TeX-view-program-selection
      '(((output-dvi style-pstricks)
	 "dvips and start")
	(output-dvi "dviout")
	(output-pdf "SumatraPDF")
	(output-html "start")))
(add-hook 'TeX-mode-hook (lambda()
			   (outline-minor-mode t)
			   ;; (flymake-mode t)
			   (flycheck-mode t)
			   (setq-local flycheck-idle-change-delay 30)
			   (setq-local indent-tabs-mode nil)
			   (setq-local company-backends '((company-yasnippet company-auctex-macros company-auctex-symbols company-auctex-environments company-auctex-bibs company-auctex-labels company-dabbrev company-files)))))

;; org-mode setting
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook (lambda()
			   (linum-mode t)
		           (org-babel-do-load-languages
                            'org-babel-load-languages 
                            '((emacs-lisp . t)
                              (python . t)
                              (latex . t)))
			   (setq-local company-backends '((company-yasnippet company-capf company-dabbrev company-files)))))

;;--------------------------other emacs setting------------------------------
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
