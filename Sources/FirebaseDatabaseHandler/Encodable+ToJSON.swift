import Foundation

extension Encodable {
    func toJSON() throws -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(self)
        return try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
    }
}
