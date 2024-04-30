//
//  ContentView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 3/29/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  @Query private var frens: [FrenModel]
  
  var body: some View {
    NavigationStack {
      Group {
        if !frens.isEmpty {
          List(frens) { fren in
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
        } else {
          ContentUnavailableView("No frens yet", systemImage: "plus", description: Text("Tap the plus button in the upper right to add your first fren!"))
        }
      }

        .navigationTitle("FrensList")
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            Button {
              AddView()
            } label: {
              Image(systemName: "plus")
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
