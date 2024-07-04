//
//  EditProdile.swift
//  Landmarks
//
//  Created by Tatiana Lazarenko on 7/4/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct EditProfile: View {
    @Binding var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("username", text: $profile.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: $profile.prefersNotifications, label: {
                Text("Notifications")
            })
            
            HStack {
                Text("Select a seasonal photo")
                    .font(.system(size: 18))
                Spacer()
                Picker("Select a seasonal photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { photo in
                        Text(photo.rawValue.capitalized)
                    }
                }
            }
            
            DatePicker(
                "Start Date",
                selection: $profile.goalDate,
                displayedComponents: [.date]
            )
    
            Spacer()
        }
        .padding([.leading, .trailing], 20)
    }
}

#Preview {
    EditProfile(profile: .constant(.default))
        .environment(ModelData())
}
