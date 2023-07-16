module armstrong_numbers
   implicit none
contains

   ! Takes an integer and returns its number of digits.
   pure integer function numberOfDigits(i)
      integer, intent(in) :: i
      integer :: n

      n = i
      numberOfDigits = 1

      do while (n >= 10)
         n = n / 10
         numberOfDigits = numberOfDigits + 1
      end do
   end function

   ! Takes two integers, i and p, and returns the sum of the digits of i to the
   ! power p.
   pure integer function sumOfPowers(i, p)
      integer, intent(in) :: i
      integer, intent(in) :: p
      integer :: n

      n = i
      sumOfPowers = 0

      do while (n > 0)
         sumOfPowers = sumOfPowers + mod(n, 10)**p
         n = n / 10
      end do
   end function


   ! Takes an integer and test if it is an armstrong number.
   ! An armstrong number is equal to the sum of its digits to the power of his
   ! number of digits.
   pure logical function isArmstrongNumber(i)
      integer, intent(in) :: i

      isArmstrongNumber = sumOfPowers(i, numberOfDigits(i)) == i

   end function

end module
