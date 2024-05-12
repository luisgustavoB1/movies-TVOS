//
//  MoviePosterView.swift
//  Movies
//
//  Created by Luis Gustavo on 10/05/24.
//
import SDWebImageSwiftUI
import SwiftUI

struct MoviePosterView: View {

    let movie: MovieModel
    @FocusState private var isFocused: Bool
    private let focusColor = Color.blue
    
    var body: some View {
        let borderColor = isFocused ? focusColor : Color.clear
        let borderWidth: CGFloat = isFocused ? 4 : 0
        WebImage(url: movie.posterURL) { image in
            image.resizable()
            } placeholder: {
                Image("default-image")
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
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

//#Preview {
////    MoviePosterView(movie: ModelMock.movieModel))
//}

//struct MoviePosterView: View {
//    var movie: MovieModel
//    @FocusState private var isFocused: Bool
//    private let focusColor = Color.blue
//    
//    var body: some View {
//        let borderColor = isFocused ? focusColor : Color.clear
//        let borderWidth: CGFloat = isFocused ? 4 : 0
//        
//        WebImage(url: movie.posterURL)
//            .resizable()
//            .scaledToFit()
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(borderColor, lineWidth: borderWidth)
//            )
//            .focusable()
//            .scaleEffect(isFocused ? 1.1 : 1.0)
//            .animation(.easeInOut(duration: 0.2)) // Adiciona uma animação suave
//            .onTapGesture {
//                withAnimation {
//                    isFocused.toggle()
//                }
//                if isFocused {
//                    // Faça algo quando a imagem for focada
//                } else {
//                    // Faça algo quando a imagem for desfocada
//                }
//            }
//    }
//}
