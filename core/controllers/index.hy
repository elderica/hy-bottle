(import [core [app]])
(import [bottle [template]])

(with-decorator (.route app "/")
  (defn index []
    (template "index")))
