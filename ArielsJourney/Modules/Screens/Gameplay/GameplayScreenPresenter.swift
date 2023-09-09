//
//  GameplayScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

enum GameplayAnimatedElements {
    case aboveToScreen
    case screenToBelow
    case belowToAbove
}

protocol GameplayScreenPresenterDelegate: BasePresenterDelegate {
    func animateElements(animatedDirection: GameplayAnimatedElements, completionHandler: @escaping () -> Void)
    func hideElements(isHidden: Bool)
    func flipCards()
    func setDialogueAndCards()
    func startTypingText()
}

class GameplayScreenPresenter {
    
    // MARK: - Properties
    weak var delegate: GameplayScreenPresenterDelegate?
    let router: GameplayScreenRouter
    
    var dialogue: Dialogue?
    var isNewGame: Bool?
    
    var colorsIndexes: [Int] = []
    var coloredWords: [String] = []
    var descriptionText: NSMutableAttributedString?
    
    // MARK: - Init
    init(delegate: GameplayScreenPresenterDelegate, router: GameplayScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
 
    // MARK: - Lifecycle
    func didLoad() {   
    }
    
    func willAppear() {
        var lastDialogueSaved = UserDefaults.standard.string(forKey: UserDefaults.Keys.lastDialogueSaved.description)
        if lastDialogueSaved == "" || isNewGame == true {
            lastDialogueSaved = "MC_01"
        }
        guard let dialogueModel = GameplayDialogueManager.shared.getDialogueByString(name: lastDialogueSaved ?? "") else { return }
        self.dialogue = dialogueModel
        self.delegate?.setDialogueAndCards()
    }
    
    func didAppear() {
    }
    
    // MARK: - Methods
    
    func getMovePoint(animatedDirection: GameplayAnimatedElements) -> CGPoint {
        switch animatedDirection {
        case .aboveToScreen:
            return CGPoint(x: 100, y: UIScreen.main.bounds.width)
        case .screenToBelow:
            return CGPoint(x: -100, y: UIScreen.main.bounds.width)
        case .belowToAbove:
            return CGPoint(x: 0, y: -2 * UIScreen.main.bounds.width)
        }
    }
    
    func startNewDialogue() {
        self.delegate?.animateElements(animatedDirection: .aboveToScreen, completionHandler: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                delegate?.startTypingText()
            }
        })
    }
    
    func setupDialogue(newDialogue: Dialogue) {
        self.coloredWords = self.matchesForRegexesInText(text: newDialogue.descriptionText)
        self.removeSpecialCharacters()
        var textWithoutSpecialCharacters: String = newDialogue.descriptionText
        for (char) in SpecialCharacteresToRegexText {
            textWithoutSpecialCharacters = textWithoutSpecialCharacters.filter { $0 != char.first }
        }
        self.descriptionText = self.coloringWords(text: textWithoutSpecialCharacters)
    }
    
    func coloringWords(text: String) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString.init(string: text)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                             value: UIColor(named: "ArielDark") as Any,
                                             range: (text as NSString).range(of: text))
        for (index, name) in self.coloredWords.enumerated() {
            let range = (text as NSString).range(of: name)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: RegexColors[colorsIndexes[index]], range: range)
        }
        
        return mutableAttributedString
    }
    
    func matchesForRegexInText(regex: String!, text: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func removeSpecialCharacters() {
        var newColoredWords: [String] = []
        for coloredWord in self.coloredWords {
            newColoredWords.append(String(coloredWord.dropFirst().dropLast()))
        }
        self.coloredWords = newColoredWords
    }
    
    func matchesForRegexesInText(text: String!) -> [String] {
        let regexes = ["\\{(.*?)\\}", "\\[(.*?)\\]", "\\|(.*?)\\%", "\\&(.*?)\\#"]
        var regexesResults: [String] = []
        
        self.colorsIndexes = []
        
        for (index, name) in regexes.enumerated() {
            let result = matchesForRegexInText(regex: name, text: text)
            regexesResults.append(contentsOf: result)
            self.colorsIndexes.append(contentsOf: Array(repeating: index, count: result.count))
        }
        
        return regexesResults
    }
    
    func goToNextDialogue(nextDialogueName: String) {
        
        self.delegate?.animateElements(animatedDirection: .screenToBelow, completionHandler: {
            DispatchQueue.main.async { [self] in
                delegate?.hideElements(isHidden: true)
                guard let dialogueModel = GameplayDialogueManager.shared.getDialogueByString(name: nextDialogueName) else { return }
                UserDefaults.standard.set(nextDialogueName, forKey: UserDefaults.Keys.lastDialogueSaved.description)
                dialogue = dialogueModel
                getTriggers()
                delegate?.setDialogueAndCards()
                setInitialPosition()
            }
        })
    }
    
    func setInitialPosition() {
        delegate?.animateElements(animatedDirection: .belowToAbove, completionHandler: {
            self.delegate?.hideElements(isHidden: false)
            self.startNewDialogue()
        })
    }
    
    func getTriggers() {
        guard let dialogue = self.dialogue else { return }
        let userDefaults = UserDefaults.standard
        
        if let soundTrigger = dialogue.soundTrigger, soundTrigger != "" {
            AudioManager.shared.playSoundEffect(name: soundTrigger)
        }
        
        if let achievementTrigger = dialogue.achievementTrigger, achievementTrigger != "" {
            var strings: [String] = userDefaults.stringArray(forKey: UserDefaults.Keys.achievements.description) ?? []
            if !strings.contains(achievementTrigger) {
                strings.append(achievementTrigger)
                userDefaults.set(strings, forKey: UserDefaults.Keys.achievements.description)
                SnackBarHelper.shared.showSuccessMessage(
                    title: SnackbarTexts.achievementUnlocked.localized(),
                    message: AchievementManager.shared.getAchievementByString(name: achievementTrigger))
            }
        }
        
        if let triggerArray = dialogue.triggerArray, triggerArray != [] {
            for trigger in triggerArray {
                if trigger.contains("duchbag") {
                    userDefaults.set(userDefaults.integer(forKey: UserDefaults.Keys.duchbagCounter.description) + 1, forKey: UserDefaults.Keys.duchbagCounter.description)
                } else if trigger.contains("herosJourney") {
                    let triggerSplited = trigger.components(separatedBy: "_")
                    guard let herosJourneyIndex = Int(triggerSplited[1]) else { return }
                    if herosJourneyIndex > userDefaults.integer(forKey: UserDefaults.Keys.activeHerosJourney.description) {
                        userDefaults.set(herosJourneyIndex, forKey: UserDefaults.Keys.activeHerosJourney.description)
                    }
                } else if trigger.contains("archetype") {
                    let triggerSplited = trigger.components(separatedBy: "_")
                    guard let archetypeIndex = Int(triggerSplited[1]) else { return }
                    if archetypeIndex > userDefaults.integer(forKey: UserDefaults.Keys.activeArchetypes.description) {
                        userDefaults.set(archetypeIndex, forKey: UserDefaults.Keys.activeArchetypes.description)
                    }
                }
            }
        }
    }
    
    // MARK: - Navigation
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func navigateToHome() {
        print("Home <- Gameplay")
        self.router.pop(animated: true)
    }
}
