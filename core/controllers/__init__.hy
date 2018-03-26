(import (os.path (split splitext join dirname))
        (glob (glob)))

(setv __all__
  (list-comp
    (second (split (first (splitext file))))
    (file (glob (join (dirname __file__) "*.hy")))))

