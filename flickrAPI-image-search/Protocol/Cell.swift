//
//  Cell.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

protocol Cell: class {
    
    static var reuseIdentifier: String { get }
    
    associatedtype T
    
    func configure(with value: T)
}

extension Cell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func configure(with value: T) {}
}
