import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {
}

struct LinkedListFixture {
    static var randomRange: Range<Int> {
        0..<100
    }
    
    var randomNumber: Int {
        Int.random(in: Self.randomRange)
    }
    
    var bogusNumber: Int {
        9999
    }
    
    func randomNumbers(count: Int = 10,
                       range: Range<Int> = Self.randomRange) -> [Int] {
        var working = [Int]()
        for _ in 0..<count {
            working.append(randomNumber)
        }
        return working
    }
}
