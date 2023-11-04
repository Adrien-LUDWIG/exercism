(module
  (func $isTriange (param f32 f32 f32) (result i32)
      (return (i32.and
                (i32.and 
                  (i32.and
                    (f32.gt (local.get 0) (f32.const 0.0))
                    (f32.gt (local.get 1) (f32.const 0.0)))
                  (f32.gt (local.get 2) (f32.const 0.0)))
                (i32.and
                  (i32.and
                    (f32.ge (f32.add (local.get 0) (local.get 1)) (local.get 2))
                    (f32.ge (f32.add (local.get 1) (local.get 2)) (local.get 0)))
                  (f32.ge (f32.add (local.get 2) (local.get 0)) (local.get 1)))))
  )

  (func $allSidesEqual (param f32 f32 f32) (result i32)
    (return (i32.and
              (f32.eq (local.get 0) (local.get 1))
              (f32.eq (local.get 1) (local.get 2))))
  )

  (func $allSidesDifferent (param f32 f32 f32) (result i32)
    (return (i32.and
              (i32.and
                (f32.ne (local.get 0) (local.get 1))
                (f32.ne (local.get 1) (local.get 2)))
              (f32.ne (local.get 2) (local.get 0))))
  )

  (func (export "isEquilateral") (param f32 f32 f32) (result i32)
    (return (i32.and
              (call $isTriange (local.get 0) (local.get 1) (local.get 2))
              (call $allSidesEqual (local.get 0) (local.get 1) (local.get 2))))
  )

  (func (export "isIsosceles") (param f32 f32 f32) (result i32)
    (return (i32.and
              (call $isTriange (local.get 0) (local.get 1) (local.get 2))
              (i32.or
                (i32.or
                  (f32.eq (local.get 0) (local.get 1))
                  (f32.eq (local.get 1) (local.get 2)))
                (f32.eq (local.get 2) (local.get 0)))))
  )

  (func (export "isScalene") (param f32 f32 f32) (result i32)
    (return (i32.and
              (call $isTriange (local.get 0) (local.get 1) (local.get 2))
              (call $allSidesDifferent (local.get 0) (local.get 1) (local.get 2))))
  )
)
