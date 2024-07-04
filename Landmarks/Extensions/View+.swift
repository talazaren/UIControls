//
//  View+.swift
//  Landmarks
//
//  Created by Tatiana Lazarenko on 7/4/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
