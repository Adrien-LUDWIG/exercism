(module
  (func (export "steps") (param $number i32) (result i32)
    (local $nb_of_steps i32)

    (if (i32.lt_s (local.get $number) (i32.const 1))
      (then (return (i32.const -1))))
    (if (i32.eq (local.get $number) (i32.const 1))
      (then (return (i32.const 0))))

    (local.set $nb_of_steps (i32.const 0))

    (loop $collatz
      (if (i32.eq (i32.rem_s (local.get $number) (i32.const 2)) (i32.const 0))
        (then ;; even: n = n / 2
          (local.set $number (i32.div_s (local.get $number) (i32.const 2))))
        (else ;; odd: n = 3n + 1
          (local.set $number (i32.add (i32.mul (local.get $number (i32.const 3))) (i32.const 1))))
      )
      (local.set $nb_of_steps (i32.add (local.get $nb_of_steps) (i32.const 1)))

      (i32.ne (local.get $number) (i32.const 1))
      (br_if $collatz)
    )

    (return (local.get $nb_of_steps))
  )
)