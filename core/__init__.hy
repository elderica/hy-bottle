(import [bottle [TEMPLATE_PATH Bottle]])
(import [os.path [abspath join dirname]])

(.clear TEMPLATE_PATH)
(.append TEMPLATE_PATH (join (dirname (abspath __file__)) "templates/"))

(setv app (Bottle))

