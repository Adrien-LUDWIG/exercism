pub fn reverse(input: &str) -> String {
    v1(input)
}

fn v1(input: &str) -> String {
    input.chars().rev().collect()
}
