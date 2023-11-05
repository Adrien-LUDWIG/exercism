(module
  (memory (export "mem") 1)

  (global $a i32 (i32.const 97))
  (global $z i32 (i32.const 122))
  (global $A i32 (i32.const 65))
  (global $Z i32 (i32.const 90))

  (func $isLowercaseLetter (param $char i32) (result i32)
    (return
      (i32.and
        (i32.ge_u (local.get $char) (global.get $a))
        (i32.le_u (local.get $char) (global.get $z))))
  )

  (func $isUppercaseLetter (param $char i32) (result i32)
    (return
      (i32.and
        (i32.ge_u (local.get $char) (global.get $A))
        (i32.le_u (local.get $char) (global.get $Z))))
  )

  (func $encodeChar (param $char i32) (param $shiftKey i32) (result i32)
    (local $offset i32)

    (if (call $isLowercaseLetter (local.get $char))
      (then (local.set $offset (global.get $a)))
    (else (if (call $isUppercaseLetter (local.get $char))
      (then (local.set $offset (global.get $A)))
    (else (return (local.get $char))))))

    ;; Translation
    (local.set $char (i32.sub (local.get $char) (local.get $offset)))

    ;; Rotation
    (local.set $char (i32.add (local.get $char) (local.get $shiftKey)))
    (local.set $char (i32.rem_u (local.get $char) (i32.const 26)))

    ;; Translation
    (local.set $char (i32.add (local.get $char) (local.get $offset)))

    (return (local.get $char))
  )

  (func (export "rotate") (param $offset i32) (param $length i32) (param $shiftKey i32) (result i32 i32)
    (local $char_index i32)
    (local $end_index i32)
    (local $char i32)

    (local.set $char_index (local.get $offset))
    (local.set $end_index (i32.add (local.get $offset) (local.get $length)))


    (loop $encode
      (if (i32.lt_u (local.get $char_index) (local.get $end_index))
        (then
          ;; Get current char
          (local.set $char (i32.load8_u (local.get $char_index)))

          ;; Encode it
          (local.set $char (call $encodeChar (local.get $char) (local.get $shiftKey)))
          
          ;; Write it back to memory
          (i32.store8 (local.get $char_index) (local.get $char))

          ;; Update index
          (local.set $char_index (i32.add (local.get $char_index) (i32.const 1)))
          (br $encode)
        )
      )
    )

    (return (local.get $offset) (local.get $length))
  )
)
