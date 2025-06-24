//
//  AppStateError.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

enum AppStateError: LocalizedError {
  case someError

  var errorDescription: String? {
    switch self {
    case .someError:
      return "Something went wrong"
    }
  }

  var recoverySuggestion: String? {
    switch self {
    case .someError:
      return "Please try again."
    }
  }
}
