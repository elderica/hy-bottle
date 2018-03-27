(import [bottle [TEMPLATE_PATH Bottle]])
(import [os.path [abspath join dirname split]])

(.clear TEMPLATE_PATH)
(defn locate-template-path []
  (do (setv d (dirname (abspath __file__)))
      (join (if (= (second (split d)) "__pycache__")
                (first (split d))
                d)
            "templates/")))

;(.append TEMPLATE_PATH
;  (join (dirname (abspath __file__))
;        "templates/"))
(.append TEMPLATE_PATH (locate_template-path))

(setv app (Bottle))

