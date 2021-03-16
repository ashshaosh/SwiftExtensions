//  Extensions.swift
//
//  Created by Ashshaosh on 2021/03/16.
//  Copyright © 2021 Ashshaosh. All rights reserved.
//
import Foundation
import UIKit

//MARK: - Array - Remove duplicates (2017 Stefano Frosoni©)
extension Array where Element:Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for (key, value) in self.enumerated() {
            if result.contains(value) {
                self.remove(at: key)
            } else {
                result.append(value)
            }
        }
    }
}

//MARK: - Array - deep copy of array
extension Array where Element: Copyng {
  public func deepCopy() -> [Element]{
    return map { $0.copy() }
  }
}

//MARK: - String - email validation
extension String {
  var isValidEmail: Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A_Z0-9.-]+\\.[A-za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: self)
  }
}

// // MARK: - UIView - 
// extension UIView {
//   @objc func imageWasSaved(_ image: UIImage, error: Error?, context: UnsafeMutableRawPointer) {
//     if let error = error {
//       print(error.localizedDescription)
//       return
//     }
    
//     print("Image was saved in the photo gallery")
//     UIApplication.shared.open(URL(string:"photos-redirect://")!)
//   }
  
//   func takeScreenshot(of view: UIView) {
//     UIGraphicsBeginImageContextWithOptions(
//       CGSize(width: view.bounds.width, height: view.bounds.height),
//       false,
//       2
//     )
    
//     view.layer.render(in: UIGraphicsGetCurrentContext()!)
//     let screenshot = UIGraphicsGetImageFromCurrentImageContext()!
//     UIGraphicsEndImageContext()
    
//     UIImageWriteToSavedPhotosAlbum(screenshot, self, #selector(imageWasSaved), nil)
//   }
// }

//MARK: - Custom operator example
prefix operator +++
extension Numeric  {
  static prefix func +++ (num: inout Self) -> Self {
    num += num
    return num
  }
}