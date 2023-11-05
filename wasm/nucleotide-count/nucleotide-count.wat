(module
  (memory (export "mem") 1)

  (global $A i32 (i32.const 65))
  (global $C i32 (i32.const 67))
  (global $G i32 (i32.const 71))
  (global $T i32 (i32.const 84))

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $char i32)
    (local $A_count i32)
    (local $C_count i32)
    (local $G_count i32)
    (local $T_count i32)

    (local.set $A_count (i32.const 0))
    (local.set $C_count (i32.const 0))
    (local.set $G_count (i32.const 0))
    (local.set $T_count (i32.const 0))

    (loop $count
      (if (i32.gt_u (local.get $length) (i32.const 0))
        (then
          (local.set $char (i32.load8_u (local.get $offset)))
          (if (i32.eq (local.get $char) (global.get $A))
            (then (local.set $A_count (i32.add (local.get $A_count) (i32.const 1))))
          (else (if (i32.eq (local.get $char) (global.get $C))
            (then (local.set $C_count (i32.add (local.get $C_count) (i32.const 1))))
          (else (if (i32.eq (local.get $char) (global.get $G))
            (then (local.set $G_count (i32.add (local.get $G_count) (i32.const 1))))
          (else (if (i32.eq (local.get $char) (global.get $T))
            (then (local.set $T_count (i32.add (local.get $T_count) (i32.const 1))))
          (else
            (return
              (i32.const -1)
              (i32.const -1)
              (i32.const -1)
              (i32.const -1))))))))))

          (local.set $length (i32.sub (local.get $length) (i32.const 1)))
          (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
          (br $count))))
    (return 
      (local.get $A_count)
      (local.get $C_count)
      (local.get $G_count)
      (local.get $T_count))
  )
)
