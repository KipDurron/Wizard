//
//  ControllerBuilder.swift
//  Wizard
//
//  Created by Илья Кадыров on 09.12.2020.
//

import Foundation
class ControllerBuilder {
    var wizardPageController = WizardPageController()
    init () {
        wizardPageController.modalPresentationStyle = .fullScreen
    }
    func createWizardContent() -> ContentBuilder {
        return ContentBuilder(wizardPageController: wizardPageController)
    }
    func endCreateController(wizardView: WizardView) -> WizardPageController{
        self.wizardPageController.currentWizardView = wizardView
        self.wizardPageController.title = wizardView.contentView.titleName
        return wizardPageController
    }
}
