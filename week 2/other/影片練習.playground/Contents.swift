



//: Saving Data - Path
import Foundation

//方法一
  //let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)
//方法二
let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("string")
    .appendingPathExtension("txt")

stringURL.path

//: Saving Data ep4,7 - challenge
let challengeString: String = "hello"
let challengeStringURL: URL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
challengeStringURL.lastPathComponent

let challengeStringData = challengeString.data(using: .utf8)
try challengeStringData?.write(to: challengeStringURL, options: .atomic)
let savedChallengeString = try String(contentsOf: challengeStringURL)


//: Saving Data - Data
let mysteryBytes: [UInt8] = [
    240,                    159,                    152,                    184,
    240,                    159,                    152,                    185,
    0b1111_0000,   0b1001_1111,   0b1001_1000,   186,
    0xF0,                  0x9F,                  0x98,                  187
]

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)

//1.以資料生成Data
let mysteryData = Data(_: mysteryBytes)
//2.將剛才生成的Data寫進指定的URL
//預覽檔案看不到內容
try mysteryData.write(to: mysteryDataURL)
//預覽檔案看得到四隻貓的emoji
try mysteryData.write(to: mysteryDataURL.appendingPathExtension("txt"))

//1.以DataURL生成Data
let savedMysteryData = try Data(contentsOf: mysteryDataURL)
//2.將savedMysteryData放進陣列
let savedMysteryBytes = Array(savedMysteryData)
savedMysteryBytes == mysteryBytes















//:ep16 - challenge 1.
let age: Int = 27
let lifeStage: String

switch age {
case _ where age < 0:
    lifeStage = "Not born yet"
case 0...2:
    lifeStage = "Infant"
case 3...12:
    lifeStage = "Child"
case 13...19:
    lifeStage = "Teenager"
case 20...39:
    lifeStage = "Adult"
case 40...60:
    lifeStage = "Middle aged"
case _ where age > 61:
    lifeStage = "Elderly"
case let age:
    fatalError("Unaccounted for age: \(age)")
}

//:ep16 - challenge 2.
let lifeStageForName: String

switch ("John", 37) {
case (let name, ..<0):
    lifeStageForName = "\(name) is Not born yet"
case (let name, 0...2):
    lifeStageForName = "\(name) is Infant"
case (let name, 3...12):
    lifeStageForName = "\(name) is Child"
case (let name, 13...19):
    lifeStageForName = "\(name) is Teenager"
case (let name, 20...39):
    lifeStageForName = "\(name) is Adult"
case (let name, 40...60):
    lifeStageForName = "\(name) is Middle aged"
case (let name, 61...):
    lifeStageForName = "\(name) is Elderly"
case (_, let age):
    fatalError("Unaccounted for age: \(age)")
}

//:ep36 - challenge 1.
let names = ["Mary", "Tina", "John", "Tim"]
let newName = names.reduce("") {
    result, name -> String in
    return result + " " + name
}

let filteredNames = names.filter {
    $0.count > 3
}.reduce("") { result, name in
    return result + " " + name
}

//:ep36 - challenge 2.
let namesAndAges = ["Mary" : 37, "Tina" : 25, "John" : 32, "Tim" : 40, "Emma" : 16, "Alex" : 17]
let under18 = namesAndAges.filter { x, y in
    return y < 18
}

let under1818 = namesAndAges.filter {
    $0.value < 18
}

//:ep36 - challenge 3.
let adults = namesAndAges.filter {
    $0.value >= 18
}.map { nameAndAge in
    return nameAndAge.key
}

//:ep40 - challenge 1.
typealias Inches = Int

struct Pizza {
    enum Topping {
        case mushrooms
        case cheese
        case peppers
    }
    
    enum Crust {
        case thick
        case thin
    }
    
    let topping: [Topping]
    let crust: Crust
    let size: Inches
}

let myPizza = Pizza(topping: [.cheese, .mushrooms], crust: .thick, size: 12)

//:ep40 - challenge 2.
typealias Miles = Double

struct Location {
    let x: Miles
    let y: Miles
    
    func getDistance(_ location: Location) -> Miles {
        return abs(x - location.x) + abs(y - location.y)
    }
}

struct Restaurant {
    let location: Location
    var deliveryDistance: Miles
    
    func willDeliver(to location: Location) -> Bool {
        return self.location.getDistance(location) <= deliveryDistance
    }
    
    func deliveryAreaOverlaps(restaurant: Restaurant) -> Bool {
        return location.getDistance(restaurant.location) <= deliveryDistance + restaurant.deliveryDistance
    }
}

//:ep42 - challenge 1.
struct Temperature {
    var Celsius: Double {
        get {
            return (Fahrenheit - 32) / 1.8
        }
        set {
            Fahrenheit = newValue * 1.8 + 32
        }
    }
    var Fahrenheit: Double {
        didSet {
            if Fahrenheit > 100 {
                print("warning!")
            }
        }
    }
}

var temperature = Temperature(Fahrenheit: 200)
temperature.Fahrenheit
temperature.Celsius = 75

//:ep45 - challenge 1.
struct Student {
    let firstName: String
    let lastName: String
    var grade: Int
}

struct Classroom {
    let className: String
    var students: [Student]
    
    func getHighestGrade() -> Int? {
        return students.map { $0.grade }.max()
    }
}

let classroom = Classroom(className: "Swift", students: [
    Student(firstName: "AA", lastName: "aa", grade: 87),
    Student(firstName: "BB", lastName: "bb", grade: 66),
    Student(firstName: "CC", lastName: "cc", grade: 98)
])

classroom.getHighestGrade()
