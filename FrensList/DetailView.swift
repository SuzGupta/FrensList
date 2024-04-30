//
//  DetailView.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 4/29/24.
//

import SwiftData
import SwiftUI

struct DetailView: View {
  @Environment(\.modelContext) private var modelContext
  let fren: FrenModel

    var body: some View {
      VStack {
        fren.image?
          .resizable()
          .scaledToFit()
//          .frame(width: 50, height: 50)
        ?? Image(systemName: "photo")
          .resizable()
          .scaledToFit()
        Text(fren.label)
      }
    }
}

//#Preview {
//    DetailView()
//}
