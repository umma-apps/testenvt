report 50003 "Umma Deduction  Report"
{
    UsageCategory = Administration;
    Caption = 'Umma Deduction  Report';
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-Deductions Summary3.rdl';

    dataset
    {
        dataitem("PRL-Transaction Codes"; "PRL-Transaction Codes")
        {
            RequestFilterFields = "Combination Type";
            DataItemTableView = sorting("Transaction Name") order(ascending);
            column(Transaction_Code; "Transaction Code")
            {

            }
            column(Transaction_Name; "Transaction Name")
            {

            }
            column(ReportName; "Combination Type") { }
            column(InfoName; Info.Name) { }
            column(InfoTel; Info."Phone No.") { }
            Column(InfoWb; Info."Home Page") { }
            Column(InfoLogo; Info.Picture) { }
            column(Adress; 'P.O BOX' + ' ' + Info.Address + '-' + Info."Post Code" + ' ' + Info.City + ' ' + 'KENYA') { }
            column(Email; Info."E-Mail") { }
            column(PeriodName; PeriodName) { }

            column(EmpName; EmpName) { }
            dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
            {
                DataItemLink = "Transaction Code" = field("Transaction Code");
                column(PlrTcode; "Transaction Code") { }
                column(Employee_Code; "Employee Code") { }
                column(Amount; Amount) { }
                column(sn; sn) { }
                trigger OnPreDataItem()
                begin
                    "PRL-Period Transactions".SetFilter("PRL-Period Transactions"."Payroll Period", '%1', periods);
                end;

                trigger OnAfterGetRecord()
                begin
                    info.get();
                    info.CalcFields(Picture);
                    PrlPeriod.RESET;
                    PrlPeriod.SetRange(PrlPeriod."Date Opened", periods);
                    IF PrlPeriod.Find('-') THEN
                        PeriodName := PrlPeriod."Period Name";



                    sn := sn + 1;
                    //Clear(EmpName);
                    HrEmp.reset;

                    HrEmp.SetRange("No.", "PRL-Period Transactions"."Employee Code");
                    HrEmp.SetFilter("Posting Group", '%1', 'PAYROLL');
                    if HrEmp.Find('-') then begin
                        EmpName := HrEmp."First Name" + '' + HrEmp."Middle Name" + '' + HrEmp."Last Name";
                    end;
                    IF "PRL-Period Transactions".Amount = 0 THEN CurrReport.Skip();
                end;

            }



        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {

                field(Period; periods)
                {
                    ApplicationArea = all;
                    Caption = 'Period:';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";
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
        HrEmp: record "HRM-Employee (D)";
        EmpName: Text[250];
        periods: Date;
        sn: Integer;
        info: Record 79;
        PeriodName: Text[100];
        PrlPeriod: record "PRL-Payroll Periods";
}
