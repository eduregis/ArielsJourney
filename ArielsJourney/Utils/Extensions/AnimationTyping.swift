//
//  AnimationTyping.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 05/09/23.
//

import UIKit

extension UILabel {
    
    struct Holder {
        static var _typingMode: Bool = false
    }
    
    var typingMode:Bool {
        get {
            return Holder._typingMode
        }
        set(newValue) {
            Holder._typingMode = newValue
        }
    }
    
    func setTyping(text: String, characterDelay: TimeInterval = 2.0, completion: @escaping () -> Void) {
        
        self.text = ""
        self.typingMode = true
        
        let writingTask = DispatchWorkItem { [weak self] in
            text.forEach { char in
                if (self?.typingMode == true) {
                    DispatchQueue.main.async {
                        self?.text?.append(char)
                    }
                } else {
                    return
                }
                Thread.sleep(forTimeInterval: characterDelay/100)
            }
            completion()
        }
        
        let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
        queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
    
    func setTypingAttributed(newText: NSMutableAttributedString, characterDelay: TimeInterval = 2.0, completion: @escaping () -> Void) {
        setTypingAttributed(newText: newText, characterDelay: characterDelay, typeLetterCompletion: {}, endCompletion: completion)
    }
    
    func setTypingAttributed(newText: NSMutableAttributedString, characterDelay: TimeInterval = 2.0, typeLetterCompletion: @escaping () -> Void, endCompletion: @escaping () -> Void) {
        
        self.typingMode = true
        
        let writingTask = DispatchWorkItem { [weak self] in
            for i in 0...newText.length {
                if (self?.typingMode == true) {
                    DispatchQueue.main.async {
                        let str: NSAttributedString = newText.attributedSubstring(from: NSRange(location: 0, length: i))
                        self?.attributedText = str
                        typeLetterCompletion()
                    }
                } else {
                    return
                }
                Thread.sleep(forTimeInterval: characterDelay/100)
            }
            endCompletion()
        }
        
        let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
        queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
