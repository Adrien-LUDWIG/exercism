module leap
  implicit none

contains

  logical function is_leap_year(year)
    integer, intent(in) :: year

    is_leap_year = mod(year, 400) == 0 .or. (mod(year, 100) /= 0 .and. mod(year, 4) == 0)
  end function

end module
