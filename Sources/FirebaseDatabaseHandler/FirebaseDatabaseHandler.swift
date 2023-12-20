import Foundation
import Firebase
import FirebaseFirestore

public final class FirebaseDatabaseHandler {
    private let firestore = Firestore.firestore()
    
    public init() {}
    
    public func configure() {
        FirebaseApp.configure()
    }
    
    public func addData<T: Encodable>(
        collection: String,
        document: String,
        data: T
    ) async throws {
        guard let documentData = try data.toJSON() else { throw FirebaseDatabaseError.failed }
        try await firestore
            .collection(collection)
            .document(document)
            .setData(documentData)
    }
    
    public func updateField(
        collection: String,
        document: String,
        field: String,
        data: Any
    ) async throws {
        try await firestore
            .collection(collection)
            .document(document)
            .updateData([field: data])
    }
    
    public func getData<T: Decodable>(
        collection: String,
        document: String
    ) async throws -> T {
        return try await firestore
            .collection(collection)
            .document(document)
            .getDocument(as: T.self)
    }
}
