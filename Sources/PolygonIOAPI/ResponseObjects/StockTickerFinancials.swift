// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public struct StockTickerFinancials: Codable, Equatable {
    public let status: String?
    public let results: [Result]?
    
    public struct Result: Codable, Equatable {
        public let ticker, period, calendarDate, reportPeriod: String?
        public let updated, dateKey: String?
        public let accumulatedOtherComprehensiveIncome, assets, assetsCurrent, assetsNonCurrent: Int?
        public let bookValuePerShare: Double?
        public let cashAndEquivalents, cashAndEquivalentsUSD: Int?
        public let currentRatio, debtToEquityRatio: Double?
        public let debt, debtCurrent, debtNonCurrent, debtUSD: Int?
        public let deferredRevenue, deposits, dividendYield, dividendsPerBasicCommonShare: Int?
        public let shareholdersEquity, shareholdersEquityUSD, enterpriseValue, enterpriseValueOverEBIT: Int?
        public let enterpriseValueOverEBITDA: Double?
        public let foreignCurrencyUSDExchangeRate, goodwillAndIntangibleAssets, investedCapital, inventory: Int?
        public let investments, investmentsCurrent, investmentsNonCurrent, totalLiabilities: Int?
        public let currentLiabilities, liabilitiesNonCurrent, marketCapitalization, tradeAndNonTradePayables: Int?
        public let priceToBookValue, priceEarnings, priceToEarningsRatio: Double?
        public let propertyPlantEquipmentNet: Int?
        public let sharePriceAdjustedClose, priceSales, priceToSalesRatio: Double?
        public let tradeAndNonTradeReceivables, accumulatedRetainedEarningsDeficit, shareFactor, shares: Int?
        public let weightedAverageShares, tangibleAssetValue, taxAssets, taxLiabilities: Int?
        public let tangibleAssetsBookValuePerShare: Double?
        public let workingCapital, capitalExpenditure, costOfRevenue, consolidatedIncome: Int?
        public let depreciationAmortizationAndAccretion, earningBeforeInterestTaxes, earningsBeforeInterestTaxesDepreciationAmortization: Int?
        public let ebitdaMargin: Double?
        public let earningsBeforeInterestTaxesDepreciationAmortizationUSD, earningBeforeInterestTaxesUSD, earningsBeforeTax: Int?
        public let earningsPerBasicShare, earningsPerDilutedShare, earningsPerBasicShareUSD: Double?
        public let freeCashFlow: Int?
        public let freeCashFlowPerShare: Double?
        public let grossProfit: Int?
        public let grossMargin: Double?
        public let interestExpense, netCashFlow, netCashFlowBusinessAcquisitionsDisposals, issuanceEquityShares: Int?
        public let issuanceDebtSecurities, paymentDividendsOtherCashDistributions, netCashFlowFromFinancing, netCashFlowFromInvesting: Int?
        public let netCashFlowInvestmentAcquisitionsDisposals, netCashFlowFromOperations, effectOfExchangeRateChangesOnCash, netIncome: Int?
        public let netIncomeCommonStock, netIncomeCommonStockUSD, netLossIncomeFromDiscontinuedOperations, netIncomeToNonControllingInterests: Int?
        public let profitMargin: Double?
        public let operatingExpenses, operatingIncome, payoutRatio, preferredDividendsIncomeStatementImpact: Int?
        public let revenues, revenuesUSD, researchAndDevelopmentExpense, shareBasedCompensation: Int?
        public let sellingGeneralAndAdministrativeExpense, weightedAverageSharesDiluted: Int?
        public let salesPerShare: Double?
        public let incomeTaxExpense: Int?

        public enum CodingKeys: String, CodingKey {
            case ticker, period, calendarDate, reportPeriod, updated, dateKey, accumulatedOtherComprehensiveIncome, assets, assetsCurrent, assetsNonCurrent, bookValuePerShare, cashAndEquivalents, cashAndEquivalentsUSD, currentRatio, debtToEquityRatio, debt, debtCurrent, debtNonCurrent, debtUSD, deferredRevenue, deposits, dividendYield, dividendsPerBasicCommonShare, shareholdersEquity, shareholdersEquityUSD, enterpriseValue, enterpriseValueOverEBIT, enterpriseValueOverEBITDA, foreignCurrencyUSDExchangeRate, goodwillAndIntangibleAssets, investedCapital, inventory, investments, investmentsCurrent, investmentsNonCurrent, totalLiabilities, currentLiabilities, liabilitiesNonCurrent, marketCapitalization, tradeAndNonTradePayables, priceToBookValue, priceEarnings, priceToEarningsRatio, propertyPlantEquipmentNet, sharePriceAdjustedClose, priceSales, priceToSalesRatio, tradeAndNonTradeReceivables, accumulatedRetainedEarningsDeficit, shareFactor, shares, weightedAverageShares, tangibleAssetValue, taxAssets, taxLiabilities, tangibleAssetsBookValuePerShare, workingCapital, capitalExpenditure, costOfRevenue, consolidatedIncome, depreciationAmortizationAndAccretion, earningBeforeInterestTaxes, earningsBeforeInterestTaxesDepreciationAmortization
            case ebitdaMargin = "EBITDAMargin"
            case earningsBeforeInterestTaxesDepreciationAmortizationUSD, earningBeforeInterestTaxesUSD, earningsBeforeTax, earningsPerBasicShare, earningsPerDilutedShare, earningsPerBasicShareUSD, freeCashFlow, freeCashFlowPerShare, grossProfit, grossMargin, interestExpense, netCashFlow, netCashFlowBusinessAcquisitionsDisposals, issuanceEquityShares, issuanceDebtSecurities, paymentDividendsOtherCashDistributions, netCashFlowFromFinancing, netCashFlowFromInvesting, netCashFlowInvestmentAcquisitionsDisposals, netCashFlowFromOperations, effectOfExchangeRateChangesOnCash, netIncome, netIncomeCommonStock, netIncomeCommonStockUSD, netLossIncomeFromDiscontinuedOperations, netIncomeToNonControllingInterests, profitMargin, operatingExpenses, operatingIncome, payoutRatio, preferredDividendsIncomeStatementImpact, revenues, revenuesUSD, researchAndDevelopmentExpense, shareBasedCompensation, sellingGeneralAndAdministrativeExpense, weightedAverageSharesDiluted, salesPerShare, incomeTaxExpense
        }
    }
}
