import Foundation

/// Represents the model for fetching all books from the API.
struct GetAllBooksModel: Codable {
    let status: String             /// Status of the API response.
    let sstamp: Int                /// Timestamp of the response.
    let allBooks: AllBooks         /// Contains information about all books.
    let createdVNB: String         /// Creation date of the response.
    let req: String                /// Request type.
}

/// Represents information about all books fetched from the API.
struct AllBooks: Codable {
    let nbBooks: Int               /// Number of books.
    let nbContacts: Int            /// Number of contacts.
    let contacts: [Contact]       /// Array of contacts associated with the books.
    let books: [Book]             /// Array of books.
}

/// Represents contact information.
struct Contact: Codable {
    let u_c: String                /// User ID.
    let lastName: String           /// Last name of the contact.
    let firstName: String          /// First name of the contact.
    let sstamp: Int                /// Timestamp.
    let isConfirmed: Bool          /// Confirmation status.
}

/// Represents information about a book.
struct Book: Codable {
    let invited: Bool              /// Invitation status.
    let accepted: Bool             /// Acceptance status.
    let archived: Bool             /// Archival status.
    let showFpOnOpen: Bool        /// Flag to show Fp on open.
    let sstamp: Int                /// Timestamp.
    let del: Bool                  /// Deletion status.
    let hideMessage: String        /// Hidden message.
    let hideBookMembers: String    /// Hidden book members.
    let description: String?       /// Description of the book.
    let defaultTemplate: String    /// Default template.
    let isDownloadable: Bool       /// Downloadable status.
    let canDisableSync: Bool      /// Flag to disable synchronization.
    let b_c: String                /// Book ID.
    let b_o: String                /// Book owner ID.
    let cluster: String            /// Cluster information.
    let tags: String?              /// Tags associated with the book.
    let langs: String?             /// Language information.
    let contact_u_c: String?       /// Contact user ID.
    let nbNotRead: Int             /// Number of unread messages.
    let nbMembers: Int             /// Number of members in the book.
    let members: [Member]         /// Array of members associated with the book.
    let fpForm: FpForm             /// Form information associated with the book.
    let lastMsg: LastMsg           /// Last message sent in the book.
    let nbMsgs: Int                /// Number of messages in the book.
    let userPrefs: UserPrefs       /// User preferences.
    let ownerPrefs: OwnerPrefs     /// Owner preferences.
    let sbid: Int                  /// SBID information.
    let lastMsgRead: Int           /// Last read message.
    let lastMedia: Int             /// Last media.
    let favorite: Bool             /// Favorite status.
    let order: Int                 /// Order of the book.
}

/// Represents a member of a book.
struct Member: Codable {
    let u_c: String                /// User ID.
    let invite: String             /// Invitation status.
    let right: Int                 /// Rights information.
    let access: Int                /// Access level.
    let hideMessage: String        /// Hidden message.
    let hideBookMembers: String    /// Hidden book members.
    let apiRight: String           /// API rights.
}

/// Represents form information associated with a book.
struct FpForm: Codable {
    let fpid: Int                  /// Form ID.
    let name: String               /// Form name.
    let lastModified: Int          /// Last modified timestamp.
}

/// Represents the last message sent in a book.
struct LastMsg: Codable {
    let smid: Int                  /// Message ID.
    let uuid: String               /// UUID.
    let sstamp: Int                /// Timestamp.
    let lastCommentId: Int         /// Last comment ID.
    let msgBody: String            /// Message body.
    let msgType: String            /// Message type.
    let msgMethod: String          /// Message method.
    let msgColor: String           /// Message color.
    let nbComments: Int            /// Number of comments.
    let pid: Int                   /// PID information.
    let nbMedias: Int              /// Number of media.
    let nbEmailCids: Int           /// Number of email CIDs.
    let nbDocs: Int                /// Number of documents.
    let b_c: String                /// Book ID.
    let b_o: String                /// Book owner ID.
    let u_c: String                /// User ID.
    let linkedRowId: String?       /// Linked row ID.
    let linkedTabId: String?       /// Linked tab ID.
    let linkMessage: String        /// Linked message.
    let linkedFieldId: String?     /// Linked field ID.
    let msg: String                /// Message.
    let del: Bool                  /// Deletion status.
    let created: Int               /// Creation timestamp.
    let lastModified: Int          /// Last modified timestamp.
}

/// Represents user preferences.
struct UserPrefs: Codable {
    let maxMsgsOffline: Int                /// Maximum messages offline.
    let syncWithHubic: Bool                /// Synchronization status with Hubic.
    let uCoverLetOwnerDecide: Bool         /// Flag to let owner decide user cover.
    let uCoverColor: String                /// User cover color.
    let uCoverUseLastImg: Bool             /// Flag to use last image for user cover.
    let uCoverImg: String                  /// User cover image.
    let uCoverType: String                 /// User cover type.
    let inGlobalSearch: Bool               /// Flag for global search.
    let inGlobalTasks: Bool                /// Flag for global tasks.
    let notifyEmailCopy: Bool             /// Notification status for email copy.
    let notifySmsCopy: Bool               /// Notification status for SMS copy.
    let notifyMobile: Bool                /// Mobile notification status.
    let notifyWhenMsgInArchivedBook: Bool /// Notification status when message in archived book.
}

/// Represents owner preferences.
struct OwnerPrefs: Codable {
    let fpAutoExport: Bool                 /// Auto-export status.
    let oCoverColor: String                /// Owner cover color.
    let oCoverUseLastImg: Bool             /// Flag to use last image for owner cover.
    let oCoverImg: String                  /// Owner cover image.
    let oCoverType: String                 /// Owner cover type.
    let authorizeMemberBroadcast: Bool     /// Authorization status for member broadcast.
    let acceptExternalMsg: Bool            /// External message acceptance status.
    let title: String                      /// Title.
    let notifyMobileConfidential: Bool     /// Mobile notification confidentiality status.
}
