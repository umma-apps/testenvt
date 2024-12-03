report 40004 "PT Bank Schedule"
{
    Caption = 'PT Bank Schedule';
    RDLCLayout = './Part Timers/Reports/SSR/PartTimersBankSchedule.rdl';

    dataset
    {
        dataitem(PTClaimLines; PTClaimLines)
        {
            RequestFilterFields = "Batch No";
            column(PFNo; "PF No")
            {
            }
            column(Names; Names)
            {
            }
            column(Faculty; Faculty)
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
            column(Amount; Amount)
            {
            }
            column(netamount; "Net Pay")
            {

            }
            column(bankacc; bankacc)
            {

            }
            column(bankcode; bankcode)
            {

            }
            column(bankName; bankName)
            {

            }
            column(branchName; branchName)
            {

            }
            column(pic; CompInfo.Picture)
            {

            }
            column(CompNames; CompInfo.Name)
            {

            }
            column(branchCode; branchCode)
            {

            }
            trigger OnAfterGetRecord()
            begin

                hrEmp.Reset();
                hrEmp.SetRange("No.", PTClaimLines."PF No");
                if hrEmp.Find('-') then begin
                    bankacc := hrEmp."Bank Account Number";
                    bankcode := hrEmp."Main Bank";
                    bankName := hrEmp."Branch Bank Name";
                    branchName := hrEmp."Main Bank Name";
                    branchCode := hrEmp."Branch Bank";



                end;

            end;
        }
    }
    var
        CompInfo: Record "Company Information";
        //paye, netamount, hlevy : Decimal;
        hrEmp: Record "HRM-Employee (D)";
        bankacc, bankcode, bankName, branchName, branchCode : Text;

    trigger OnInitReport()
    begin
        if CompInfo.Get() then begin
            CompInfo.CalcFields(CompInfo.Picture);
        end;
    end;
}
