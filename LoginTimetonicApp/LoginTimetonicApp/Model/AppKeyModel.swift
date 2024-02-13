import Foundation

/// Represents the model for the app key obtained from the API.
struct AppKeyModel: Codable {
    /// Status of the app key request.
    let status: String
    
    /// The generated app key.
    let appkey: String
    
    /// ID associated with the app key.
    let id: String
    
    /// Timestamp indicating when the app key was created.
    let createdVNB: String
    
    /// Request type.
    let req: String
}

