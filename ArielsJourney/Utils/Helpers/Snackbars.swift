//
//  Snackbars.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 09/09/23.
//

import UIKit
import SwiftMessages

class SnackBarHelper: NSObject {

    static let shared = SnackBarHelper()
    private override init() {}
    
    enum ToastMessagesTheme {
        case success
        case error
    }
    
    func showSuccessMessage(title: String, message: String, duration: TimeInterval = 1.5) {
        showMessage(title: title, message: message, duration: duration, type: .success)
    }
    
    func showErrorMessage(title: String, message: String, duration: TimeInterval = 1.5) {
        showMessage(title: title, message: message, duration: duration, type: .error)
    }
    
    func showMessage(title: String, message: String, duration: TimeInterval, type: ToastMessagesTheme) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden = true
        view.configureContent(title: title, body: message)
        
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        config.duration = .seconds(seconds: duration)
        config.presentationStyle = .bottom
        config.preferredStatusBarStyle = .lightContent
        
        switch type {
        case .success:
            view.configureTheme(.success)
            
        case .error:
            view.configureTheme(.error)
        }
        
        SwiftMessages.show(config: config, view: view)
    }
    
    func showToast(message: String) {
        let view = MessageView.viewFromNib(layout: .statusLine)
        view.button?.isHidden = true
        view.configureContent(title: "", body: message)
        view.backgroundColor = .systemTeal
        view.titleLabel?.tintColor = .white
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .bottom
        config.duration = .forever
       
        view.id = "toast"
        
        SwiftMessages.show(config: config, view: view)
    }
    
    func hideToast() {
        SwiftMessages.hide(id: "toast")
    }
    
}

