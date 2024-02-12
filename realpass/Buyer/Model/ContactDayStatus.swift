//
//  ContactDayStatus.swift
//  realpass
//
//  Created by i-Verve on 30/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import Foundation
struct DayStatus {
    var nameOFDay = String()
    var isSelect = Bool()
    var isBorder = Bool()
    var startDate = "10 : 00"
    var endDate = "19 : 00"
    
    init(nameOfDay:String,isSelect: Bool, isBorder: Bool, startDate:String,endDate:String) {
        self.nameOFDay = nameOfDay
        self.isSelect = isSelect
        self.isBorder = isBorder
        self.startDate = startDate
        self.endDate = endDate
    }
}
