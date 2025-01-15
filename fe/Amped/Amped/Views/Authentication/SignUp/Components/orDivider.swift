//
//  orDivider.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/14/25.
//

import SwiftUI

struct orDivider: View {
    
    var body : some View {
        HStack {
            VStack {
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal, 18)
            }
            Text("or")
                .font(.system(size: 16, weight: .regular))
            VStack {
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal, 18)
                
            }
        }
    }
    
}

#Preview {
    orDivider()
}
