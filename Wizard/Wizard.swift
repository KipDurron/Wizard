//
//  Wizard.swift
//  Wizard
//
//  Created by Илья Кадыров on 24.11.2020.
//

import Foundation


//[25.11.2020, 20:12:55] Рословцев Владимир Владимирович: page = wizard.createPage(..)
//[25.11.2020, 20:13:10] Рословцев Владимир Владимирович: content = page.createContent(..)
//content.addProperty(..)
//    .addProperty(..)
//    .addProperty(..)
//   .addProperty(..)
//wizardPage = page.endCreatePage
//page -> pageBuilder

class Wizard {
    
    var listWizardPage: [WizardPageController] = []
    
    func createWizardView() -> WizardView {
        return WizardView()
    }
    func createWizardView(contentVew: ContentView) -> WizardView {
        return WizardView(contentView: contentVew)
    }
    func createWizardPageController() -> ControllerBuilder {
        return ControllerBuilder()
    }
//    func endPage(contexPage: ContexPage) -> Wizard {
//        listWizardPage.append(contexPage.wizardPage)
//        return self
//    }
    
 
}
