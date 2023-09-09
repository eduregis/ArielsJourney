//
//  GameplayDialogueManager.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 04/09/23.
//

import Foundation

class GameplayDialogueManager {
    
    static var shared: GameplayDialogueManager = {
        let instance = GameplayDialogueManager()
        return instance
    }()

    private init() {}
    
    func getDialogueByString(name: String) -> Dialogue? { // lembrar de colocar um case para cada diálogo aqui também
        switch name {
        case "firstText":
            return GameplayDialogues.firstText.getDialogue()
        case "secondText":
            return GameplayDialogues.secondText.getDialogue()
        case "MC_01":
            return GameplayDialogues.MC_01.getDialogue()
        case "fourthText":
            return GameplayDialogues.fourthText.getDialogue()
        case "fifthText":
            return GameplayDialogues.fifthText.getDialogue()
        case "sixthText":
            return GameplayDialogues.sixthText.getDialogue()
        case "seventhText":
            return GameplayDialogues.seventhText.getDialogue()
        case "eighthText":
            return GameplayDialogues.eighthText.getDialogue()
        case "ninthText":
            return GameplayDialogues.ninthText.getDialogue()
        case "tenthText":
            return GameplayDialogues.tenthText.getDialogue()
        case "novoDialogo":
            return GameplayDialogues.novoDialogo.getDialogue()
        default:
            return nil
        }
    }
}

enum GameplayDialogues {
    
    case firstText, secondText, MC_01, fourthText, fifthText, sixthText, seventhText, eighthText, ninthText, tenthText, novoDialogo
    // lembrar de colocar um case para cada diálogo aqui também
    
    func getDialogue() -> Dialogue {
        switch self { // aqui vão os diálogos com escolhas
        case .firstText:
            return Dialogue(descriptionText: "(firstText) Lorem ipsum World sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            firstCardText: "Nada a ver",
                            secondCardText: "Pô, vdd",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "secondText",
                            nextSecondDialogue: "MC_01",
                            herosJourneysStage: "teste") // se não possuir parâmetro soundTrigger, ele apenas não emitirá nenhum efeito
        case .secondText:
            return Dialogue(descriptionText: "(secondText) Lorem ipsum World sit amet, |consectetur% adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut |aliquip% ex ea commodo consequat.",
                            firstCardText: "Nada a ver",
                            secondCardText: "Pô, vdd",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "MC_01",
                            nextSecondDialogue: "fourthText",
                            herosJourneysStage: "teste",
                            soundTrigger: "Ariel_soundEffect_sliderButtonReleased",
                            soundLoop: true) // aqui tem o parâmetro soundTrigger, onde vc coloca o nome do arquivo de som a ser tocado
        case .MC_01:
            return Dialogue(descriptionText: DialogueTexts.MC_01_text.localized(key: "dialogue"),
                            firstCardText: DialogueTexts.MC_01_leftCard.localized(key: "dialogue"),
                            secondCardText: DialogueTexts.MC_01_rightCard.localized(key: "dialogue"),
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "fourthText",
                            nextSecondDialogue: "fifthText",
                            herosJourneysStage: "Teste",
                            achievementTrigger: "prodigy") // caso chegar nesse Dialogue implique em ativar um achievement, é só colocar o nome do achievement nesse parâmetro. Caso não tenha achievement basta não colocar esse parâmetro
        case .fourthText:
            return Dialogue(descriptionText: "(fourthText) Lorem ipsum [World] sit amet, consectetur |adipiscing elit%, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut &aliquip# ex ea commodo consequat.",
                            firstCardText: "Nada a ver",
                            secondCardText: "Pô, vdd",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "fifthText",
                            nextSecondDialogue: "sixthText",
                            herosJourneysStage: "Teste",
                            triggerArray: ["duchbag+1"]) // caso precise aumentar o indice de duchbag, só chamar esse parâmetro com "duchbag+1", o parâmetro assim como o achievementTrigger, é opcional
        case .fifthText:
            return Dialogue(descriptionText: "(fifthText) Sed ut perspiciatis [unde] omnis iste natus error sit [voluptatem] accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi [architecto] beatae vitae dicta sunt explicabo.",
                            firstCardText: "Tá zoando",
                            secondCardText: "Pode crer",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "sixthText",
                            nextSecondDialogue: "seventhText",
                            herosJourneysStage: "Teste",
                            achievementTrigger: "bestEnd",
                            triggerArray: ["herosJourney_1"]) // caso chegar nesse Dialogue implique em desbloquear um colecionável relativo a Jornada do Herói, basta colocar "herosJourney_?", com ? sendo o índice do colecionável em questão.
        case .sixthText:
            return Dialogue(descriptionText: "(sixthText) CUESTA 🇦🇷 NA MEIA 🧦 ESQUERDA⬅️⬅️AMEAÇOU 🔫🔪 NÃO BATEU 🚫🥊 VEM PRA TABELA 📉📈 PEGLOW ☄️ PRO CUESTA 🇦🇷 BATEU CRUZADO 💴⚔️✝️ EDENILSOOOOOOOOOOOOOOOOON 👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾  QUARENTA E UM ANOS 4️⃣1️⃣ 👉👌👴🏻🏆GOOOOOOOOOOOOOOL ⚽👨🏾🤸🏾‍♂️👨🏾 pipipi 🧏‍♂️🙋‍♂️🙋‍♂️🗽🚩",
                            firstCardText: "Mó paia",
                            secondCardText: "Com certeza",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "seventhText",
                            nextSecondDialogue: "eighthText",
                            herosJourneysStage: "Teste",
                            triggerArray: ["archetype_1"]) // caso chegar nesse Dialogue implique em desbloquear um colecionável relativo a Arquétipos, basta colocar "archetype_?", com ? sendo o índice do colecionável em questão.
        case .seventhText:
            return Dialogue(descriptionText: "(seventhText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            firstCardText: "Tá zoando",
                            secondCardText: "Pode crer",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "eighthText",
                            nextSecondDialogue: "",
                            herosJourneysStage: "Teste",
                            triggerArray: ["herosJourney_2"])
        case .eighthText:
            return Dialogue(descriptionText: "(eighthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            firstCardText: "Tá zoando",
                            secondCardText: "Pode crer",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "",
                            nextSecondDialogue: "",
                            herosJourneysStage: "Teste",
                            triggerArray: ["archetype_2"])
        case .ninthText:
            return Dialogue(descriptionText: "(ninthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            firstCardText: "Tá zoando",
                            secondCardText: "Pode crer",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "",
                            nextSecondDialogue: "",
                            herosJourneysStage: "Teste")
        case .tenthText:
            return Dialogue(descriptionText: "(tenthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            firstCardText: "Tá zoando",
                            secondCardText: "Pode crer",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "",
                            nextSecondDialogue: "",
                            herosJourneysStage: "Teste")
        case .novoDialogo:
            return Dialogue(descriptionText: "teste dialogo novo",
                            firstCardText: "Tá zoando",
                            secondCardText: "Pode crer",
                            firstCardImageName: "gameplayCard_MC_01",
                            secondCardImageName: "gameplayCard_MC_01",
                            nextFirstDialogue: "",
                            nextSecondDialogue: "",
                            herosJourneysStage: "Teste")
        }
    }
}
