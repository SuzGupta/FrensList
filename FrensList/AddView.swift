//
//  AddView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 4/29/24.
//

import PhotosUI
import SwiftUI

struct AddView: View {
  @State private var pickerItem: PhotosPickerItem?
  @State private var selectedImage: Image?
  var body: some View {
    VStack {
      PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
      selectedImage?
        .resizable()
        .scaledToFit()
    }
    .onChange(of: pickerItem) {
      Task {
        selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
      }
    }
  }
}

#Preview {
  AddView()
}
