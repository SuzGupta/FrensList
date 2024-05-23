//
//  ContentView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 3/29/24.
//

import PhotosUI
import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var frens: [FrenModel]
  @State private var showAddView = false
  @State var imagePicker = ImagePicker()

  var body: some View {
    NavigationStack {
      Group {
        if !frens.isEmpty {
          List {
            ForEach(frens) {
              fren in
              NavigationLink {
                DetailView(fren: fren)
              } label: {
                HStack {
                  fren.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                  ?? Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                  Text(fren.label)
                }

              }
            }
          }
        } else {
          ContentUnavailableView("No frens yet", systemImage: "plus", description: Text("Tap the plus button in the upper right to add your first fren!"))
        }
      }
      .navigationTitle("FrensList")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          PhotosPicker(selection: $imagePicker.imageSelection) {
            Image(systemName: "plus")
          }
          .sheet(isPresented: $imagePicker.showAddView){
            AddView()
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(FrenModel.previewContainer)
}
