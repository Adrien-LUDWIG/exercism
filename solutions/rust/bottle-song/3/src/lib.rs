const NUMBERS_TEXT: [&str; 11] = [
    "no", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
];

fn verse(bottles_count: u32) -> String {
    let before = NUMBERS_TEXT[usize::try_from(bottles_count).unwrap()];
    let after = NUMBERS_TEXT[usize::try_from(bottles_count - 1).unwrap()].to_lowercase();
    let before_plural = if bottles_count == 1 { "" } else { "s" };
    let after_plural = if (bottles_count - 1) == 1 { "" } else { "s" };

    format!(
        "{before} green bottle{before_plural} hanging on the wall,\n\
         {before} green bottle{before_plural} hanging on the wall,\n\
         And if one green bottle should accidentally fall,\n\
         There'll be {after} green bottle{after_plural} hanging on the wall."
    )
}

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let verses: Vec<String> = (0..take_down)
        .map(|take_down| verse(start_bottles - take_down))
        .collect();
    verses.join("\n\n")
}
