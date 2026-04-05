fn main() {
    println!("Hello, world!");
}

#[cfg(test)]
mod tests {
    #[test]
    fn test_empty() {
        assert_eq!(true, true);
    }
}
