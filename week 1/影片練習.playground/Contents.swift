

//challenge 1
let dogAge = 6
let isAdultAge = 3
dogAge > isAdultAge

//challenge 2
let student = "hsiao"
let author = "Matt Galloway"
let authorIsStudent = student == author

//challenge 3
let studentBeforeAuthor = student < author

//ep6-challenge 1
if dogAge >= 3 && dogAge <= 7 {
    print("Teenager")
} else {
    print("Not a teenager")
}

//ep6-challenge 2
let teenagerName = dogAge >= 3 && dogAge <= 7 ? "Q" : "Not Q!"
print(teenagerName)

//ep8-challenge 1
let hasAllergies = true
var dogName: String?
dogName = hasAllergies /*== true*/ ? nil : "Mango"

//ep8-challenge 2
let parsedInt = Int("10")

//ep8-challenge 3
let newParsedInt = Int("cat")

//ep12-challenge  1
let specialData = (1, 1, 2020, "元旦")

//ep12-challenge  2
let namedSpecialData = (month: 1, day: 1, year: 2020, description: "元旦")

//ep12-challenge  3
let (_, day, _, description) = namedSpecialData
day
description

//ep12-challenge  4
var anotherDate = (month: 5, day: 1, year: 2020, name: "Labor Day")
anotherDate.day = 10
anotherDate

//ep15-challenge  1
var players = ["Alice", "Bob", "Dan", "Eli", "Frank"]
players.count
players.contains("Charles")
players.first
players.last

//ep15-challenge  2
players.insert("Charles", at: 2)
players += ["Gloria", "Hermione"]

//ep15-challenge  3
let teamOne = Array(players[4...7])
teamOne

//ep19-challenge 1
var count = 0
while count < 10 {
    print("Counting up: \(count)")
    count += 1
}
count

//ep19-challenge 2
repeat {
    print("Counting down: \(count)")
    count -= 1
} while count > 0 //count >= 1 or count != 0

//ep19-challenge 3
var rollCount = 0
var roll = 0
repeat {
    roll = Int.random(in: 1...6)
    rollCount += 1
    print("Roll \(rollCount) gives you a \(roll)")
} while roll != 6

//ep21-challenge 1
for i in 1...100 where i % 5 == 0 {
    print("\(i)")
}

//ep21-challenge 2
let rangeStart = 10
for rangeValue in rangeStart..<rangeStart + 3 {
    print("Range value is \(rangeValue)")
}

//ep21-challenge 3
var randomCount = Int.random(in: 1...5)
for _ in 1...randomCount {
    print("hsiao")
}

//ep23-challenge  1
var pastries: [String] = ["cookie", "danish", "cupcake", "donut", "pie", "brownie", "fritter", "cruller"]
for pastry in pastries {
    if pastry[pastry.startIndex] == "c" {
        print("\(pastry)")
    }
}

//ep23-challenge  2
for pastry in pastries where pastry[pastry.startIndex] == "c" {
        print("\(pastry)")
}

//ep23-challenge  1
for _ in 1...5 {
    for _ in 1...10 {
        print ("*", terminator: "")
    }
    print("")
}

//ep23-challenge  2
var pastries2: [String] = ["cookie", "danish", "cupcake", "donut", "pie", "brownie", "fritter", "cruller"]
for pastry in pastries2 {
    if pastry.count > 5 {
        continue
    }
    print("\(pastry)")
}

//ep23-challenge  3
let daysOfTheWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
for day in daysOfTheWeek {
    if day == "Sunday" {
        continue
    }
    if day == "Saturday" {
        break
    }
    print("\(day)")
}

/*另一種寫法
for day in daysOfTheWeek {
    if day == "Sunday" {
        continue
    }
    print("\(day)")
    if day == "Friday" {
        break
    }
}
*/

//ep30-challenge  1
var data = [
    "name" : "ABC",
    "profession" : "student",
    "country" : "Taiwan",
    "city" : "Taipei"
]

//ep30-challenge  2
data["country"] = "USA"
data["city"] = "Cleveland"
data["state"] = "Ohio"
print("\(data)")

//ep30-challenge  3
data["city"] = nil
data.removeValue(forKey: "state")
print(data)

//ep30-challenge  4
for (key, value) in data {
    print("\(key) = \(value)")
}

//ep32-challenge  0
var mythicalPets: Set<String> = [
    "Owl",
    "Luggage",
    "Hammer",
    "Toothless",
    "Flying Nimbus"
]

var animalPets = Set<String>()
animalPets.insert("Mango")
animalPets.insert("Tiger")
animalPets.insert("Toothless")
animalPets.insert("Owl")

//ep32-challenge  1
print(mythicalPets.union(animalPets))

//ep32-challenge  2
print(mythicalPets.intersection(animalPets))

//ep32-challenge  3
let removedPet = animalPets.remove("Mango")

//ep32-challenge  4
mythicalPets.formUnion(animalPets)
print(mythicalPets)

//ep37-challenge 1
func printFullName(_ firstName: String, _ lastName: String) {
    print(firstName + "" + lastName)
}
printFullName("H.W.", "Hsiao")

//ep37-challenge 2
func calculateFullName(_ firstName: String, _ lastName: String) -> String {
    firstName + "" + lastName
}
let myName = calculateFullName("H.W.", "Hsiao")

//ep39-challenge 1
struct Student {
    let firstName: String
    let lastName: String
    var grade: Int
}

struct Classroom {
    var subject: String
    var students: [Student]
    func getHighestGrade() -> Int? {
        var grade = [Int]()
        for student in students {
            grade.append(student.grade)
        }
        return grade.max()
    }
}

//ep39-challenge 2
let aClassroom = Classroom(subject: "Math", students: [
    Student(firstName: "A", lastName: "a", grade: 84),
    Student(firstName: "B", lastName: "b", grade: 90),
    Student(firstName: "C", lastName: "c", grade: 68)
])

aClassroom.getHighestGrade()

//ep41-challenge 1
//struct Student {
//    let name: String
//    var grade: Int
//    var pet: String?
//
//    func getPassStatus(lowestPass: Int = 50) -> Bool {
//        grade >= lowestPass
//    }
//
//    mutating func earnExtraCredit() {
//        grade += 10
//    }
//}

class Student1 {
    let name: String
    var grade: Int
    var pet: String?
    
    init(name: String, grade: Int, pet: String?) {
        self.name = name
        self.grade = grade
        self.pet = pet
    }
    
    func getPassStatus(lowestPass: Int = 50) -> Bool {
        grade >= lowestPass
    }
    
    func earnExtraCredit() {
        grade += 10
    }
}

let chris = Student1(name: "Chris", grade: 49, pet: "Mango")

