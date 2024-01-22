(ns leap)

(defn leap-year? [year]
  (letfn [(divisor? [n] (zero? (mod year n)))]
    (and (divisor? 4) (or (not (divisor? 100))
                          (divisor? 400)))))
