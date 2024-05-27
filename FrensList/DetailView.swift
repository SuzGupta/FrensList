//
//  DetailView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 4/29/24.
//

// Stewart called his SampleView

import SwiftData
import SwiftUI

struct DetailView: View {
  @Environment(\.modelContext) private var modelContext
  @Environment(\.dismiss) private var dismiss

  let fren: FrenModel

    var body: some View {
      VStack {
        Image(uiImage: fren.image ?? Constants.placeholder)
          .resizable()
          .scaledToFit()
        Text(fren.name)
          .font(.title)
          .fontDesign(.rounded)
        HStack {
          Button("Edit") {}
          Button("Delete", role: .destructive) {
            modelContext.delete(fren)
            try? modelContext.save()
            dismiss()
          }
        }
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        Spacer()
      }
      .padding()
      .navigationTitle("My Fren")
      .navigationBarTitleDisplayMode(.inline)
    }
}

//TODO: get preview working

#Preview {
  Group {
    let container = FrenModel.previewContainer
    let fetchDescriptor = FetchDescriptor<FrenModel>()
    let fren = try! container.mainContext.fetch(fetchDescriptor)[0]
    // do this so any toolbars show in the preview
    return NavigationStack {DetailView(fren: fren)}
  }

}
