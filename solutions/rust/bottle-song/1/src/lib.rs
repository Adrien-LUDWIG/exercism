use std::collections::HashMap;

fn verse(bottles_count: u32) -> String {
    let integer_to_text: HashMap<u32, &str> = HashMap::from([
        (0, "no"),
        (1, "One"),
        (2, "Two"),
        (3, "Three"),
        (4, "Four"),
        (5, "Five"),
        (6, "Six"),
        (7, "Seven"),
        (8, "Eight"),
        (9, "Nine"),
        (10, "Ten"),
    ]);

    let before = integer_to_text.get(&bottles_count).unwrap();
    let after = integer_to_text
        .get(&(bottles_count - 1))
        .unwrap()
        .to_lowercase();
    let before_plural = if bottles_count == 1 { "" } else { "s" };
    let after_plural = if (bottles_count - 1) == 1 { "" } else { "s" };

    format!(
        "{before} green bottle{before_plural} hanging on the wall,
{before} green bottle{before_plural} hanging on the wall,
And if one green bottle should accidentally fall,
There'll be {after} green bottle{after_plural} hanging on the wall."
    )
}

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let end_bottles = start_bottles - take_down + 1;
    let verses: Vec<String> = (end_bottles..=start_bottles)
        .rev()
        .map(|bottles_count| verse(bottles_count))
        .collect();
    verses.join("\n\n")
}
