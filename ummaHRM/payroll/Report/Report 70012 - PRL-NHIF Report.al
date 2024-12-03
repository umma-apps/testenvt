report 70012 "PRL-NHIF Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-NHIF Report.rdl';

    dataset
    {
        dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
        {
            DataItemTableView = WHERE("Transaction Code" = FILTER('NHIF'));
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
                column(seq; seq)
                {

                }
                column(NHIFNo; "HRM-Employee (D)"."NHIF No.")
                {
                }
                column(PerName; PRLPayrollPeriods."Period Name")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PRLEmployerDeductions.Reset;
                    PRLEmployerDeductions.SetRange(PRLEmployerDeductions."Employee Code", "HRM-Employee (D)"."No.");
                    PRLEmployerDeductions.SetRange(PRLEmployerDeductions."Transaction Code", 'NHIF');
                    PRLEmployerDeductions.SetRange(PRLEmployerDeductions."Payroll Period", datefilter);
                    if PRLEmployerDeductions.Find('-') then begin
                    end;

                    PRLPeriodTransactions.Reset;
                    PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                    PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Transaction Code", 'NHIF');
                    PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Payroll Period", datefilter);
                    if PRLPeriodTransactions.Find('-') then begin
                    end else
                        CurrReport.Skip;

                    Gtoto := PRLPeriodTransactions.Amount;//+PRLEmployerDeductions.Amount;
                    if Gtoto = 0 then CurrReport.Skip() else seq := seq + 1;
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
    end;

    var
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        PRLEmployerDeductions: Record "PRL-Employer Deductions";
        Gtoto: Decimal;
        seq: Integer;
        PRLTransactionCodes: Record "PRL-Transaction Codes";
}

