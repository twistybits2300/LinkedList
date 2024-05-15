import Foundation

extension ClassLinkedList: Equatable where T: Equatable {
    public static func ==(left: ClassLinkedList, right: ClassLinkedList) -> Bool {
        guard let leftHead = left.head,
              let rightHead = right.head
        else {
            return false
        }
        
        return leftHead == rightHead
    }
}
