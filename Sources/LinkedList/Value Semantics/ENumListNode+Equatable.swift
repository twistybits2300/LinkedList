import Foundation

extension EnumListNode: Equatable where T : Equatable {
    public static func ==(left: EnumListNode, right: EnumListNode) -> Bool {
        return left.currentValue == right.currentValue
    }
}
