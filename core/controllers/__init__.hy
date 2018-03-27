(import (os.path (abspath split splitext join dirname))
        (glob (glob)))

(defn find-all-controllers-from-sources []
  (list-comp
    (second (split (first (splitext file))))
    (file (glob (join (dirname __file__) "*.hy")))))

(defn find-all-controllers-from-pycache []
  (list-comp
    (first (splitext (second (split (first (splitext file))))))
    (file (glob (join (dirname __file__) "*.pyc")))))

(defn find-all-controllers []
  (do (setv d (dirname (abspath __file__)))
      (if (= (second (split d)) "__pycache__")
          (find-all-controllers-from-pycache)
          (find-all-controllers-from-sources))))

(setv __all__ (find-all-controllers))
