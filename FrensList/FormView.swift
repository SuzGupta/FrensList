import PhotosUI
import SwiftData
import SwiftUI

struct FormView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext
  @State var vm: FormViewModel
  @State var imagePicker = ImagePicker()
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Who dis?", text: $vm.name)
        VStack {
          if vm.data != nil {
            Button("Clear image") {
              vm.clearImage()
            }
            .buttonStyle(.bordered)
          }
          PhotosPicker(selection: $imagePicker.imageSelection) {
            Label("Photos", systemImage: "photo")
          }
            Image(uiImage: vm.image)
              .resizable()
              .scaledToFit()
              .padding()
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
                    // Stewart, why do we do this with the JPEG data?
                    fren.data = vm.image.jpegData(compressionQuality: 0.8)
//                    fren.data = vm.image

                  } else {
                    fren.data = nil
                  }
                  fren.name = vm.name
                  dismiss()
                }
              } else {
                let newFren = FrenModel(name: vm.name)
                if vm.image != Constants.placeholder {
                  newFren.data = vm.image.jpegData(compressionQuality: 0.8)
                } else {
                  newFren.data = nil
                }
                modelContext.insert(newFren)
                dismiss()
              }
            } label: {
              Text(vm.isUpdating ? "Update" : "Add")
              //              Text("testing hi!")
            }
            .disabled(vm.isDisabled)
          }
        }

      }
    }
  }
}

#Preview {
  FormView(vm: FormViewModel())
}
