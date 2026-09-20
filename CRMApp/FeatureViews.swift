import SwiftUI
import CRMKit

struct DashboardView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        NavigationStack {
            List {
                Section("Resumen") {
                    MetricRow(title: "Contactos", value: "\(model.contacts.count)", systemImage: "person.2")
                    MetricRow(title: "Oportunidades abiertas", value: "\(model.opportunities.count)", systemImage: "chart.bar")
                    MetricRow(title: "Pipeline", value: model.reportSummary?.pipelineValue.currencyString ?? "—", systemImage: "eurosign")
                }
                Section("Próximas citas") {
                    ForEach(model.appointments.prefix(3)) { appointment in
                        VStack(alignment: .leading) {
                            Text(appointment.title).font(.headline)
                            Text(appointment.date, style: .date)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct ContactsView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        NavigationStack {
            List(model.contacts) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name).font(.headline)
                    Text("\(contact.company) · \(contact.email)")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Contactos")
        }
    }
}

struct OpportunitiesView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        NavigationStack {
            List(model.opportunities) { opportunity in
                HStack {
                    VStack(alignment: .leading) {
                        Text(opportunity.title).font(.headline)
                        Text("\(opportunity.company) · \(opportunity.stage.rawValue.capitalized)")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(opportunity.value.currencyString)
                }
            }
            .navigationTitle("Oportunidades")
        }
    }
}

struct AgendaView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        NavigationStack {
            List(model.appointments) { appointment in
                HStack {
                    Image(systemName: "calendar")
                    VStack(alignment: .leading) {
                        Text(appointment.title).font(.headline)
                        Text(appointment.date, style: .date)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Agenda")
        }
    }
}

struct ReportsView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        NavigationStack {
            List {
                if let summary = model.reportSummary {
                    MetricRow(title: "Contactos totales", value: "\(summary.totalContacts)", systemImage: "person.3")
                    MetricRow(title: "Conversión", value: "\(Int(summary.conversionRate * 100)) %", systemImage: "arrow.up.right")
                    MetricRow(title: "Pipeline", value: summary.pipelineValue.currencyString, systemImage: "eurosign")
                }
            }
            .navigationTitle("Reportes")
        }
    }
}

private struct MetricRow: View {
    let title: String
    let value: String
    let systemImage: String

    var body: some View {
        Label {
            HStack {
                Text(title)
                Spacer()
                Text(value).bold()
            }
        } icon: {
            Image(systemName: systemImage)
                .foregroundStyle(.tint)
        }
    }
}

private extension Decimal {
    var currencyString: String {
        formatted(.currency(code: "EUR"))
    }
}
