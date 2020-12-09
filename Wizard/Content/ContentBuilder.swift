//
//  ContentBuilder.swift
//  Wizard
//
//  Created by Илья Кадыров on 09.12.2020.
//

import Foundation

class ContentBuilder {
    var wizardView = WizardView()
    var contentView = ContentView()
    
    init(wizardPageController: WizardPageController) {
        self.contentView.wizardPageController = wizardPageController
    }
    func addTextField(placeHolder: String) {
        contentView.addTextField(placeHolder: placeHolder)
    }
    
    func addButtonCheckExist() {
        contentView.addButtonCheckExist()
    }
    
    func endAddContent() -> WizardView{
        wizardView.setContentView(contentView: contentView)
        return wizardView
    }
}
