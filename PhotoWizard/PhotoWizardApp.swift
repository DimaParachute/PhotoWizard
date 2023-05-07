//
//  PhotoWizardApp.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import SwiftUI

@main
struct PhotoWizardApp: App {
    
    let articlesListFactory: PhotosListFactory = PhotosListFactoryImpl()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                articlesListFactory.createPhotosList()
            }
        }
    }
}
