import Foundation

public struct MockContactRepository: ContactRepository {
    public init() {}

    public func fetchContacts() async throws -> [Contact] {
        [
            Contact(name: "Ana García", company: "Acme", email: "ana@acme.example", phone: "+34 600 000 001", status: .customer),
            Contact(name: "Luis Martín", company: "Northwind", email: "luis@northwind.example", phone: "+34 600 000 002", status: .lead),
            Contact(name: "Sofía López", company: "Globex", email: "sofia@globex.example", phone: "+34 600 000 003", status: .customer)
        ]
    }
}

public struct MockOpportunityRepository: OpportunityRepository {
    public init() {}

    public func fetchOpportunities() async throws -> [Opportunity] {
        [
            Opportunity(
                title: "Renovación anual",
                company: "Acme",
                value: 18_500,
                stage: .negotiation,
                expectedCloseDate: .now.addingTimeInterval(60 * 60 * 24 * 14)
            ),
            Opportunity(
                title: "Implantación CRM",
                company: "Northwind",
                value: 32_000,
                stage: .proposal,
                expectedCloseDate: .now.addingTimeInterval(60 * 60 * 24 * 30)
            )
        ]
    }
}

public struct MockAppointmentRepository: AppointmentRepository {
    public init() {}

    public func fetchAppointments() async throws -> [Appointment] {
        [
            Appointment(title: "Demo de producto", date: .now.addingTimeInterval(60 * 60 * 2), contactName: "Luis Martín"),
            Appointment(title: "Revisión de contrato", date: .now.addingTimeInterval(60 * 60 * 26), contactName: "Ana García")
        ]
    }
}

public struct MockReportRepository: ReportRepository {
    public init() {}

    public func fetchSummary() async throws -> ReportSummary {
        ReportSummary(totalContacts: 42, openOpportunities: 8, pipelineValue: 125_400, conversionRate: 0.38)
    }
}
