//
//  FrenModel.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 3/29/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class FrenModel {
  let id: UUID
  var label: String
  @Attribute(.externalStorage) var photo: Data

  var image: Image? {
    if let uiImage = UIImage(data: self.photo) {
      return Image(uiImage: uiImage)
    }
    return nil
  }

  init(id: UUID = UUID(), label: String, photo: Data) {
    self.id = id
    self.label = label
    self.photo = photo
  }
}

extension FrenModel {
  @MainActor
  static var previewContainer: ModelContainer {
    let container = try! ModelContainer(for: FrenModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
  }
}
