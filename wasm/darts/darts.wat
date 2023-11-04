(module
  (global $innerCircleRadius f32 (f32.const 1.0))
  (global $middleCircleRadius f32 (f32.const 5.0))
  (global $outerCircleRadius f32 (f32.const 10.0))

  (global $innerCirclePoints i32 (i32.const 10))
  (global $middleCirclePoints i32 (i32.const 5))
  (global $outerCirclePoints i32 (i32.const 1))
  (global $outsideTargetPoints i32 (i32.const 0))

  (func $norm (param $x f32) (param $y f32) (result f32)
    (f32.sqrt
      (f32.add 
        (f32.mul (local.get $x) (local.get $x))
        (f32.mul (local.get $y) (local.get $y))))
  )

  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $distance f32)

    (local.set $distance (call $norm (local.get $x) (local.get $y)))

    (if (f32.le (local.get $distance) (global.get $innerCircleRadius))
      (then (return (global.get $innerCirclePoints))))

    (if (f32.le (local.get $distance) (global.get $middleCircleRadius))
      (then (return (global.get $middleCirclePoints))))

    (if (f32.le (local.get $distance) (global.get $outerCircleRadius))
      (then (return (global.get $outerCirclePoints))))

    (return (global.get $outsideTargetPoints))
  )
)
