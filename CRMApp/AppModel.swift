import Foundation
import Combine
import CRMKit

@MainActor
final class AppModel: ObservableObject {
    @Published private(set) var contacts: [Contact] = []
    @Published private(set) var opportunities: [Opportunity] = []
    @Published private(set) var appointments: [Appointment] = []
    @Published private(set) var reportSummary: ReportSummary?
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let contactRepository: any ContactRepository
    private let opportunityRepository: any OpportunityRepository
    private let appointmentRepository: any AppointmentRepository
    private let reportRepository: any ReportRepository

    init(
        contactRepository: any ContactRepository = MockContactRepository(),
        opportunityRepository: any OpportunityRepository = MockOpportunityRepository(),
        appointmentRepository: any AppointmentRepository = MockAppointmentRepository(),
        reportRepository: any ReportRepository = MockReportRepository()
    ) {
        self.contactRepository = contactRepository
        self.opportunityRepository = opportunityRepository
        self.appointmentRepository = appointmentRepository
        self.reportRepository = reportRepository
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            async let loadedContacts = contactRepository.fetchContacts()
            async let loadedOpportunities = opportunityRepository.fetchOpportunities()
            async let loadedAppointments = appointmentRepository.fetchAppointments()
            async let loadedSummary = reportRepository.fetchSummary()
            contacts = try await loadedContacts
            opportunities = try await loadedOpportunities
            appointments = try await loadedAppointments
            reportSummary = try await loadedSummary
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
