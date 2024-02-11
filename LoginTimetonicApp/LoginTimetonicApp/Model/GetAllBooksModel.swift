//
//  GetAllBooksModel.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 7/02/24.
//
import Foundation

struct GetAllBooksModel: Codable {
    let status: String
    let sstamp: Int
    let allBooks: AllBooks
    let createdVNB: String
    let req: String
}

struct AllBooks: Codable {
    let nbBooks: Int
    let nbContacts: Int
    let contacts: [Contact]
    let books: [Book]
}

struct Contact: Codable {
    let u_c: String
    let lastName: String
    let firstName: String
    let sstamp: Int
    let isConfirmed: Bool
}

struct Book: Codable {
    let invited: Bool
    let accepted: Bool
    let archived: Bool
    let showFpOnOpen: Bool
    let sstamp: Int
    let del: Bool
    let hideMessage: String
    let hideBookMembers: String
    let description: String?
    let defaultTemplate: String
    let isDownloadable: Bool
    let canDisableSync: Bool
    let b_c: String
    let b_o: String
    let cluster: String
    let tags: String?
    let langs: String?
    let contact_u_c: String?
    let nbNotRead: Int
    let nbMembers: Int
    let members: [Member]
    let fpForm: FpForm
    let lastMsg: LastMsg
    let nbMsgs: Int
    let userPrefs: UserPrefs
    let ownerPrefs: OwnerPrefs
    let sbid: Int
    let lastMsgRead: Int
    let lastMedia: Int
    let favorite: Bool
    let order: Int
}

struct Member: Codable {
    let u_c: String
    let invite: String
    let right: Int
    let access: Int
    let hideMessage: String
    let hideBookMembers: String
    let apiRight: String
}

struct FpForm: Codable {
    let fpid: Int
    let name: String
    let lastModified: Int
}

struct LastMsg: Codable {
    let smid: Int
    let uuid: String
    let sstamp: Int
    let lastCommentId: Int
    let msgBody: String
    let msgType: String
    let msgMethod: String
    let msgColor: String
    let nbComments: Int
    let pid: Int
    let nbMedias: Int
    let nbEmailCids: Int
    let nbDocs: Int
    let b_c: String
    let b_o: String
    let u_c: String
    let linkedRowId: String?
    let linkedTabId: String?
    let linkMessage: String
    let linkedFieldId: String?
    let msg: String
    let del: Bool
    let created: Int
    let lastModified: Int
    
}

struct UserPrefs: Codable {
    let maxMsgsOffline: Int
    let syncWithHubic: Bool
    let uCoverLetOwnerDecide: Bool
    let uCoverColor: String
    let uCoverUseLastImg: Bool
    let uCoverImg: String
    let uCoverType: String
    let inGlobalSearch: Bool
    let inGlobalTasks: Bool
    let notifyEmailCopy: Bool
    let notifySmsCopy: Bool
    let notifyMobile: Bool
    let notifyWhenMsgInArchivedBook: Bool
}

struct OwnerPrefs: Codable {
    let fpAutoExport: Bool
    let oCoverColor: String
    let oCoverUseLastImg: Bool
    let oCoverImg: String
    let oCoverType: String
    let authorizeMemberBroadcast: Bool
    let acceptExternalMsg: Bool
    let title: String
    let notifyMobileConfidential: Bool
}

