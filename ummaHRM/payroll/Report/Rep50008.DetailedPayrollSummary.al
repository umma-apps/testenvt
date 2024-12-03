report 50008 "Detailed Payroll Summary"
{
    Caption = 'Detailed Payroll Summary 1';
    RDLCLayout = './payroll/Report/SSR/PRL-Summary Detailed2.rdl';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("HRM-Employee (D)"; "HRM-Employee (D)")
        {
            column(No_; "No.") { }
            column(First_Name; "First Name") { }
            column(Middle_Name; "Middle Name") { }
            column(Last_Name; "Last Name") { }
            column(basicAmount; basicAmount) { }
            column(HouseAllowance; HouseAllowance) { }
            column(AdvancesAmount; AdvancesAmount) { }
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
            column(TotalDeduction; TotalDeduction) { }
            column(providentAmount; providentAmount) { }
            column(Sn; Sn) { }
            trigger OnPreDataItem()
            begin
                "HRM-Employee (D)".SetFilter("Payroll Posting Group", '%1', 'PAYROLL');
                //"HRM-Employee (D)".SetFilter(Status, '%1', "HRM-Employee (D)".Status::Active);

                "HRM-Employee (D)".SetFilter("Employee Category", '%1', 'FT');
            end;

            trigger OnAfterGetRecord()
            begin

                RentAmount := 0;
                OtherAllowances := 0;
                HouseAllowance := 0;
                GrossAmount := 0;
                PayeAmount := 0;

                NhifAmount := 0;
                NssFAmount := 0;
                providentAmount := 0;

                SaccoAmount := 0;
                StaffAdvance := 0;
                AdvancesAmount := 0;
                OtherDeductions := 0;
                TotalDeduction := 0;
                NetPay := 0;
                HelbAmount := 0;
                basicAmount := 0;
                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetRange("Transaction Code", 'BPAY');
                if prperiodTransactions.FindFirst() then begin
                    basicAmount := prperiodTransactions.Amount;

                end;
                //net Pay

                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetRange("Transaction Code", 'NPAY');
                prperiodTransactions.SetRange("Group Order", 9);
                if prperiodTransactions.FindFirst() then begin
                    NetPay := prperiodTransactions.Amount;

                end;
                //Helb
                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetFilter("Transaction Code", '%1', 'TR-049');
                prperiodTransactions.SetFilter("Group Order", '%1', 8);
                prperiodTransactions.SetFilter("Sub Group Order", '%1', 13);

                if prperiodTransactions.FindFirst() then begin
                    HelbAmount := prperiodTransactions.Amount;

                end;
                //Total Deductions
                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetFilter("Group Text", '%1|%2', 'STATUTORIES', 'DEDUCTIONS');

                If prperiodTransactions.FindFirst() then begin
                    prperiodTransactions.CalcSums(prperiodTransactions.Amount);
                    TotalDeduction := prperiodTransactions.Amount;
                end;
                //Gross



                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetRange("Transaction Code", 'GPAY');
                if prperiodTransactions.FindFirst() then begin
                    GrossAmount := prperiodTransactions.Amount;
                end;
                //House Allowance
                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                //prperiodTransactions.SetRange("Group Text", 'EARNINGS');
                prperiodTransactions.SetFilter("Transaction Code", '%1|%2', 'TR-001', 'TR-026');
                IF prperiodTransactions.FindFirst() then begin
                    prperiodTransactions.CalcSums(prperiodTransactions.Amount);
                    HouseAllowance := prperiodTransactions.Amount;
                end;

                //Advances
                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                //prperiodTransactions.SetRange("Group Text", 'EARNINGS');
                prperiodTransactions.SetFilter("Transaction Code", '%1|%2|%3', 'TR-062', 'TR-037', 'TR-035', 'TR-033');
                IF prperiodTransactions.FindFirst() then begin
                    prperiodTransactions.CalcSums(prperiodTransactions.Amount);
                    AdvancesAmount := prperiodTransactions.Amount;
                end;
                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                //prperiodTransactions.SetFilter("Group Text", '%1', 'EARNINGS');
                prperiodTransactions.SetFilter("Transaction Code", '<>%1|<>%2', 'TR-001', 'TR-026');
                // prperiodTransactions.SetFilter("Transaction Code", '<>%1', 'TR-026');
                prperiodTransactions.SetFilter("Group Order", '%1', 3);
                prperiodTransactions.SetRange("Payroll Period", periods);
                IF prperiodTransactions.FindFirst() then begin
                    prperiodTransactions.CalcSums(prperiodTransactions.Amount);
                    OtherAllowances := prperiodTransactions.Amount;
                end;
                //Paye
                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetRange("Transaction Code", 'PAYE');
                if prperiodTransactions.FindFirst() then begin
                    PayeAmount := prperiodTransactions.Amount;

                end;
                //nhif
                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetRange("Group Order", 7);
                prperiodTransactions.SetRange("Sub Group Order", 2);
                if prperiodTransactions.FindFirst() then begin
                    NhifAmount := prperiodTransactions.Amount;

                end;
                //nssf

                prperiodTransactions.RESET;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetRange("Group Order", 7);
                prperiodTransactions.SetRange("Sub Group Order", 1);
                if prperiodTransactions.FindFirst() then begin
                    NssFAmount := prperiodTransactions.Amount;

                end;

                //Rent
                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetFilter("Transaction Code", '%1|%2', 'TR-056', 'TR-059');
                IF prperiodTransactions.FindFirst() THEN begin
                    RentAmount := prperiodTransactions.Amount;

                end;
                //Provident
                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetFilter("Transaction Code", '%1', 'TR-065');
                IF prperiodTransactions.FindFirst() THEN begin
                    providentAmount := prperiodTransactions.Amount;

                end;
                //Other Deductions

                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetFilter("Transaction Code", '<>%1|<>%2|<>%3', 'TR-062', 'TR-037', 'TR-035', 'TR-033');//<>Advances
                prperiodTransactions.SetFilter("Group Text", '%1', 'DEDUCTIONS');
                prperiodTransactions.SetFilter("Transaction Code", '<>%1', 'TR-049');//<>Helb
                prperiodTransactions.SetFilter("Transaction Code", '<>%1|<>%2', 'TR-056', 'TR-059');//<>Rent
                prperiodTransactions.SetFilter("Transaction Code", '<>%1', 'TR-065');//<>Provident
                prperiodTransactions.SetFilter("Transaction Code", '<>%1|<>%2|<>%3|<>%4|<>%5|<>%6|<>%7|<>%8', 'TR-046', 'TR-047', 'TR-054', 'TR-055', 'TR-057', 'TR-058', 'TR-060', 'TR-061');//<>Sacco
                IF prperiodTransactions.FindFirst() THEN begin
                    prperiodTransactions.CalcSums(prperiodTransactions.Amount);

                    OtherDeductions := prperiodTransactions.Amount;

                end;

                //Sacco
                prperiodTransactions.reset;
                prperiodTransactions.SetRange("Employee Code", "No.");
                prperiodTransactions.SetRange("Payroll Period", periods);
                prperiodTransactions.SetFilter("Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8', 'TR-046', 'TR-047', 'TR-054', 'TR-055', 'TR-057', 'TR-058', 'TR-060', 'TR-061');
                IF prperiodTransactions.FindFirst() THEN begin
                    prperiodTransactions.CalcSums(prperiodTransactions.Amount);

                    SaccoAmount := prperiodTransactions.Amount;

                end;

                if basicAmount = 0 then
                    CurrReport.skip else
                    Sn := Sn + 1;







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
                    field(Periods; Periods)
                    {
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
        StaffAdvance: decimal;
        PrlTransactionCodes: Record "PRL-Transaction Codes";
        Info: Record 79;
        Sn: Integer;
}
