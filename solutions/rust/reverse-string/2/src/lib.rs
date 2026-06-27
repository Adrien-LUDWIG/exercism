use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    v2(input)
}

fn v1(input: &str) -> String {
    input.chars().rev().collect()
}

fn v2(input: &str) -> String {
    input.graphemes(true).rev().collect()
}
