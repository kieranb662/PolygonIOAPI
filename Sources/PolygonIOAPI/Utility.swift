// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

extension String {
    func preProcess() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    }
}
