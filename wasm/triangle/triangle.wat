(module
  (func $and3 (param i32 i32 i32) (result i32)
    (return (i32.and (local.get 0) (i32.and (local.get 1) (local.get 2))))
  )

  (func $or3 (param i32 i32 i32) (result i32)
    (return (i32.or (local.get 0) (i32.or (local.get 1) (local.get 2))))
  )

  (func $isTriange (param f32 f32 f32) (result i32)
      (return (i32.and
                ;; all sides are strictly positive
                (call $and3
                  (f32.gt (local.get 0) (f32.const 0.0))
                  (f32.gt (local.get 1) (f32.const 0.0))
                  (f32.gt (local.get 2) (f32.const 0.0)))

                ;; all pairs of sides are longer or equal to the third side
                (call $and3
                  (f32.ge (f32.add (local.get 0) (local.get 1)) (local.get 2))
                  (f32.ge (f32.add (local.get 1) (local.get 2)) (local.get 0))
                  (f32.ge (f32.add (local.get 2) (local.get 0)) (local.get 1)))))
  )

  (func (export "isEquilateral") (param f32 f32 f32) (result i32)
    (return (i32.and
              (call $isTriange (local.get 0) (local.get 1) (local.get 2))

              ;; All sides are equal
              (i32.and
                (f32.eq (local.get 0) (local.get 1))
                (f32.eq (local.get 1) (local.get 2)))))
  )

  (func (export "isIsosceles") (param f32 f32 f32) (result i32)
    (return (i32.and
              (call $isTriange (local.get 0) (local.get 1) (local.get 2))

              ;; At least 2 sides are equal
              (call $or3
                  (f32.eq (local.get 0) (local.get 1))
                  (f32.eq (local.get 1) (local.get 2))
                  (f32.eq (local.get 2) (local.get 0)))))
  )

  (func (export "isScalene") (param f32 f32 f32) (result i32)
    (return (i32.and
              (call $isTriange (local.get 0) (local.get 1) (local.get 2))

              ;; All sides are different
              (call $and3
                  (f32.ne (local.get 0) (local.get 1))
                  (f32.ne (local.get 1) (local.get 2))
                  (f32.ne (local.get 2) (local.get 0)))))
  )
)
