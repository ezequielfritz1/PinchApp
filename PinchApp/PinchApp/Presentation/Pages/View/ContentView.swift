//
//  PagesView.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 20/10/22.
//

import SwiftUI

struct PagesView: View {
    // MARK: - Private Properties
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false

    @State private var pageIndex: Int = 0

    @ObservedObject var viewModel: PagesViewModel

    // MARK: - Private Methods
    private func resetImageState() {
        withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }

    private func currentPageName() -> String {
        if !viewModel.pages.isEmpty {
            return viewModel.pages[pageIndex].imageName
        }
        return ""
    }

    // MARK: - Content
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear

                Image(currentPageName())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded { _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isAnimating = true
            }
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            .overlay(
                Controls()
                    .padding(.bottom, 30)
                ,alignment: .bottom
            )
            .overlay(
                HStack(spacing: 12) {
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }

                    ForEach(viewModel.pages) { item in
                        Image(item.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 1), value: isDrawerOpen)
                            .onTapGesture {
                                isAnimating = true
                                pageIndex = item.id
                            }
                    }

                    Spacer()
                }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing)
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.onAppear()
        }
    }

    private func Controls() -> some View {
        Group {
            HStack {
                Button {
                    withAnimation(.spring()) {
                        if imageScale > 1 {
                            imageScale -= 1
                        } else {
                            resetImageState()
                        }
                    }
                } label: {
                    ControlImageView(imageName: "minus.magnifyingglass")
                }

                Button {
                    resetImageState()
                } label: {
                    ControlImageView(imageName: "arrow.up.left.and.down.right.magnifyingglass")
                }

                Button {
                    withAnimation(.spring()) {
                        if imageScale < 5 {
                            imageScale += 1
                        } else {
                            resetImageState()
                        }
                    }

                } label: {
                    ControlImageView(imageName: "plus.magnifyingglass")
                }
            }
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
            .animation(.linear(duration: 1), value: isAnimating)
        }
    }
}

// MARK: - Preview
struct PagesView_Previews: PreviewProvider {
    static var previews: some View {
        PagesView(viewModel: PagesViewModel())
            .preferredColorScheme(.dark)
    }
}
