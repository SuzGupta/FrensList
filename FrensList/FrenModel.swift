//
//  FrenModel.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 3/29/24.
//

import SwiftData
import SwiftUI
import UIKit

// "we've decorated this with the at-Model macro for SwiftData"
// (learning Stewart's lingo)

@Model
class FrenModel {
// Stewart has a different approach for getting an ID that's introduced later
//  let id: UUID
  var name: String
  // the Attribute(.externalStorage) means we want Xcode to decide where to store the data
  @Attribute(.externalStorage) var data: Data?

  var image: UIImage? {
    if let data {
      return UIImage(data: data)
    } else {
      return nil
    }
  }

  init(name: String, data: Data? = nil) {
    self.name = name
    self.data = data
  }
}

extension FrenModel {
  @MainActor
  static var previewContainer: ModelContainer {
    let container = try! ModelContainer(for: FrenModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

    let imageNamesAndLabels = [
      ("piper-mcpaw", "Piper McPaw"),
      ("baxter-beaumont", "Baxter Beaumont"),
      ("charlie-ledger", "Charlie Ledger"),
      ("oliver-sterling", "Oliver Sterling"),
      ("winston-fetcher", "Winston Fetcher")
    ]

    // Load the UIImage from the asset catalog

    // I think this should still work but may need to rewatch Stewart's DataModel and View Setup at 7:06
  // https://youtu.be/T7wf4DGPCHs?si=ngEL0u_EUDeZN485
    
    for (image, name) in imageNamesAndLabels {
      if let image = UIImage(named: image), let imageData = image.pngData() {
        let newFren = FrenModel(name: name, data: imageData)
        container.mainContext.insert(newFren)
      } else {
        print("Failed to load image or convert data for \(name)")
      }
    }

    return container
  }
}
