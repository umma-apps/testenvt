report 50007 "Prl-Simplified Summary"
{
    ApplicationArea = All;
    Caption = 'Prl-Simplified Summary';
    DefaultLayout = rdlc;
    RDLCLayout = './payroll/Report/SSR/PRL-Summary Detailed1.rdl';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
        {
            column(Employee_Code; "Employee Code") { }
            column(basicAmount; basicAmount) { }
            column(HouseAllowance; HouseAllowance) { }
            column(OtherAllowances; OtherAllowances) { }
            column(GrossAmount; GrossAmount) { }

            column(PayeAmount; PayeAmount) { }
            column(NssFAmount; NssFAmount) { }
            column(NhifAmount; NhifAmount) { }
            column(RentAmount; RentAmount) { }
            column(SaccoAmount; SaccoAmount) { }

            column(OtherDeductions; OtherDeductions) { }
            column(NetPay; NetPay) { }
            column(HelbAmount; HelbAmount) { }
            column(Sn; Sn) { }
            trigger OnPreDataItem()
            begin
                "PRL-Period Transactions".SetFilter("Payroll Period", '%1', periods);
            end;

            trigger OnAfterGetRecord()
            begin
                Sn := Sn + 1;
                clear(basicAmount);

                if prperiodTransactions."Transaction Code" in ['BPAY'] THEN begin

                    basicAmount := prperiodTransactions.Amount;
                end;

            end;
        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Period; periods)
                    {
                        ApplicationArea = all;
                        Caption = 'Period:';
                        TableRelation = "PRL-Payroll Periods"."Date Opened";
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        //  "PRL-Period Transactions": Record "PRL-Period Transactions";
        prPayrollPeriods: Record "PRL-Payroll Periods";
        periods: Date;
        OtherAllowances: Decimal;
        HouseAllowance: Decimal;
        GrossAmount: Decimal;
        PayeAmount: Decimal;
        prperiodTransactions: record "PRL-Period Transactions";
        NhifAmount: Decimal;
        NssFAmount: Decimal;
        providentAmount: Decimal;
        RentAmount: Decimal;
        SaccoAmount: Decimal;
        AdvancesAmount: Decimal;
        OtherDeductions: Decimal;
        TotalDeduction: Decimal;
        NetPay: Decimal;
        HelbAmount: decimal;
        basicAmount: decimal;
        PrlTransactionCodes: Record "PRL-Transaction Codes";
        Info: Record 79;
        Sn: Integer;
}