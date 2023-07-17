
module grains

  implicit none

contains

  pure double precision function square(n)
    integer, intent(in) :: n
    if (n < 1 .or. 64 < n) then
      square = -1
    else
      square = 2.0 ** (n - 1)
    end if
  end function

  ! The sum of the first n powers of 2 is equal to the n+1 power of 2 minus 1.
  pure double precision function total()
    total = (2.0 ** 64) - 1
  end function

end module
