import Foundation

/// Represents the model for the OAuth key obtained from the API.
struct OauthkeyModel: Codable {
    /// Status of the OAuth key request.
    let status: String
    
    /// The generated OAuth key.
    let oauthkey: String
    
    /// ID associated with the OAuth key.
    let id: String
    
    /// The "o_u" value associated with the OAuth key.
    let o_u: String
    
    /// Timestamp indicating when the OAuth key was created.
    let createdVNB: String
    
    /// Request type.
    let req: String
}
