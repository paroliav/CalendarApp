//
//  ScreenshotHelper.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation
import XCTest

func takeScreenshot() {
    let windowScreenshot = calendarApp.windows.firstMatch.screenshot()
    if let data = windowScreenshot.image.jpegData(compressionQuality: 0.8) {
        let filename = getDocumentsDirectory().appendingPathComponent("final.png")
        try? data.write(to: filename)
    }

}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
