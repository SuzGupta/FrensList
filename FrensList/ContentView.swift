//
//  ContentView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 3/29/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  @Query(sort: \FrenModel.name) var frens: [FrenModel]
  @Environment(\.modelContext) private var modelContext

  var body: some View {
    NavigationStack {
      Group {
        if frens.isEmpty {
          ContentUnavailableView("No frens yet", systemImage: "plus", description: Text("Tap the plus button in the upper right to add your first fren!"))
        } else {
          List(frens) { fren in
            NavigationLink(value: fren) {
              HStack {
                Image(uiImage: fren.image ?? Constants.placeholder)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 50, height: 50)
                Text(fren.name)
                  .font(.title)
              }
            }
            .swipeActions {
              Button(role: .destructive) {
                modelContext.delete(fren)
                try? modelContext.save()
              } label: {
                Image(systemName: "trash")
              }
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationDestination(for: FrenModel.self) { fren in
        DetailView(fren: fren)
      }
      .navigationTitle("FrensList")
      .toolbar {
        Button { } label: {
          Image(systemName: "plus.circle.fill")
        }
      }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(FrenModel.previewContainer)
}
