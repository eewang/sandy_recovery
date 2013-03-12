class Contract < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :AwardType, :ContractPricing, :ContractingAgency, :DUNSNumber, :parentDUNSNumber, :DateSigned, :ContractDescription, :ReasonForModification,
      :DollarsObligated,
      :ExtentCompeted,
      :FiscalYear,
      :TransactionNumber,
      :FundingAgency,
      :IDVProcurementInstrumentID,
      :MajorAgency,
      :ContractingAgencyCode,
      :MajorFundingAgency,
      :ModificationNumber,
      :PSCCategoryCode,
      :ParentRecipientOrCompanyName,
      :PlaceofPerformanceCongDistrict,
      :PlaceofPerformanceState,
      :PlaceofPerformanceZipCode,
      :PrincipalNAICSCode,
      :ProcurementInstrumentID,
      :PrincipalPlaceCountyOrCity,
      :ProductorServiceCode,
      :ProgramSource,
      :ProgramSourceAccountCode,
      :ProgramSourceAgencyCode,
      :ProgramSourceDescription,
      :RecipientAddressLine123,
      :RecipientCity,
      :RecipientCongressionalDistrict,
      :RecipientCountyName,
      :RecipientName,
      :RecipientOrContractorName,
      :RecipientState,
      :RecipientZipCode,
      :TypeofSpending,
      :TypeofTransaction

  SOURCE = "http://www.usaspending.gov/fpds/fpds.php?state=NY&detail=b&fiscal_year=2013&agency_code=7022"

  @contracts = []

  def self.source
    SOURCE
  end

  def self.source_call
    Nokogiri::XML(open(Contract.source))
  end

  def self.contract_list
    Contract.source_call.children[0].children[3].children
  end

  # contracts = @doc.children[0].children[3].children # => every odd has data

  def self.store_contracts
    @contracts = Contract.contract_list    
    @contracts.each do |set|
      if @contracts.index(set) % 2 != 0
        c = Contract.new
        set.children.each do |item|
          if set.children.index(item) % 2 != 0
            begin
              c.send((item.name + "=").to_s, item.text)
            rescue => ex
              puts ex
            end
          end
        end
        c.save
      end
    end
  end

end
