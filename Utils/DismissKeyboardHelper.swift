//
//  DismissKeyboardHelper.swift
//  NotesCFT
//
//  Created by mac on 13.10.2021.
//

import UIKit

class DismissKeyboardHelper {
    static func dismissKeyboard() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.endEditing(true)
    }
}
