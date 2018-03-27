(import [core [app]])
(import [bottle [template]])
(import [core.models.todo [Todo]])

(with-decorator (.route app "/item<item:re:[0-9]+>")
  (defn show-item [item]
    (do (setv result (.search-by-id (Todo) item))
        (if result
            (.format "Task: {}" (first (first result)))
            "This item does not exist!"))))
