
//:Git & GitHub - 2.
    //git status: 檢視是否有尚未被納入追蹤的檔案(untracked files)
    //git add: 準備將檔案納入追蹤，檔案會被放進staging area
    //git commit: 撰寫清楚易辨的說明，並將staging area內的檔案納入追蹤
    //git log: 檢視commit的詳細資料，包括操作人員、時間、說明
    //git push: 將所有已commit的檔案推送至gitHub裡的repo
    //git remove -v: 檢視所有與當前repository有關的remote
    //git branch: 檢視所有分支
    //fork: 在自己的GitHub帳號內建立別人檔案的分支，在fork裡的異動不會影響擁有者的原檔案

//:Git & GitHub - 3.
    //(1)至GitHub網站點選右上角+按鈕，再點選“New repository”。完成設定後，點選“Create repository”。
    //(2)在Code頁籤內，複製https網址(網址使用於第9步驟)
    //以下在terminal內執行：
    //(3)mkdir test2
    //(4)cd test2/
    //(5)git init
    //(6)vim test2.text
    //(7)git add test2.text
    //(8)git commit -m "test two"
    //(9)git remote add origin https://github.com/hsiaoo/test2.git
    //(10)git push —set-upstream origin master

//:Basic - 1.
let pi: Double = 3.14159265359

//:Basic - 2.
let x: Int = 17
let y: Int = 26
let average = Double( x + y ) / 2.0

//:Basic - 3.
let average2 = Double( 55 + 75 ) / 2.0
 //(10 / 3)是Int型態間的運算，計算結果的型態也是Int。若沒有特別指明，(10.0 / 3.0)計算結果的型態是Double

//:Basic - 4.
var flag: Bool = true
var inputString: String = "Hello world."
let bitsInBite: Int = 8
let averageScore: Float = 86.8

//:Basic - 5.
var salary = 22000
salary += 28000

//:Basic - 6.
let a = 5
let b = 5
a == b

//:Basic - 7.
let c = 10
let d = 3
let remain = c % d

//:Basic - 8.
 //let 是常數，代表值固定不變。var 是變數，值能夠改變

//:Basic - 9.
 //為元件或方法命名時，除了第一個單字的字母小寫外，其餘單字第一個字母要大寫，例如：func startNewGame()
 //IBAction以動詞命名，IBOutlet以名詞命名
 //為UI元件命名時，最後可加上元件名稱，如：scoreLabel
//function名稱以動詞命名，func printGrade() {}，或者是以回傳值相關字命名，func amountOff() -> Int {}
//struct 接大寫開頭的單字，struct Student

//:Basic - 10.
 //型態推論。swift會根據我們賦予常數和變數的值，進一步推論它的型態，舉例來說，let x = 3.4，自動推論會得到"常數x的型態是Double"，let isOK = true，isOK的型態是Bool

//:Basic - 11.
 //第一列讓系統自動推論變數phoneNumber的型別是Int，所以第二列不能以型別String去改變phoneNumber的值

//:Collection - 1.
var myFriends = [String]()

//:Collection - 2.
myFriends += ["Ian", "Bomi", "Kevin"]

//:Collection - 3.
myFriends.append("Michael")

//:Collection - 4.
myFriends.swapAt(0, 2)

//:Collection - 5.
for name in 0...myFriends.count-1 {
    print("\(myFriends[name])")
}

//:Collection - 6.
  //不存在myFriends[5]。陣列的索引起始值是0，myFriend陣列目前只有4個名字，其最大的索引值是3，若index>3會出錯，所以沒有index 5的資料

//:Collection - 7.
myFriends.first

//:Collection - 8.
myFriends.last

//:Collection - 9.
var myCountryNumber: [String : Int] = [ : ]

//:Collection - 10.
myCountryNumber = ["US" : 1, "GB" : 44, "JP" : 81]

//:Collection - 11.
myCountryNumber["GB"] = 0
myCountryNumber

//:Collection - 12.
  //empty dictionay:  var myCountryNumber: [String : Int] = [ : ]

//:Collection - 13.
myCountryNumber.removeValue(forKey: "GB")
myCountryNumber["GB"] = nil

//:Control Flow - 1.
let lottoNumbers = [10, 9, 8, 7, 6, 5]
var count = lottoNumbers.count
for i in count-3...count-1 {
    print(lottoNumbers[i])
}

//:Control Flow - 2.1
for _ in lottoNumbers {
    print(lottoNumbers[count-1])
    count -= 1
}

//:Control Flow - 2.2
count = 6
var index = 0
for _ in lottoNumbers where index <= count-1 {
    print(lottoNumbers[index])
    index += 2
}

//:Control Flow - 3.1
count = 6
while count > 0 {
    print(lottoNumbers[count-1])
    count -= 1
}

//:Control Flow - 3.2
count = 6
index = 0
while index <= count-1 {
    print(lottoNumbers[index])
    index += 2
}


//:Control Flow - 4.1
count = 6
repeat {
    print(lottoNumbers[count-1])
    count -= 1
} while count > 0

//:Control Flow - 4.2
count = 6
index = 0
repeat {
    print(lottoNumbers[index])
    index += 2
} while index <= count-1


//:Control Flow - 5.
  //while 可能沒機會執行迴圈裡的程式，但repeat-while至少會執行一次迴圈內的程式

//:Control Flow - 6.
var isRaining = true
if isRaining == true{
    print("It's raining, I don’t want to work today.")
} else {
    print("Although it’s sunny, I still don’t want to work today.")
}

//:Control Flow - 7.
var jobLevel = 3
switch jobLevel {
case 1:
    print("Member")
case 2:
    print("Team Leader")
case 3:
    print("Manager")
case 4:
    print("Director")
default:
    print("We don't have this job.")
}

//:Function - 1.
func greet(person name: String) -> String {
    "Hello, \(name)"
}
greet(person: "Celeste")

//:Function - 2.
func multiply(a: Int, b: Int = 10) {
    print(a * b)
}
multiply(a: 5)

//:Function - 3.
  //argument label是外部參數，呼叫function時傳入的參數名稱
  //parameter name是內部參數，於宣告function內部程式碼時使用

//:Function - 4.
  //第一個是字串String，第二個是浮點數Double

