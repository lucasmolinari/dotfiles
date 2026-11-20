;;; ayu-dark-theme.el --- Ayu Dark for Emacs -*- lexical-binding: t; -*-

(deftheme ayu-dark
  "Ayu Dark theme ported from ayu-theme/ayu-vim.")

(let ((bg        "#0F1419")
      (comment   "#5C6773")
      (markup    "#F07178")
      (constant  "#FFEE99")
      (operator  "#E7C547")
      (tag       "#36A3D9")
      (regexp    "#95E6CB")
      (string    "#B8CC52")
      (function  "#FFB454")
      (special   "#E6B673")
      (keyword   "#FF7733")
      (error     "#FF3333")
      (accent    "#F29718")
      (panel     "#14191F")
      (guide     "#2D3640")
      (line      "#151A1E")
      (selection "#253340")
      (fg        "#E6E1CF")
      (fg-idle   "#3E4B59"))

  (custom-theme-set-faces
   'ayu-dark

   ;; Core
   `(default ((t (:foreground ,fg :background ,bg))))
   `(cursor ((t (:background ,accent))))
   `(region ((t (:background ,selection))))
   `(highlight ((t (:background ,selection))))
   `(hl-line ((t (:background ,line))))
   `(fringe ((t (:foreground ,guide :background ,bg))))
   `(vertical-border ((t (:foreground ,guide))))
   `(shadow ((t (:foreground ,fg-idle))))
   `(link ((t (:foreground ,tag :underline t))))
   `(success ((t (:foreground ,string))))
   `(warning ((t (:foreground ,accent))))
   `(error ((t (:foreground ,error :weight bold))))

   ;; Syntax highlighting
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment))))
   `(font-lock-constant-face ((t (:foreground ,constant))))
   `(font-lock-string-face ((t (:foreground ,string))))
   `(font-lock-variable-name-face ((t (:foreground ,tag))))
   `(font-lock-function-name-face ((t (:foreground ,function))))
   `(font-lock-keyword-face ((t (:foreground ,keyword))))
   `(font-lock-type-face ((t (:foreground ,tag))))
   `(font-lock-builtin-face ((t (:foreground ,special))))
   `(font-lock-preprocessor-face ((t (:foreground ,special))))
   `(font-lock-warning-face ((t (:foreground ,error))))
   `(font-lock-doc-face ((t (:foreground ,string))))
   `(font-lock-negation-char-face ((t (:foreground ,markup))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,regexp))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,regexp))))

   ;; Search
   `(isearch ((t (:foreground ,bg :background ,constant))))
   `(isearch-fail ((t (:foreground ,fg :background ,error))))
   `(lazy-highlight ((t (:foreground ,fg :background ,selection))))
   `(match ((t (:foreground ,fg :background ,selection))))

   ;; Minibuffer
   `(minibuffer-prompt ((t (:foreground ,accent))))
   `(completions-common-part ((t (:foreground ,accent))))
   `(completions-first-difference ((t (:foreground ,keyword))))
   `(escape-glyph ((t (:foreground ,regexp))))
   `(trailing-whitespace ((t (:background "#371F1C"))))

   ;; Line numbers
   `(line-number ((t (:foreground ,guide :background ,bg))))
   `(line-number-current-line
     ((t (:foreground ,accent :background ,line))))

   ;; Mode line
   `(mode-line
     ((t (:foreground ,fg :background ,panel
                      :box (:line-width 1 :color ,panel)))))
   `(mode-line-inactive
     ((t (:foreground ,fg-idle :background ,panel
                      :box (:line-width 1 :color ,panel)))))
   `(mode-line-buffer-id ((t (:foreground ,fg :weight bold))))

   ;; Parentheses
   `(show-paren-match
     ((t (:foreground ,fg :background ,bg :underline t))))
   `(show-paren-mismatch
     ((t (:foreground ,error :weight bold))))

   ;; Completion: Corfu / Vertico / Orderless
   `(corfu-default ((t (:foreground ,fg :background ,selection))))
   `(corfu-current ((t (:foreground ,fg :background ,guide))))
   `(corfu-bar ((t (:background ,accent))))
   `(corfu-border ((t (:background ,panel))))
   `(vertico-current ((t (:background ,selection))))
   `(orderless-match-face-0 ((t (:foreground ,accent :weight bold))))
   `(orderless-match-face-1 ((t (:foreground ,regexp :weight bold))))
   `(orderless-match-face-2 ((t (:foreground ,string :weight bold))))
   `(orderless-match-face-3 ((t (:foreground ,constant :weight bold))))

   ;; Eldoc
   `(eldoc-highlight-function-argument
     ((t (:foreground ,accent :weight bold))))

   ;; Dired
   `(dired-directory ((t (:foreground ,fg-idle))))
   `(dired-symlink ((t (:foreground ,tag))))
   `(dired-marked ((t (:foreground ,accent))))
   `(dired-flagged ((t (:foreground ,markup))))

   ;; Diff
   `(diff-added ((t (:foreground ,string :background ,panel))))
   `(diff-removed ((t (:foreground ,markup :background ,panel))))
   `(diff-changed ((t (:foreground ,tag :background ,panel))))
   `(diff-header ((t (:foreground ,fg :background ,panel))))
   `(diff-file-header ((t (:foreground ,accent :background ,panel))))
   `(diff-hunk-header ((t (:foreground ,special :background ,panel))))

   ;; Compilation
   `(compilation-error ((t (:foreground ,error :weight bold))))
   `(compilation-warning ((t (:foreground ,accent))))
   `(compilation-info ((t (:foreground ,string))))

   ;; Org
   `(org-level-1 ((t (:foreground ,function))))
   `(org-level-2 ((t (:foreground ,tag))))
   `(org-level-3 ((t (:foreground ,string))))
   `(org-level-4 ((t (:foreground ,special))))
   `(org-level-5 ((t (:foreground ,keyword))))
   `(org-link ((t (:foreground ,tag :underline t))))
   `(org-code ((t (:foreground ,string))))
   `(org-verbatim ((t (:foreground ,constant))))
   `(org-block ((t (:background ,panel))))
   `(org-block-begin-line ((t (:foreground ,fg-idle))))
   `(org-block-end-line ((t (:foreground ,fg-idle))))
   `(org-todo ((t (:foreground ,markup :weight bold))))
   `(org-done ((t (:foreground ,string))))
   `(org-date ((t (:foreground ,tag))))

   ;; Whitespace
   `(whitespace-space ((t (:foreground ,guide))))
   `(whitespace-tab ((t (:foreground ,guide))))
   `(whitespace-trailing ((t (:background "#371F1C"))))

   ;; Flymake / Flycheck
   `(flymake-error
     ((t (:underline (:style wave :color ,error)))))
   `(flymake-warning
     ((t (:underline (:style wave :color ,accent)))))
   `(flymake-note
     ((t (:underline (:style wave :color ,tag)))))

   ;; Git gutter / diff indicators
   `(diff-indicator-added ((t (:foreground ,string))))
   `(diff-indicator-removed ((t (:foreground ,markup))))
   `(diff-indicator-changed ((t (:foreground ,tag))))

   ;; Widget
   `(widget-field ((t (:background ,panel :foreground ,fg))))
   `(widget-button ((t (:foreground ,tag :weight bold))))
   `(widget-single-line-field ((t (:background ,panel))))

   ;; Tab bar
   `(tab-bar ((t (:foreground ,fg :background ,panel))))
   `(tab-bar-tab ((t (:foreground ,fg :background ,bg
                                  :weight bold))))
   `(tab-bar-tab-inactive ((t (:foreground ,fg-idle
                                           :background ,panel))))

   ;; Custom
   `(header-line ((t (:foreground ,fg :background ,panel))))
   `(tooltip ((t (:foreground ,fg :background ,panel))))
   `(secondary-selection ((t (:background ,guide))))))

(provide-theme 'ayu-dark)

;;; ayu-dark-theme.el ends here
