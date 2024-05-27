//
//  FormViewModel.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 5/20/24.
//

import SwiftUI
import UIKit

@Observable
class ViewModel {
  var name: String = ""
  var data: Data?

  var fren: FrenModel?

  var image: UIImage {
    if let data, let uiImage = UIImage(data: data) {
      return uiImage
    } else {
      return Constants.placeholder
    }
  }

  init() {}
  init(fren: FrenModel) {
    self.fren = fren
    self.name = fren.name
    self.data = fren.data
  }

  @MainActor
  func clearImage() {
    data = nil
  }

  var isUpdating: Bool { fren != nil }
  var isDisabled: Bool { name.isEmpty }

}
