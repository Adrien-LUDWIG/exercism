pub fn is_armstrong_number(num: u32) -> bool {
    v2(num)
}

// With n the number of digits

// Compute: O(n^2)
// Memory: O(1)
pub fn v1(num: u32) -> bool {
    let mut reminder = num;
    let mut digits_count = 0;

    while reminder != 0 {
        digits_count += 1;
        reminder /= 10;
    }

    let mut sum: Option<u32> = Some(0);
    reminder = num;

    while reminder != 0 {
        sum = sum.unwrap().checked_add((reminder % 10).pow(digits_count));

        if sum.is_none() {
            return false;
        }

        reminder /= 10;
    }

    num == sum.unwrap()
}

// Compute: O(n)
// Memory: O(n)
pub fn v2(num: u32) -> bool {
    let mut reminder = num;
    let mut digits: Vec<u32> = Vec::new();

    while reminder != 0 {
        digits.push(reminder % 10);
        reminder /= 10;
    }

    let mut sum: Option<u32> = Some(0);
    let digits_count = u32::try_from(digits.len()).unwrap();

    for digit in digits {
        sum = sum.unwrap().checked_add(digit.pow(digits_count));

        if sum.is_none() {
            return false;
        }
    }

    num == sum.unwrap()
}
