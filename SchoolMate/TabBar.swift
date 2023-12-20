//
//  TabBar.swift
//  SchoolMate
//
//  Created by 박도연 on 12/19/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case circle
    case message
    case house
    case heart
    case person
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) {tab in Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue).scaleEffect(selectedTab == tab ? 1.0 : 1.0).foregroundStyle(selectedTab == tab ? .red : .gray).font(.system(size: 30))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = tab
                            }
                        };
                    Spacer()
                    
                }
                
            }
            .frame(width: nil, height: 84)
            .background(.thinMaterial)
            .cornerRadius(10)
        }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View{
        TabBar(selectedTab: .constant(.house))
    }
}
