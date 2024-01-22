(ns leap)

(defn leap-year? [year]
  (defn divisor? [val]
    (= (mod year val) 0))
  (and (divisor? 4) (or (not (divisor? 100))
                        (divisor? 400))))
