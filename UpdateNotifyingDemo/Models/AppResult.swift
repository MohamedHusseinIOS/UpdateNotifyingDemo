//
//  AppResult.swift
//  UpdateNotifyingDemo
//
//  Created by mohamed hussein on 2/24/20.
//  Copyright © 2020 Mohamed Hussein. All rights reserved.
//

import Foundation

struct AppResult: BaseModel {
    let resultCount: Int?
    let results: [App]?
}

struct App: BaseModel {
    let screenshotUrls, ipadScreenshotUrls: [String]?
    let artworkUrl512: String?
    let artistViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let supportedDevices: [String]?
    let isGameCenterEnabled: Bool?
    let kind: String?
    let features, languageCodesISO2A: [String]?
    let fileSizeBytes: String?
    let averageUserRatingForCurrentVersion: Double?
    let userRatingCountForCurrentVersion: Int?
    let trackContentRating, trackCensoredName: String?
    let trackViewURL: String?
    let contentAdvisoryRating: String?
    let releaseDate: String?
    let trackID: Int?
    let trackName: String?
    let currentVersionReleaseDate: String?
    let releaseNotes: String?
    let isVppDeviceBasedLicensingEnabled: Bool?
    let primaryGenreName: String?
    let genreIDS: [String]?
    let primaryGenreID: Int?
    let sellerName, formattedPrice, minimumOSVersion, currency: String?
    let version, wrapperType: String?
    let artistID: Int?
    let artistName: String?
    let genres: [String]?
    let price: Int?
    let resultDescription, bundleID: String?
    let averageUserRating: Double?
    let userRatingCount: Int?
}

