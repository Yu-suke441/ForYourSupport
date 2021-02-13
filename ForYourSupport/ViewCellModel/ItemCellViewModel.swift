//
//  ContentViewCellModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI

struct ItemCellViewModel:Identifiable {
    let id: String
    let name: String
    let icon_file: String
    let record_type: String
    let odr: Int
}
