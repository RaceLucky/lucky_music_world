//
//  Device.swift
//  MyMusicApp
//
//  Created by Lucky on 06/12/22.
//

import Foundation
import UIKit

extension UIDevice {
    
    var hasNotch: Bool {
      var bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
      
      if bottom == 0 {
        bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
      }
      
      return bottom > 0
    }
}
