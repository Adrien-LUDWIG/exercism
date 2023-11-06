(module
  (memory (export "mem") 1)

  (data (i32.const 100) "black,brown,red,orange,yellow,green,blue,violet,grey,white")

  ;; Return buffer of comma separated colors
  ;; black,brown,red,orange,yellow,green,blue,violet,grey,white
  (func (export "colors") (result i32 i32)
    (return (i32.const 100) (i32.const 58))
  )

  ;; Called each time a module is initialized
  ;; Can be used to populate globals similar to a constructor
  (func $initialize)
  (start $initialize)

  ;; Given a valid resistor color, returns the associated value 
  (func (export "colorCode") (param $offset i32) (param $len i32) (result i32)
    (local $char i32)
    (local.set $char (i32.load8_u (local.get $offset)))

    (if (i32.eq (local.get $char) (i32.const 98))
      (then (if (i32.eq (i32.load8_u (i32.add (local.get $offset) (i32.const 1))) (i32.const 114))
              (then (return (i32.const 1)))                     ;; Brown
              (else (if (i32.eq (local.get $len) (i32.const 5))
                      (then (return (i32.const 0)))             ;; Black
                      (else (return (i32.const 6))))))))        ;; Blue
    (if (i32.eq (local.get $char) (i32.const 103))
      (then (if (i32.eq (local.get $len) (i32.const 5))
              (then (return (i32.const 5)))                     ;; Green
              (else (return (i32.const 8))))))                  ;; Grey
    (if (i32.eq (local.get $char) (i32.const 111))
      (then (return (i32.const 3))))                            ;; Orange
    (if (i32.eq (local.get $char) (i32.const 114))
      (then (return (i32.const 2))))                            ;; Red
    (if (i32.eq (local.get $char) (i32.const 118))
      (then (return (i32.const 7))))                            ;; Violet
    (if (i32.eq (local.get $char) (i32.const 119))
      (then (return (i32.const 9))))                            ;; White
    (return (i32.const 4))                                      ;; Yellow
  )
)
