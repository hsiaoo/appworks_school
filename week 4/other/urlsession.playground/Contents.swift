import UIKit
import PlaygroundSupport

let json = "{ 'hello' : 'world' }"
let url2 = URL(string: "http://httpbin.org/post")!
var request = URLRequest(url: url2)

request.httpMethod = "Post"
request.httpBody = json.data(using: .utf8)

let session2 = URLSession(configuration: .default)
let task2 = session2.dataTask(with: request) {
    (data, response, error) in
    if let data = data {
        if let postResponse = String(data: data, encoding: .utf8) {
            print(postResponse)
        }
    }
}
task2.resume()






//: part 1
let configuration = URLSessionConfiguration.default
configuration.waitsForConnectivity = true
let session = URLSession(configuration: configuration)

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let task = session.dataTask(with: url) { (data, response, error) in
    guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200 else { return }
    
    guard let data = data else {
        print(error.debugDescription)
        return
    }
    
    if let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
        print(result)
    }
    PlaygroundPage.current.finishExecution()
}
task.resume()
