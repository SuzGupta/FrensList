//
//  ModelFormType.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 5/28/24.
//

import SwiftUI

enum ModelFormType: Identifiable, View {
  case new
  case update(FrenModel)
  var id: String {
    String(describing: self)
  }
  var body: some View {
    switch self {
    case .new:
      FormView(vm: FormViewModel())
    case .update(let fren):
      FormView(vm: FormViewModel(fren: fren))
    }
  }
}
