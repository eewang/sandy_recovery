class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|

      t.string :AwardType
      t.string :ContractPricing
      t.string :ContractingAgency
      t.string :DUNSNumber
      t.string :parentDUNSNumber
      t.string :DateSigned
      t.string :ContractDescription
      t.string :ReasonForModification
      t.string :DollarsObligated
      t.string :ExtentCompeted
      t.string :FiscalYear
      t.string :TransactionNumber
      t.string :FundingAgency
      t.string :IDVProcurementInstrumentID
      t.string :MajorAgency
      t.string :ContractingAgencyCode
      t.string :MajorFundingAgency
      t.string :ModificationNumber
      t.string :PSCCategoryCode
      t.string :ParentRecipientOrCompanyName
      t.string :PlaceofPerformanceCongDistrict
      t.string :PlaceofPerformanceState
      t.string :PlaceofPerformanceZipCode
      t.string :PrincipalNAICSCode
      t.string :ProcurementInstrumentID
      t.string :PrincipalPlaceCountyOrCity
      t.string :ProductorServiceCode
      t.string :ProgramSource
      t.string :ProgramSourceAccountCode
      t.string :ProgramSourceAgencyCode
      t.string :ProgramSourceDescription
      t.string :RecipientAddressLine123
      t.string :RecipientCity
      t.string :RecipientCongressionalDistrict
      t.string :RecipientCountyName
      t.string :RecipientName
      t.string :RecipientOrContractorName
      t.string :RecipientState
      t.string :RecipientZipCode
      t.string :TypeofSpending
      t.string :TypeofTransaction

      t.timestamps
    end
  end
end
