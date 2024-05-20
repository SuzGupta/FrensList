//
//  UpdateEditFormViewModel.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 5/20/24.
//

import SwiftUI
import UIKit

@Observable
class UpdateEditFormViewModel {
  var label: String = ""
  var photo: Data?

  var fren: FrenModel?

  var image: Image? {
    if let uiImage = UIImage(data: self.photo!) {
      return Image(uiImage: uiImage)
    } else {
      return Constants.placeholder
    }
  }

  init() {}
  init(fren: FrenModel) {
    self.fren = fren
    self.label = fren.label
    self.photo = fren.photo
  }

  @MainActor
  func clearPhoto() {
    photo = nil
  }

  var isUpdating: Bool { fren != nil }
  var isDisabled: Bool { label.isEmpty }

}
