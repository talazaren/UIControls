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
    @State private var draftProfile = Profile.default
    @State private var profile = Profile.default
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if isEditing {
                EditProfile(profile: $draftProfile)
            } else {
                ProfileSummary(profile: profile)
            }
        }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if isEditing {
                    Button(action: {
                        draftProfile = profile
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
                        profile = draftProfile
                        isEditing = false
                    }) {
                        Text("Save")
                            .font(.system(size: 18))
                    }
                } else {
                    Button(action: {
                        draftProfile = profile
                        isEditing = true
                    }) {
                        Text("Edit")
                            .font(.system(size: 18))
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
