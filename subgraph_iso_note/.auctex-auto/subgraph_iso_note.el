(TeX-add-style-hook
 "subgraph_iso_note"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-run-style-hooks
    "latex2e"
    "preamble"
    "article"
    "art12")
   (LaTeX-add-labels
    "lem:fake"
    "thm:fake"))
 :latex)

