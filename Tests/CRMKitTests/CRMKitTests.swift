import XCTest
@testable import CRMKit

final class CRMKitTests: XCTestCase {
    func testMockRepositoriesProvidePreviewData() async throws {
        let contacts = try await MockContactRepository().fetchContacts()
        let opportunities = try await MockOpportunityRepository().fetchOpportunities()

        XCTAssertFalse(contacts.isEmpty)
        XCTAssertFalse(opportunities.isEmpty)
    }

    func testSupabaseConfigurationReadsEnvironmentWithoutSecretsInCode() {
        let configuration = SupabaseConfiguration.fromEnvironment(environment: [
            "SUPABASE_URL": "https://example.supabase.co",
            "SUPABASE_ANON_KEY": "local-test-key"
        ])

        XCTAssertEqual(configuration?.url.absoluteString, "https://example.supabase.co")
        XCTAssertEqual(configuration?.anonKey, "local-test-key")
    }
}
