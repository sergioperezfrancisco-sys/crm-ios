import Foundation

public protocol ContactRepository: Sendable {
    func fetchContacts() async throws -> [Contact]
}

public protocol OpportunityRepository: Sendable {
    func fetchOpportunities() async throws -> [Opportunity]
}

public protocol AppointmentRepository: Sendable {
    func fetchAppointments() async throws -> [Appointment]
}

public protocol ReportRepository: Sendable {
    func fetchSummary() async throws -> ReportSummary
}
