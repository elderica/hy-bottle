(import (os.path (abspath split splitext join dirname))
        (glob (glob)))

(defn find-for [pat]
  (glob (join (dirname __file__) pat)))

(defn find-all-controllers-from-sources []
  (list-comp
    (-> file split second splitext first)
    (file (find-for "*.hy"))))

(defn find-all-controllers-from-pycache []
  (list-comp
    (-> file split second splitext first splitext first)
    (file (find-for "*.pyc"))))

(defn find-all-controllers []
  (do (setv d (dirname (abspath __file__)))
      (if (= (second (split d)) "__pycache__")
          (find-all-controllers-from-pycache)
          (find-all-controllers-from-sources))))

(setv __all__ (find-all-controllers))
