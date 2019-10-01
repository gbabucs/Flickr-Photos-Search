//
//  EndPoint.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation
import Alamofire

protocol EndPoint {
    var baseURL: String { get }
    var httpMethod: HTTPMethod { get }
    var relativeURL: String { get }
}
