import Foundation

/// Represents the model for the session key obtained from the API.
struct SessKeyModel: Codable {
    /// Status of the session key request.
    let status: String
    
    /// The obtained session key.
    let sesskey: String?
    
    /// ID associated with the session key.
    let id: String?
    
    /// Timestamp indicating when the session key was created.
    let createdVNB: String?
    
    /// Request type.
    let req: String?
}
