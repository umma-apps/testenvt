report 40006 "PTClaim File"
{
    ApplicationArea = All;
    Caption = 'PTClaim File';
    RDLCLayout = './Part Timers/Reports/SSR/PartTimersPay.rdl';

    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(PTClaimLines; PTClaimLines)
        {
            RequestFilterFields = Semester, "Batch No";
            column(BatchNo; "Batch No")
            {
            }
            column(Faculty; Faculty)
            {
            }
            column(PFNo; "PF No")
            {
            }
            column(Names; Names)
            {
            }
            column(Amount; Amount)
            {
            }
            column(SchoolName; SchoolName)
            {
            }
            column(Semester; Semester)
            {
            }
            column(Units; Units)
            {
            }
            column(Rate; Rate)
            {
            }
            column(Programz; Programz)
            {
            }
            column(Pic; CompInfo.Picture)
            {

            }
            column(CompName; CompInfo.Name)
            {

            }
            column(paye; "Paye Amount")
            {

            }
            column(netamount; "Net Pay")
            {

            }
            column(hlevy; "Housing Levy")
            {

            }



        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        CompInfo: Record "Company Information";
        //paye, netamount, hlevy : Decimal;
        hrEmp: Record "HRM-Employee (D)";



    trigger OnInitReport()

    begin

        if CompInfo.Get() then begin
            CompInfo.CalcFields(CompInfo.Picture);
        end;


    end;
}
