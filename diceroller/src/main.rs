use rand::Rng;

fn main() {
    println!("Hello, world!");
    let x =  rand::thread_rng().gen_range(1..=100);

    println!("Random number: {}", x);
}
