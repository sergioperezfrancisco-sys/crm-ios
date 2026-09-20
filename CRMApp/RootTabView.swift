import SwiftUI

struct RootTabView: View {
    @StateObject private var model = AppModel()

    var body: some View {
        TabView {
            DashboardView(model: model)
                .tabItem { Label("Dashboard", systemImage: "rectangle.grid.2x2") }
            ContactsView(model: model)
                .tabItem { Label("Contactos", systemImage: "person.2") }
            OpportunitiesView(model: model)
                .tabItem { Label("Oportunidades", systemImage: "chart.bar.xaxis") }
            AgendaView(model: model)
                .tabItem { Label("Agenda", systemImage: "calendar") }
            ReportsView(model: model)
                .tabItem { Label("Reportes", systemImage: "chart.pie") }
        }
        .task { await model.load() }
        .alert("No se pudieron cargar los datos", isPresented: Binding(
            get: { model.errorMessage != nil },
            set: { if !$0 { model.errorMessage = nil } }
        )) {
            Button("Aceptar", role: .cancel) {}
        } message: {
            Text(model.errorMessage ?? "")
        }
    }
}
