report 50005 "PRL-Paye Schedule"
{
    Caption = 'PRL-Paye Schedule';
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    RDLCLayout = './payroll/Report/SSR/PRL-Paye Schedule1.rdl';

    dataset
    {
        dataitem(HRMEmployeeD; "HRM-Employee (D)")
        {
            column(No; "No.")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(EmployeeCategory; "Employee Category")
            {
            }
            column(SalaryGrade; "Salary Grade")
            {
            }
            column(PayrollNname; PayrollNname) { }
            column(Seq; Seq) { }
            column(InfoName; Info.Name) { }
            column(InfoTell; Info."Phone No.") { }
            column(Adress; Info.Address) { }
            column(PostalCode; Info."Post Code") { }
            column(City; Info.city) { }
            column(WebSite; Info."Home Page") { }
            column(PayeAmount; PayeAmount) { }

            trigger OnPreDataItem()
            begin
                //  PrlPeriodTransactions.SetFilter("Payroll Period", '%1', PeriodFilter);
                If PrlPeriodTransactions.Get(PrlpayrollPeriod."Date Opened") then
                    PayrollNname := PrlpayrollPeriod."Period Name";
                HRMEmployeeD.SetFilter(HRMEmployeeD."Posting Group", '%1', 'PAYROLL');
            end;

            trigger OnAfterGetRecord()


            begin

                Info.get();
                info.CalcFields(Picture);
                //Seq := Seq + 1;
                Clear(PayeAmount);
                PRLPeriodTransactions.Reset;
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Employee Code", HRMEmployeeD."No.");
                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Transaction Code", 'PAYE');

                PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Payroll Period", PeriodFilter);
                IF PRLPeriodTransactions.Find('-') then begin
                    PayeAmount := (PRLPeriodTransactions.Amount);

                end;
                if PayeAmount = 0 then CurrReport.Skip else seq := seq + 1;


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
                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = all;
                        TableRelation = "PRL-Payroll Periods"."Date Opened";
                    }
                }


            }
        }

    }
    trigger OnInitReport()
    begin
        Clear(PayeTotal);
        Clear(seq);
    end;


    var
        PeriodFilter: Date;
        PrlpayrollPeriod: Record "PRL-Payroll Periods";
        PayrollNname: Text[100];
        Info: Record 79;
        Seq: Integer;
        PayeTotal: Decimal;
        PayeAmount: Decimal;
        PrlPeriodTransactions: Record "PRL-Period Transactions";

}
