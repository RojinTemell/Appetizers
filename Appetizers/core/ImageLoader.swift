//
//  ImageLoader.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI

@MainActor
@Observable
final class ImageLoader {

  var image:UIImage? = nil
    func load(from urlString:String)async{
        let image =  await NetworkManager.shared.downloadImage(from:urlString)
        self.image = image
    }
}
