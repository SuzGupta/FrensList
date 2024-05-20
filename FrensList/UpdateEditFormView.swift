//
//  UpdateEditFormView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 5/20/24.
//

import PhotosUI
import SwiftData
import SwiftUI

struct UpdateEditFormView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext
  @State var vm: UpdateEditFormViewModel
  @State private var imagePicker = ImagePicker()

  var body: some View {
    NavigationStack {
      Form {
        TextField("Who Dis?", text: $vm.label)
        VStack {
          if vm.photo != nil {
            Button("Clear Photo") {
              vm.clearPhoto()
            }
            .buttonStyle(.bordered)
          }
          PhotosPicker(selection: $imagePicker.imageSelection) {
            Label("Choose a photo to label", systemImage: "photo.badge.plus")
          }
          if let photo = vm.photo, let uiImage = UIImage(data: photo) {
            Image(uiImage: uiImage).imageStyling()
          } else {
            Constants.placeholder.imageStyling()
          }
        }
      }
      .onAppear {
        imagePicker.setup(vm)
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            if vm.isUpdating {
              if let fren = vm.fren {
                if vm.image != Constants.placeholder {
                  if let photo = vm.photo {
                    fren.photo = photo
                  }
                } else {
                  fren.photo = Data()
                }
              }
            }
          } label: {
            Text(vm.isUpdating ? "Edit" : "Add")
          }
          .disabled(vm.isDisabled)
        }
      }
    }
  }
}

#Preview {
  UpdateEditFormView(vm: UpdateEditFormViewModel())
}
