@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_TRAVEL_000247
  provider contract transactional_query
  as projection on ZI_FE_TRAVEL_000247 as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element: [ 'Description' ]
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.filter: { selectionType: #SINGLE, multipleSelections: false, mandatory: true }
      AgencyID,
      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      Description,
      _Agency.Name                   as AgencyName,
      _Customer.LastName             as LastName,
      _TravelStatus.TravelStatusText as TravelStatusText,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: [ 'TravelStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity : {name: 'zi_fe_stat_000247', element: 'TravelStatusId'  } }]
      OverallStatus,
      OverallStatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      LastChangedAt,
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_BOOKING_000247,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus
}
