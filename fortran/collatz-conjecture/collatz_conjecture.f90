module collatz_conjecture
  implicit none
contains

  pure integer function steps(i)
    integer, intent(in) :: i
    integer :: n

    ! -1 represents an error
    steps = -1

    ! Check that i is strictly positive, else it is an error
    if (i <= 0) then
      return
    end if

    n = i
    steps = 0

    do while (n > 1)
      
      if (mod(n, 2) == 0) then
        n = n / 2
      else 
        n = 3 * n + 1
      end if

      steps = steps + 1

    end do

  end function

end module
