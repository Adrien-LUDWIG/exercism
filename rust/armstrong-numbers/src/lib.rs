pub fn is_armstrong_number(num: u32) -> bool {
    let mut digits: Vec<u32> = Vec::new();

    while num != 0 {
        digits.push(num % 10);
        num /= 10;
    }

    let mut sum: u32 = 0;
    let ndigits: u32 = digits.len().into();

    for digit in digits {
        sum += digit.pow(ndigits);
    }

    sum
}
