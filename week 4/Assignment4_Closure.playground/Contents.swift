
let odd = { (number: Int) -> Bool in
    let result = number % 2
    if result == 0 {
        return false
    } else {
        return true
    }
}

odd(5)
