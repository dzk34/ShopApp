//
//  AppStateError.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

enum AppStateError: LocalizedError {
  case noValidData

  var errorDescription: String? {
    switch self {
    case .noValidData:
      return "Something went wrong"
    }
  }

  var recoverySuggestion: String? {
    switch self {
    case .noValidData:
      return "Please try again."
    }
  }
}
