//
//  ListView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 4/29/24.
//

import SwiftData
import SwiftUI

struct ListView: View {
  @Query private var frens: [FrenModel]
  var body: some View {
    VStack {
      Text("Hello, World!")
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
    }
  }
}

#Preview {
  ListView()
    .modelContainer(for: FrenModel.self, inMemory: true)
}
