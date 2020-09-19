
//: Object-Oriented Swift - 1.
class Animal {
    enum Gender {
        case male
        case female
        case undefined
    }
    let gender: Gender
    init(gender: Gender) {
        self.gender = gender
    }
    func eat() {
        print("I eat everything!")
    }
}

let animal = Animal(gender: .female)
animal.eat()

//: Object-Oriented Swift - 2.
class Elephant: Animal {
    override func eat() {
        print("I eat roots, grasses and fruits.")
    }
}
let elephant = Elephant(gender: .female)

class Tiger: Animal {
    override func eat() {
        print("I eat meat.")
    }
}
let tiger = Tiger(gender: .female)

class Horse: Animal {
    override func eat() {
        print("I eat grass and hay.")
    }
}
let horse = Horse(gender: .male)

//: Object-Oriented Swift - 3.
class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger(gender: .female))
zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

//: Object-Oriented Swift - 4.
  //Struct是value type，Class是reference type
  //Class可以繼承(inherit)另一個類別，但Struct沒辦法

//: Object-Oriented Swift - 5.
  //instance method：必須生成實體，才能透過實體使用方法
  //type method：不需生成實體也可直接呼叫方法

//: Object-Oriented Swift - 6.
  //生成實體時，為實體內的屬性設置初始值

//: Object-Oriented Swift - 7.
  //self代表實體本身，或者型別本身
  //若屬性名稱等於參數名稱，self也會用來區分「屬性」與「參數」，如：self.name = name

//: Object-Oriented Swift - 8.
  //value type：複製A到B身上，A和B現在有一模一樣的資料，但事實上是各自獨立兩個不同的個體，即使改變A值，也不會影響B值，如：structure
  //reference type：A和B指向同一件事，改變A值就是改變B值，如：class

//: Enumerations and Optionals in Swift - 1.1
enum Gasoline1 {
    case oil92
    case oil95
    case oil98
    case diesel
}

//: Enumerations and Optionals in Swift - 1.2
enum Gasoline2 {
    case oil92
    case oil95
    case oil98
    case diesel
    
    func getPrice(myGasoline: Gasoline2) {
        switch myGasoline {
        case .oil92:
            print("Price of \(myGasoline) is 135.")
        case .oil95:
            print("Price of \(myGasoline) is 160.")
        case .oil98:
            print("Price of \(myGasoline) is 155.")
        case .diesel:
            print("Price of \(myGasoline) is 200.")
        }
    }
}

let myGasoline = Gasoline2.diesel
myGasoline.getPrice(myGasoline: .diesel)

//: Enumerations and Optionals in Swift - 1.3
enum Gasoline3: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
}

let myGasoline2 = Gasoline3.oil92.rawValue
print(myGasoline2)

//: Enumerations and Optionals in Swift - 1.4
  //在enum裡的每個成員後設定associated value的型別，當enum成員指派給常數或變數後，才需要根據型別設定這些associated value

//: Enumerations and Optionals in Swift - 2.1
class Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class People {
    var pet: Pet?
}

//: Enumerations and Optionals in Swift - 2.2
let john = People()
john.pet = .init(name: "Bubble")

func getPetName() {
    guard let petName = john.pet?.name else { return }
    print(petName)
}

getPetName()
john.pet?.name = "Abby"
getPetName()

//: Enumerations and Optionals in Swift - 2.3
let jessie = People()
jessie.pet = .init(name: "Dudu")
jessie.pet?.name = "Momo"

if let petName = jessie.pet?.name {
    print(petName)
} else {
    print("jessie doesn't have a pet.")
}

//: Protocol in Swift
protocol PoliceMan {
    func arrestCriminals()
}

struct Person: PoliceMan {
    func arrestCriminals() {
        print("Criminals were placed under arrest.")
    }
    let name: String
    let toolMan: ToolMan
}

protocol ToolMan {
    func fixComputer()
}

struct Engineer: ToolMan {
    func fixComputer() {
        print("Computer fixed!")
    }
}

let tom = Engineer()
let steven = Person(name: "Steven", toolMan: tom)

//: Error Handling in Swift
enum GuessNumberGameError: Error {
    case wrongNumber
}

class GuessNumerGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}

let guess = GuessNumerGame()
do {
    try guess.guess(number: 20)
} catch is GuessNumberGameError {
    print("wrong")
}
