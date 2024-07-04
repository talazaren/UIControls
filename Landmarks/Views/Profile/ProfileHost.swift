//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ProfileModel.self) var profileModel
    
    @State private var draftProfile = Profile.default
    @State private var isEditing = false
    
    var body: some View {
        VStack() {
            if isEditing {
                EditProfile(profile: $draftProfile)
            } else {
                ProfileSummary(profile: profileModel.profile)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if isEditing {
                    Button(action: {
                        draftProfile = profileModel.profile
                        isEditing = false
                    }) {
                        HStack {
                            Image("Back")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.blue)
                            Text("Cancel")
                                .font(.system(size: 18))
                        }
                    }
                } else {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image("Back")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.blue)
                            Text("Featured")
                                .font(.system(size: 18))
                        }
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if isEditing {
                    Button(action: {
                        profileModel.profile = draftProfile
                        isEditing = false
                    }) {
                        Text("Save")
                            .font(.system(size: 18))
                    }
                } else {
                    Button(action: {
                        draftProfile = profileModel.profile
                        isEditing = true
                    }) {
                        Text("Edit")
                            .font(.system(size: 18))
                    }
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
        .environment(ProfileModel())
}
