import Foundation

public struct Contact: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID
    public var name: String
    public var company: String
    public var email: String
    public var phone: String
    public var status: ContactStatus

    public init(
        id: UUID = UUID(),
        name: String,
        company: String,
        email: String,
        phone: String,
        status: ContactStatus = .lead
    ) {
        self.id = id
        self.name = name
        self.company = company
        self.email = email
        self.phone = phone
        self.status = status
    }
}

public enum ContactStatus: String, Codable, CaseIterable, Sendable {
    case lead
    case customer
    case inactive
}

public struct Opportunity: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID
    public var title: String
    public var company: String
    public var value: Decimal
    public var stage: OpportunityStage
    public var expectedCloseDate: Date

    public init(
        id: UUID = UUID(),
        title: String,
        company: String,
        value: Decimal,
        stage: OpportunityStage,
        expectedCloseDate: Date
    ) {
        self.id = id
        self.title = title
        self.company = company
        self.value = value
        self.stage = stage
        self.expectedCloseDate = expectedCloseDate
    }
}

public enum OpportunityStage: String, Codable, CaseIterable, Sendable {
    case prospecting
    case proposal
    case negotiation
    case won
    case lost
}

public struct Appointment: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID
    public var title: String
    public var date: Date
    public var contactName: String?

    public init(id: UUID = UUID(), title: String, date: Date, contactName: String? = nil) {
        self.id = id
        self.title = title
        self.date = date
        self.contactName = contactName
    }
}

public struct ReportSummary: Codable, Hashable, Sendable {
    public var totalContacts: Int
    public var openOpportunities: Int
    public var pipelineValue: Decimal
    public var conversionRate: Double

    public init(
        totalContacts: Int,
        openOpportunities: Int,
        pipelineValue: Decimal,
        conversionRate: Double
    ) {
        self.totalContacts = totalContacts
        self.openOpportunities = openOpportunities
        self.pipelineValue = pipelineValue
        self.conversionRate = conversionRate
    }
}
