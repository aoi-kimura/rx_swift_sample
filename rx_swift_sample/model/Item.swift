//
//  Item.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/13.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import Foundation

struct Item: Codable {
    
    let renderedBody: String
    let body: String
    let coediting: Bool
    let commentCount: Int
    let createdAt: String
    let group: Group?
    let id: String
    let likesCount: Int
    let isPrivate: Bool
    let reactionsCount: Int
    let tags: [Tag]
    let title: String
    let updatedAt: String
    let url: String
    let user: User
    let pageViewsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case renderedBody = "rendered_body"
        case body
        case coediting
        case commentCount = "comments_count"
        case createdAt = "created_at"
        case group
        case id
        case likesCount = "likes_count"
        case isPrivate = "private"
        case reactionsCount = "reactions_count"
        case tags
        case title
        case updatedAt = "updated_at"
        case url
        case user
        case pageViewsCount = "page_views_count"
    }
}

struct Group: Codable {
    
    let createdAt: String
    let id: Int
    let name: String
    let isPrivate: Bool
    let updatedAt: String
    let urlName: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case name
        case isPrivate = "private"
        case updatedAt = "updated_at"
        case urlName = "url_name"
    }
}

struct Tag: Codable {
    let name: String
    let versions: [String]
}

struct User: Codable {
    
    let description: String?
    let faceBookId: String?
    let followeesCount: Int
    let followersCount: Int
    let githubLoginName: String?
    let id: String
    let itemsCount: Int
    let linkedInId: String?
    let location: String?
    let name: String
    let organization: String?
    let permanentId: Int
    let profileImageUrl: String
    let teamOnly: Bool
    let twitterScreenName: String?
    let websiteUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case faceBookId = "facebook_id"
        case followeesCount = "followees_count"
        case followersCount = "followers_count"
        case githubLoginName = "github_login_name"
        case id
        case itemsCount = "items_count"
        case linkedInId = "linkedin_id"
        case location
        case name
        case organization
        case permanentId = "permanent_id"
        case profileImageUrl = "profile_image_url"
        case teamOnly = "team_only"
        case twitterScreenName = "twitter_screen_name"
        case websiteUrl = "website_url"
    }
}
