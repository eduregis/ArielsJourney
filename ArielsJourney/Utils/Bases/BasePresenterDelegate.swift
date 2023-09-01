//
//  BasePresenterDelegate.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

protocol BasePresenterDelegate where Self: UIViewController {
    func showLoader()
    func hideLoader()
    func showMessage(_ message: String, okAction: (() -> Void)?, cancelAction: (() -> Void)?)
}
