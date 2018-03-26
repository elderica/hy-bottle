(import [core [app]])
(import [bottle [template request]])
(import [core.models.todo [Todo]])

(with-decorator (.route app "/new")
  (defn new-item []
    (if (. request query save)
      (.format "<p>The new task was inserted into the database, the ID is {}</p>"
        (.create! (Todo) (.strip (. request query task))))
      (template "new_task"))))
