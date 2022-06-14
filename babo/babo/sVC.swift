//
//  VC.swift
//  babo
//
//  Created by 강인혜 on 2022/06/14.
//

import Foundation

struct data: Codable {
    let results: [postData]
}

struct postData: Codable {
    let title: String
    let content: String
}
