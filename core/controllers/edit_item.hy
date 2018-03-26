(import [core [app]])
(import [bottle [template request]])
(import [core.models.todo [Todo]])

(with-decorator (.route app "/edit/<no:int>")
  (defn edit-item [no]
    (if (. request query save)
      (do (.update! (Todo)
            no
	    (.strip (. request query task))
	    (.strip (. request query status)))
          (.format "<p>The item number {0} was successfully updated</p><a href=/edit/{0}>Back</a>" no))
      (template "edit_task" :old (.search-by-id (Todo) no :one True) :no no))))
