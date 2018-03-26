(import [core [app]])
(import [bottle [template]])
(import [core.models.todo [Todo]])

(with-decorator (.route app "/todo")
  (defn todo-list []
    (template "make_table" :rows (.search-by-status (Todo) 1))))
