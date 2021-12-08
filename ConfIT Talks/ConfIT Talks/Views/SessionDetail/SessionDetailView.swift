//
//  SessionDetail.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

struct SessionDetailView: View {
    @AppStorage("sessionsIdsInAgenda") private var sessionsIdsInAgenda: Set<Int> = []
    
    let session: Session    
    @Binding var firstSpeakerImageData: Data?
    @Binding var secondSpeakerImageData: Data?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            if sessionsIdsInAgenda.contains(session.id) {
                                sessionsIdsInAgenda.remove(session.id)
                            } else {
                                sessionsIdsInAgenda.insert(session.id)
                            }
                        }
                    } label: {
                        if sessionsIdsInAgenda.contains(session.id) {
                            Image(systemName: "star.fill")
                        } else {
                            Image(systemName: "star")
                        }
                    }
                }
                
                HStack {
                    VStack {
                        if let firstSpeakerImageData = firstSpeakerImageData,
                           let firstSpeakerImage = UIImage(data: firstSpeakerImageData) {
                            
                            Image(uiImage: firstSpeakerImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:100, height:100)
                        }
                        
                        Text(session.firstSpeaker.speakerName)
                            .font(.caption)
                    }
                    
                    VStack {
                        if let secondSpeakerImageData = secondSpeakerImageData,
                           let secondSpeakerImage = UIImage(data: secondSpeakerImageData) {
                            
                            Image(uiImage: secondSpeakerImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:100, height:100)
                        }
                        
                        Text(session.secondSpeaker.speakerName)
                            .font(.caption)
                    }
                }
                
                Text(session.title)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                HStack {
                    Image(systemName: "calendar")
                    Text(DateFormatter.dayHumanReadableFormatter.string(from: session.sessionDate).uppercasingFirstLetter())
                }
                .padding(.top)
                
                HStack{
                    Image(systemName: "clock")
                    Text("\(DateFormatter.hourHumanReadableFormatter.string(from: session.sessionStartHour)) - \(DateFormatter.hourHumanReadableFormatter.string(from: session.sessionEndHour))")
                }
                .padding(.top, 5)
                
                Text(session.sessionDescription)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding(.top)
            }
        }
        .padding()
        .navigationTitle(session.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView(session: .debug, firstSpeakerImageData: .constant(nil), secondSpeakerImageData: .constant(nil))
    }
}
