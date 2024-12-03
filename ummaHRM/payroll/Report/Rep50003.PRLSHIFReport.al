report 50014 "PRL SHIF Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-SHIF Report.rdl';
    dataset
    {
        dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
        {
            DataItemTableView = WHERE("Transaction Code" = FILTER('SHIF'));
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
            column(CompRegNo; CompanyInformation."Registration No.")
            {
            }
            column(datefilter; format(datefilter))
            {

            }
            column(periodMonth; periodMonth)
            {

            }
            column(DetDate; DetDate)
            {

            }
            dataitem("HRM-Employee (D)"; "HRM-Employee (D)")
            {
                DataItemLink = "No." = FIELD("Employee Code");
                column(pfNo; "HRM-Employee (D)"."No.")
                {
                }
                column(EmpPin; "HRM-Employee (D)"."PIN Number")
                {
                }
                column(EmpId; "HRM-Employee (D)"."ID Number")
                {
                }
                column(FName; "HRM-Employee (D)"."Last Name")
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
                column(PerName; PRLPayrollPeriods."Period Name")
                {
                }
                column(Home_Phone_Number; "Home Phone Number")
                {

                }
                column(Cellular_Phone_Number; "Cellular Phone Number")
                {

                }
                column(pin; "HRM-Employee (D)"."PIN Number")
                {

                }

                trigger OnAfterGetRecord()
                begin
                    PRLEmployerDeductions.Reset;
                    PRLEmployerDeductions.SetRange(PRLEmployerDeductions."Employee Code", "HRM-Employee (D)"."No.");
                    PRLEmployerDeductions.SetRange(PRLEmployerDeductions."Transaction Code", 'SHIF');
                    PRLEmployerDeductions.SetRange(PRLEmployerDeductions."Payroll Period", datefilter);
                    if PRLEmployerDeductions.Find('-') then begin
                    end;

                    PRLPeriodTransactions.Reset;
                    PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                    PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Transaction Code", 'SHIF');
                    PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Payroll Period", datefilter);
                    if PRLPeriodTransactions.Find('-') then begin
                    end else
                        CurrReport.Skip;

                    Gtoto := PRLPeriodTransactions.Amount;//+PRLEmployerDeductions.Amount;
                end;
            }

            trigger OnPreDataItem()
            begin
                if datefilter = 0D then Error('Specify the Period Date');
                Clear(Gtoto);
                "PRL-Period Transactions".SetFilter("PRL-Period Transactions"."Payroll Period", '=%1', datefilter)
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
    trigger OnInitReport()
    begin
        // PRLPayrollPeriods.Reset;
        // PRLPayrollPeriods.SetRange(PRLPayrollPeriods.Closed, false);
        // if PRLPayrollPeriods.Find('-') then begin
        //     datefilter := PRLPayrollPeriods."Date Opened";
        //     periodMonth := PRLPayrollPeriods.Period;
        // end;
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod.Closed, FALSE);
        IF objPeriod.FIND('-') THEN;
        PeriodFilter := objPeriod."Date Opened";
        if CompanyInformation.Get() then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
    end;

    trigger OnPreReport()
    begin
        SelectedPeriod := PeriodFilter;
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod."Date Opened", SelectedPeriod);
        IF objPeriod.FIND('-') THEN BEGIN
            PeriodName := objPeriod."Period Name";
            CLEAR(DetDate);
            DetDate := FORMAT(objPeriod."Period Name");
        END;
    end;

    var
        periodMonth: code[20];
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        PRLEmployerDeductions: Record "PRL-Employer Deductions";
        Gtoto: Decimal;
        DetDate: Text[100];
        SelectedPeriod: Date;
        PeriodFilter: Date;
        objPeriod: Record "PRL-Payroll Periods";
        PeriodName: Text[30];
        PRLTransactionCodes: Record "PRL-Transaction Codes";
}
