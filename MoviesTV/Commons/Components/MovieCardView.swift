//
//  MovieCardView.swift
//  MoviesTV
//
//  Created by Luis Gustavo on 11/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {

    var movie: MovieModel
    @FocusState private var isFocused: Bool
    private let focusColor = Color.blue

    var body: some View {
        let borderColor = isFocused ? focusColor : Color.clear
        let borderWidth: CGFloat = isFocused ? 4 : 0
        ZStack(alignment: .bottomLeading) {
            WebImage(url: movie.backdropURL) { image in
                image.resizable()
            } placeholder: {
                Image("default-image")
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(
                Color.black.opacity(0.3)
            )
        }
        .cornerRadius(10)
        .padding()
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: borderWidth)
        )
        .focusable()
        .scaleEffect(isFocused ? 1.1 : 1.0)
        .animation(.easeInOut(duration: 0.2)) // Adiciona uma animação suave
        .onTapGesture {
            withAnimation {
                isFocused.toggle()
            }
            if isFocused {
                // Faça algo quando a imagem for focada
            } else {
                // Faça algo quando a imagem for desfocada
            }
        }
    }
}

//struct MovieCardView: View {
//
//    var movie: MovieModel
//    @FocusState private var isFocused: Bool
//    
//    var body: some View {
//        ZStack(alignment: .bottomLeading) {
//            // Imagem de fundo
//            WebImage(url: movie.backdropURL)
//                .resizable()
//                .scaledToFill()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .clipped()
//
//            VStack(alignment: .leading, spacing: 8) {
//                Text(movie.title)
//                    .font(.headline)
//                    .padding(.vertical, 8)
//                    .foregroundColor(.white)
//            }
//            .frame(maxWidth: .infinity)
//            .background(
//                Color.black.opacity(0.3)
//            )
//        }
//        .cornerRadius(10)
//        .padding(8)
//        .shadow(radius: 5)
//        .focusable()
//        .scaleEffect(isFocused ? 1.1 : 1.0)
//        .onTapGesture {
//            isFocused.toggle()
//            if isFocused {
//                // Faça algo quando a imagem for focada
//            } else {
//                // Faça algo quando a imagem for desfocada
//            }
//        }
//    }
//}
