report 70019 "PRL-NSSF Report Combined"
{

    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-NSSF Combine 1.rdl';

    dataset
    {
        dataitem("HRM-Employee (D)"; "HRM-Employee (D)")
        {
            column(CompName; CompanyInformation.Name)
            {
            }
            column(CompAddress; CompanyInformation.Address)
            {
            }
            column(CompPhone1; CompanyInformation."Phone No.")
            {
            }
            column(CompPhone2; CompanyInformation."Phone No. 2")
            {
            }
            column(CompEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompPage; CompanyInformation."Home Page")
            {
            }
            /* column(CompPin; CompanyInformation."Company P.I.N")
            {
            } */
            column(Pic; CompanyInformation.Picture)
            {
            }
            column(CompRegNo; CompanyInformation."Company P.I.N")
            {
            }
            column(PerName; PRLPayrollPeriods."Period Name")
            {
            }
            column(pfNo; "HRM-Employee (D)"."No.")
            {
            }
            column(EmpPin; "HRM-Employee (D)"."PIN Number")
            {
            }
            column(EmpId; "HRM-Employee (D)"."ID Number")
            {
            }
            column(FName; "HRM-Employee (D)"."First Name")
            {
            }
            column(MName; "HRM-Employee (D)"."Middle Name")
            {
            }
            column(LName; "HRM-Employee (D)"."First Name")
            {
            }

            column(EmployeeAmount; PRLPeriodTransactions.Amount)
            {
            }
            column(EmployerAmount; PRLEmployerDeductions.Amount)
            {
            }
            column(NHIFNo; "HRM-Employee (D)"."NHIF No.")
            {
            }
            column(Gtot; Gtoto)
            {
            }
            column(SaccoSh; SaccoSh)
            {
            }
            column(SaccoLoanRep; SaccoLoanRep)
            {
            }
            column(LoanInt; LoanInt)
            {
            }
            column(XmasSav; XmasSav)
            {
            }
            column(PapoUpesi; PapoUpesi)
            {
            }
            column(region; "HRM-Employee (D)".Region)
            {
            }
            column(seq; seq)
            {
            }
            column(NssFNo; "HRM-Employee (D)"."NSSF No.")
            {
            }
            column(CurrGross; CurrGross)
            {
            }
            column(TotalNssf; TotalNssf)
            {

            }
            column(NSSFAmount; NSSFAmount) { }

            trigger OnAfterGetRecord()
            begin
                Clear(SaccoSh);
                Clear(SaccoLoanRep);
                Clear(LoanInt);
                Clear(XmasSav);
                Clear(PapoUpesi);
                Clear(CurrGross);
                Clear(NSSFAmount);
                //Shares
                PRLPeriodTransactions.Reset;
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Transaction Code", 'NSSF(I)');
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Group Text", 'STATUTORIES');
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Payroll Period", datefilter);
                IF PRLPeriodTransactions.Find('-') then begin
                    NSSFAmount := (PRLPeriodTransactions.Amount);
                    TotalNssf := (PRLPeriodTransactions.Amount * 2);
                end;

                //Gross
                PRLPeriodTransactions.Reset;
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Transaction Code", 'GPAY');
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Payroll Period", datefilter);
                if PRLPeriodTransactions.Find('-') then begin
                    CurrGross := PRLPeriodTransactions.Amount;
                end;
                /*
                //Loan Interest
                PRLPeriodTransactions.RESET;
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee (D)"."No.");
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'INT001');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                LoanInt:=PRLPeriodTransactions.Amount;
                  END;
                
                //Xmas Savings
                PRLPeriodTransactions.RESET;
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee (D)"."No.");
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'XMA001');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                XmasSav:=PRLPeriodTransactions.Amount;
                  END;
                
                //Papo & Upesi
                PRLPeriodTransactions.RESET;
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee (D)"."No.");
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'PAP001');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                PapoUpesi:=PRLPeriodTransactions.Amount;
                  END;
                
                */

                Gtoto := NSSFAmount;//+PRLEmployerDeductions.Amount;
                if Gtoto = 0 then CurrReport.Skip else seq := seq + 1;

            end;

            trigger OnPreDataItem()
            begin
                "HRM-Employee (D)".SetFilter("HRM-Employee (D)"."Posting Group", '%1', 'PAYROLL');
                // "HRM-Employee (D)".SetFilter("Employee Category", '<>%1', 'FT');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(DateFil; datefilter)
                {
                    ApplicationArea = all;
                    Caption = 'Date Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";
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

    trigger OnInitReport()
    begin
        PRLPayrollPeriods.Reset;
        PRLPayrollPeriods.SetRange(PRLPayrollPeriods.Closed, false);
        if PRLPayrollPeriods.Find('-') then begin
            datefilter := PRLPayrollPeriods."Date Opened";
        end;

        if CompanyInformation.Get() then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        Clear(Gtoto);
        Clear("Tot-SaccoSh");
        Clear("Tot-SaccoLoanRep");
        Clear("Tot-LoanInt");
        Clear("Tot-XmasSav");
        Clear("Tot-PapoUpesi");
        Clear(seq);
    end;

    trigger OnPreReport()
    begin
        if datefilter = 0D then Error('Specify the Period Date');
        //"PRL-Period Transactions".SETFILTER("PRL-Period Transactions"."Payroll Period",'=%1',datefilter)
    end;

    var
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        PRLEmployerDeductions: Record "PRL-Employer Deductions";
        Gtoto: Decimal;
        PRLTransactionCodes: Record "PRL-Transaction Codes";
        SaccoSh: Decimal;
        SaccoLoanRep: Decimal;
        LoanInt: Decimal;
        XmasSav: Decimal;
        PapoUpesi: Decimal;
        "Tot-SaccoSh": Decimal;
        "Tot-SaccoLoanRep": Decimal;
        "Tot-LoanInt": Decimal;
        "Tot-XmasSav": Decimal;
        "Tot-PapoUpesi": Decimal;
        HelbAm: Decimal;
        seq: Integer;
        NSSFAmount: Decimal;
        CurrGross: Decimal;
        TotalNssf: Decimal;
}

