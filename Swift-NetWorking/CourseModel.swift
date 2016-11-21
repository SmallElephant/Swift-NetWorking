//
//  CourseModel.swift
//  Swift-NetWorking
//
//  Created by FlyElephant on 16/11/21.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit
import HandyJSON

class Chapter: HandyJSON {
    var code: String?
    var info: String?
    var image: String?
    var core_bg_img: String?
    var improvement_bg_img: String?
    var homework_bg_img: String?
    var chapter_url: String?
    required public init() {}
    
    func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &info, converter: { (rawString) -> String in
            return rawString
        })
    }
}

class Theme: HandyJSON {
    var code: String?
    var chapters: [Chapter]?
    required init() {}
}

class Course: HandyJSON {
    var romanization_label: String?
    var native_character_label: String?
    var themes: [Theme]?
    
    required init() {}
}
