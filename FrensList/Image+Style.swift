//
//  ImageStyleModifier.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 5/20/24.
//

import SwiftUI

extension Image {
  func imageStyling() -> some View {
    self
      .resizable()
      .scaledToFit()
      .clipShape(RoundedRectangle(cornerRadius: 12.0))
      .padding()
  }
}
