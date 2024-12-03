Report 50951 "Housing Levi Csv"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ssrs/PRiTaxReport.rdl';
    //ApplicationArea = All;

    dataset
    {
        dataitem("Employees"; "HRM-Employee (D)")
        {
            RequestFilterFields = "No.";

            column(ReportForNavId_1; 1)
            {
            }
            column(EmployeeType_HREmployees; "Employees"."No.")
            {
            }


            column(FullName_HREmployees; "Employees"."Full Name")
            {
            }
            column(PINNo_HREmployees; "Employees"."PIN Number")
            {
            }
            column(Disability_Cert; "Employees"."Disability Cert")
            {

            }
            column(BPAY; BPAY)
            {
            }
            column(HouseAllowance; HouseAllowance)
            {
            }
            column(TransportAllowance; TransportAllowance)
            {
            }
            column(LeaveAllowance; LeaveAllowance)
            {
            }
            column(DirectorsFee; DirectorsFee)
            {
            }
            column(OvertimeAllowance; OvertimeAllowance)
            {
            }
            column(Lumpsum; Lumpsum)
            {
            }
            column(OtherAllowances; OtherAllowances)
            {
            }
            column(TotalCashPay; TotalCashPay)
            {
            }
            column(ValueOfCar; ValueOfCar)
            {
            }
            column(OtherNonCash; OtherNonCash)
            {
            }
            column(TotalNonCash; TotalNonCash)
            {
            }
            column(GlobalIncome; GlobalIncome)
            {
            }
            column(TypeOfHousing; TypeOfHousing)
            {
            }
            column(RentOfHouse; RentOfHouse)
            {
            }
            column(ComputedRent; ComputedRent)
            {
            }
            column(RentRecovered; RentRecovered)
            {
            }
            column(NetValue; NetValue)
            {
            }
            column(TotalGross; TotalGross)
            {
            }
            column(ThirtyPCash; ThirtyPCash)
            {
            }
            column(ActualContr; ActualContr)
            {
            }
            column(PermissibleLimit; PermissibleLimit)
            {
            }
            column(MortgageIntrest; MortgageIntrest)
            {
            }
            column(HOSP; HOSP)
            {
            }
            column(AmountOfBenefit; AmountOfBenefit)
            {
            }
            column(TaxablePay; TaxablePay)
            {
            }
            column(TaxPayable; TaxPayable)
            {
            }
            column(MonthlyRelief; MonthlyRelief)
            {
            }
            column(InsuranceRelief; InsuranceRelief)
            {
            }
            column(PAYE; PAYE)
            {
            }

            column(PAYETAX; PAYETAX)
            {

            }
            trigger OnPreDataItem()
            begin
                if ExportCSV then begin
                    CSVBuffer.InsertEntry(LineNo, 1, 'Member Number(ID NUmber)');
                    CSVBuffer.InsertEntry(LineNo, 2, 'Member Name');
                    CSVBuffer.InsertEntry(LineNo, 3, 'KRA PIN');
                    CSVBuffer.InsertEntry(LineNo, 4, 'Gross Salary');

                end;
            end;

            trigger OnAfterGetRecord()
            begin
                //Init
                BPAY := 0;
                HouseAllowance := 0;
                TransportAllowance := 0;
                OvertimeAllowance := 0;
                DirectorsFee := 0;
                LeaveAllowance := 0;
                OvertimeAllowance := 0;
                Lumpsum := 0;
                OtherAllowances := 0;
                TotalCashPay := 0;
                ValueOfCar := 0;
                OtherNonCash := 0;
                TotalNonCash := 0;
                GlobalIncome := 0;
                TypeOfHousing := 0;
                ComputedRent := 0;
                RentRecovered := 0;
                NetValue := 0;
                TotalGross := 0;
                ThirtyPCash := 0;
                ActualContr := 0;
                PermissibleLimit := 0;
                MortgageIntrest := 0;
                AmountOfBenefit := 0;
                TaxablePay := 0;
                TaxPayable := 0;
                MonthlyRelief := 0;
                InsuranceRelief := 0;
                PAYE := 0;
                PAYETAX := 0;
                finGross := 0;
                gpay := 0;
                aLLExp := 0;
                //Basic Pay
                // Employees.Reset();
                // Employees.SetRange("Physical Disability", true);
                // if Employees.Find('-') then begin

                // end
                fn_PeriodTrans;
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'BPAY');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    BPAY := PRPeriodTrans.Amount;
                end;
                //House Allowance & Arrears
                fn_PeriodTrans;
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'TR-001');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    HouseAllowance := PRPeriodTrans.Amount;
                end;
                //Transport Allowance & Arrears
                fn_PeriodTrans;
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'TR-006');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    TransportAllowance := PRPeriodTrans.Amount;
                end;
                //Leave Allowance & Arrears
                fn_PeriodTrans;
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'TR-008');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    LeaveAllowance := PRPeriodTrans.Amount;
                end;
                //Directors Fee
                //Other Allowances 4- Board
                // fn_PeriodTrans;
                // //PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '%1', 'BOARD');
                // PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4', 'EA005', 'EA035', 'EA052', 'EA057');
                // if PRPeriodTrans.FindFirst() then begin
                //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                //     OtherAllowances += PRPeriodTrans.Amount;
                // end;
                // //Lumpsum
                // fn_PeriodTrans;
                // PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'E14');
                // if PRPeriodTrans.FindFirst() then begin
                //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                //     Lumpsum := PRPeriodTrans.Amount;
                // end;
                // //Other Allowances 1
                // fn_PeriodTrans;
                // PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8', 'EA007', 'EA004', 'EA006', 'EA044', 'EA008', 'EA009', 'EA010', 'EA011');
                // if PRPeriodTrans.FindFirst() then begin
                //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                //     OtherAllowances += PRPeriodTrans.Amount;
                // end;
                // //Other Allowances 2
                // fn_PeriodTrans;
                // PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8', 'EA012', 'EA015', 'EA051', 'EA016', 'EA020', 'EA021', 'EA024', 'EA048');
                // if PRPeriodTrans.FindFirst() then begin
                //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                //     OtherAllowances += PRPeriodTrans.Amount;
                // end;
                //Other Allowances 3
                fn_PeriodTrans;
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8|%9|%10|%11|%12|%13|%14|%15|%16|%17|%18|%19|%20|%21|%22|%23|%24|%25|%26|%27', 'TR-002', 'TR-003', 'TR-004', 'TR-005', 'TR-007', 'TR-009', 'TR-010', 'TR-011', 'TR-012', 'TR-013', 'TR-014', 'TR-015', 'TR-016', 'TR-017', 'TR-018', 'TR-019', 'TR-020', 'TR-021', 'TR-022', 'TR-023', 'TR-024', 'TR-025', 'TR-026', 'TR-027', 'TR-028');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    OtherAllowances += PRPeriodTrans.Amount;
                end;
                // //Other Allowances 4
                // fn_PeriodTrans;
                // //PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '<>%1', 'BOARD');
                // PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'ED113');
                // if PRPeriodTrans.FindFirst() then begin
                //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                //     OtherAllowances += PRPeriodTrans.Amount;
                // end;

                //Other Non Cash
                PRTransCodes.Reset;
                PRTransCodes.SetRange(PRTransCodes."Transaction Type", PRTransCodes."transaction type"::Income);
                if PRTransCodes.FindFirst() then begin
                    repeat
                        fn_PeriodTrans;
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", PRTransCodes."Transaction Code");
                        if PRPeriodTrans.FindFirst() then begin
                            OtherNonCash += PRPeriodTrans.Amount;
                        end;
                    until PRTransCodes.Next = 0;
                end;
                //Total Cash Pay
                TotalCashPay := BPAY + HouseAllowance + TransportAllowance + OvertimeAllowance + DirectorsFee + LeaveAllowance + Lumpsum + OtherAllowances + OtherNonCash;
                //Value of Car

                //Total Non Cash
                TotalNonCash := OtherNonCash + ValueOfCar;
                //Globa Income
                GlobalIncome := TotalNonCash + TotalCashPay;
                //Type of Housing
                //Rent of House
                //Computed Rent
                //Rent Recovered
                //Net Value
                //Total Gross
                TotalGross := GlobalIncome;
                //30% of Cash
                ThirtyPCash := 0.3 * GlobalIncome;
                //Actual Contribution - Include Voluntary Pension & Voluntary NSSF & NSSF

                // PRTransCodes.Reset;
                // PRTransCodes.SetFilter(PRTransCodes."Special Trans Deductions", '%1|%2', (PRTransCodes."Special Trans Deductions"::"Defined Contribution"), (PRTransCodes."Special Trans Deductions"::"Voluntary Pension"));
                // if PRTransCodes.FindFirst() then begin
                //     repeat
                //         fn_PeriodTrans;
                //         PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", PRTransCodes.Code);
                //         if PRPeriodTrans.FindFirst() then begin
                //             ActualContr += PRPeriodTrans.Amount;
                //         end;
                //     until PRTransCodes.Next = 0;
                // end;

                fn_PeriodTrans;
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2', 'DEFCON1', 'PNSR');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    ActualContr += PRPeriodTrans.Amount;
                end;
                //Add NSSF too
                /*
                fn_PeriodTrans;
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NSSF');
                if PRPeriodTrans.FindFirst() then begin
                    ActualContr += PRPeriodTrans.Amount;
                end;
                */
                //Permissible Limit
                PermissibleLimit := 20000;
                //Mortgage Intrest
                // fn_PeriodTrans;
                // PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'MORG-RL');
                // if PRPeriodTrans.FindFirst() then begin
                //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                //     MortgageIntrest := PRPeriodTrans.Amount;
                // end;
                //Deposit on Home Ownership

                //Amount of Benefit
                E1 := 0.3 * TotalCashPay;
                E2 := ActualContr;
                E3 := 20000;
                //Column G - Get least between e1,E2,e3
                if E1 > E2 then begin
                    AmountOfBenefit := E2;
                end
                else begin
                    AmountOfBenefit := E1;
                end;
                if E3 < AmountOfBenefit then begin
                    AmountOfBenefit := E3;
                end;
                AmountOfBenefit += MortgageIntrest;
                //Taxable Pay
                fn_PeriodTrans;
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXBP');
                if PRPeriodTrans.FindFirst() then begin
                    TaxablePay := PRPeriodTrans.Amount;
                end;

                //Tax Payable
                fn_PeriodTrans;
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXCHRG');
                if PRPeriodTrans.FindFirst() then begin
                    TaxPayable := PRPeriodTrans.Amount;
                end;
                //Monthly Relief
                fn_PeriodTrans;
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PSNR');
                if PRPeriodTrans.FindFirst() then begin
                    MonthlyRelief := PRPeriodTrans.Amount;
                end;
                //Insurance Relief
                fn_PeriodTrans;
                PRPeriodTrans.Setfilter(PRPeriodTrans."Transaction Code", '%1|%2', 'INSR', 'NHIFINSR');
                if PRPeriodTrans.FindFirst() then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    if PRPeriodTrans.Amount > 5000 then
                        InsuranceRelief := 5000
                    else
                        InsuranceRelief := PRPeriodTrans.Amount;
                end;
                //PAYE
                fn_PeriodTrans;
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PAYE');
                if PRPeriodTrans.FindFirst() then begin
                    PAYE := PRPeriodTrans.Amount;
                end;
                //gross
                fn_PeriodTrans;
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'GPAY');
                if PRPeriodTrans.FindFirst() then begin
                    gpay := PRPeriodTrans.Amount;
                    // fn_PeriodTrans;
                    // PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3', 'TR-001', 'E1017', 'E1002');
                    // if PRPeriodTrans.FindFirst() then begin
                    //     PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    //     aLLExp += PRPeriodTrans.Amount;
                    // end;
                    // finGross := gpay - aLLExp;
                    finGross := gpay;


                end;
                if TotalCashPay = 0 then CurrReport.Skip;
                //PAYETAX
                // fn_PeriodTrans;
                // PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PAYETAX');
                // if PRPeriodTrans.FindFirst() then begin
                //     PAYETAX := TaxPayable - MonthlyRelief - InsuranceRelief;
                // end;
                if TotalCashPay = 0 then CurrReport.Skip;

                if ExportCSV then begin
                    LineNo := LineNo + 1;
                    CSVBuffer.InsertEntry(LineNo, 1, Employees."ID Number");
                    CSVBuffer.InsertEntry(LineNo, 2, Employees."Full Name");
                    CSVBuffer.InsertEntry(LineNo, 3, Employees."PIN Number");
                    CSVBuffer.InsertEntry(LineNo, 4, format(finGross, 0, 2));

                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Period Filter';
                        TableRelation = "PRL-Payroll Periods";
                    }

                    field(PostingGroup; PostingGrp_TxtFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employee Posting Group';
                    }
                    field(ExportCSV; ExportCSV)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Export to CSV?';
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        if PeriodFilter = 0D then Error('Please select payroll period');
        fnCompanyInfo;

        if ExportCSV then
            LineNo := 1;
    end;

    trigger OnPostReport()
    begin
        if ExportCSV then begin
            FileName := 'testfile.csv';
            CSVBuffer.SaveDataToBlob(TempBlob, ',');
            TempBlob.CreateInStream(InStr);
            DownloadFromStream(InStr, '', '', '', FileName);
        end;
    end;

    var
        CompInfo: Record "Company Information";
        PRPeriodTrans: Record "PRL-Period Transactions";
        PeriodFilter: Date;
        PRTransCodes: Record "PRL-Transaction Codes";
        BPAY: Decimal;
        HouseAllowance: Decimal;
        TransportAllowance: Decimal;
        LeaveAllowance: Decimal;
        OvertimeAllowance: Decimal;
        DirectorsFee: Decimal;
        Lumpsum: Decimal;
        OtherAllowances: Decimal;
        TotalCashPay: Decimal;
        ValueOfCar: Decimal;
        OtherNonCash: Decimal;
        TotalNonCash: Decimal;
        GlobalIncome: Decimal;
        TypeOfHousing: Decimal;
        RentOfHouse: Decimal;
        ComputedRent: Decimal;
        RentRecovered: Decimal;
        NetValue: Decimal;
        TotalGross: Decimal;
        ThirtyPCash: Decimal;
        ActualContr: Decimal;
        PermissibleLimit: Decimal;
        MortgageIntrest: Decimal;
        HOSP: Decimal;
        AmountOfBenefit: Decimal;
        E1: Decimal;
        E2: Decimal;
        E3: Decimal;
        TaxablePay: Decimal;
        TaxPayable: Decimal;
        MonthlyRelief: Decimal;
        InsuranceRelief: Decimal;
        PAYETAX: Decimal;
        PostingGrp_TxtFilter: Option "ALL","JSC","KJA","BOARD","JSC & KJA","CASUALS";
        ExportCSV: Boolean;
        CSVBuffer: Record "CSV Buffer" temporary;
        LineNo: Integer;
        TempBlob: Codeunit "Temp Blob";
        FileMgt: Codeunit "File Management";
        InStr: InStream;
        FileName: Text;
        paye: Decimal;
        finGross: Decimal;
        gpay: Decimal;
        aLLExp: Decimal;

    procedure fnCompanyInfo()
    begin
        CompInfo.Reset;
        if CompInfo.Get then CompInfo.CalcFields(CompInfo.Picture);
    end;

    local procedure fn_PeriodTrans()
    begin
        PRPeriodTrans.Reset;
        PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
        PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "Employees"."No.");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
        if PostingGrp_TxtFilter = PostingGrp_TxtFilter::ALL then begin
        end;

        // if PostingGrp_TxtFilter = PostingGrp_TxtFilter::BOARD then begin
        //     PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '%1', 'BOARD');
        // end;

        // if PostingGrp_TxtFilter = PostingGrp_TxtFilter::CASUALS then begin
        //     PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '%1', 'CASUALS');
        // end;

        // if PostingGrp_TxtFilter = PostingGrp_TxtFilter::JSC then begin
        //     PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '%1', 'JSC');
        // end;

        // if PostingGrp_TxtFilter = PostingGrp_TxtFilter::"JSC & KJA" then begin
        //     PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '%1|%2', 'JSC', 'KJA');
        // end;

        // if PostingGrp_TxtFilter = PostingGrp_TxtFilter::KJA then begin
        //     PRPeriodTrans.SetFilter(PRPeriodTrans."Posting Group", '%1', 'KJA');
        // end;
    end;
}