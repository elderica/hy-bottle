(import [core [app]])
(import [bottle [template]])

(with-decorator (.error app 403)
  (defn mistake403 [code]
    "There is a mistake in your url!"))

(with-decorator (.error app 404)
  (defn mistake404 [code]
    "Sorry, this page does not exist!"))
