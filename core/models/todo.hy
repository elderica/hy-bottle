(import [sqlite3 [connect]])

(defclass Todo []
  [db "./todo.db"]

  (defn create! [self task]
    (with [conn (connect self.db)]
      (do (setv c (.cursor conn))
          (.execute c "INSERT INTO todo (task, status) VALUES (?,?);" (tuple [task 1]))
	  (setv newid (. c lastrowid))
	  (.commit conn)
	  newid)))

  (defn search-by-status [self status]
    (with [conn (connect self.db)]
      (do (setv c (.cursor conn))
          (.execute c "SELECT id, task FROM todo WHERE status LIKE ?;" (tuple [status]))
          (.fetchall c))))

  (defn update! [self id task status]
    (with [conn (connect self.db)]
      (do (setv c (.cursor conn))
          (.execute c "UPDATE todo SET task = ?, status = ? WHERE id LIKE ?;" (tuple [task status id]))
	  (.commit conn))))

  (defn search-by-id [self id &key {"one" False}]
    (with [conn (connect self.db)]
      (do (setv c (.cursor conn))
          (.execute c "SELECT task FROM todo WHERE id LIKE ?;" (tuple [id]))
	  (if one
	    (.fetchone c)
	    (.fetchall c))))))

