//
//  NetworkState.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/29/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkState {
    class func isConnected() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
