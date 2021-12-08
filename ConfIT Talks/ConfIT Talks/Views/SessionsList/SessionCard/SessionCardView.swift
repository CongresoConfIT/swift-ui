//
//  SessionCardView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

struct SessionCardView: View {
        
    @ObservedObject var viewModel: SessionCardViewModel
    
    @AppStorage("sessionsIdsInAgenda") private var sessionsIdsInAgenda: Set<Int> = []

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        if sessionsIdsInAgenda.contains(viewModel.session.id) {
                            sessionsIdsInAgenda.remove(viewModel.session.id)
                        } else {
                            sessionsIdsInAgenda.insert(viewModel.session.id)
                        }
                    }
                } label: {
                    if sessionsIdsInAgenda.contains(viewModel.session.id) {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                }
            }
            
            NavigationLink(
                destination: SessionDetailView(
                    session: viewModel.session,
                    firstSpeakerImageData: $viewModel.firstSpeakerImageData,
                    secondSpeakerImageData: $viewModel.secondSpeakerImageData),
                label: {
                    VStack(spacing: 0) {
                        HStack {
                            VStack {
                                if let firstSpeakerImageData = viewModel.firstSpeakerImageData,
                                   let firstSpeakerImage = UIImage(data: firstSpeakerImageData) {
                                    
                                    Image(uiImage: firstSpeakerImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:100, height:100)
                                }
                                
                                Text(viewModel.session.firstSpeaker.speakerName)
                                    .font(.caption)
                            }
                            
                            VStack {
                                if let secondSpeakerImageData = viewModel.secondSpeakerImageData,
                                   let secondSpeakerImage = UIImage(data: secondSpeakerImageData) {
                                    
                                    Image(uiImage: secondSpeakerImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:100, height:100)
                                }
                                
                                Text(viewModel.session.secondSpeaker.speakerName)
                                    .font(.caption)
                            }
                        }
                        
                        Text(viewModel.session.title)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(DateFormatter.dayHumanReadableFormatter.string(from: viewModel.session.sessionDate).uppercasingFirstLetter())
                        }
                        .padding(.top)
                        
                        HStack{
                            Image(systemName: "clock")
                            Text("\(DateFormatter.hourHumanReadableFormatter.string(from: viewModel.session.sessionStartHour)) - \(DateFormatter.hourHumanReadableFormatter.string(from: viewModel.session.sessionEndHour))")
                        }
                        .padding(.top, 5)
                        
                        Text(viewModel.session.sessionDescription)
                            .font(.callout)
                            .lineLimit(5)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                    }                })
                .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
