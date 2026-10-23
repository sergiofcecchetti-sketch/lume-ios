import ActivityKit
import Foundation

struct LumeAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable {
        var status: String
        var interval: ClosedRange<Date>
    }
    var title: String
}
