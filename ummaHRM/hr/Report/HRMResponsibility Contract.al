/// <summary>
/// Report Responsibility Contract (ID 50124).
/// </summary>
report 50124 "HRMResponsibility Contract"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Report/SSR/HRMresponsibilityContract.rdl';
    ApplicationArea = Basic, Suite;
    Caption = 'Responsibility Contract';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(responsibilityContract; 61192)
        {
            column(Payroll_Number; "Payroll Number")
            {

            }
            column(Responsibility_Description; "Responsibility Description")
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Department_Code; "Department Code")
            {

            }
            column(Expiry_Notificaion_date; "Expiry Notificaion date")
            {

            }
            column(Department; Department)
            {

            }
            column(Faculty_Code; "Faculty Code")
            {

            }
            column(From_Date; "From Date")
            {

            }
            column(To_Date; "To Date")
            {

            }
            column(Pic; CompanyInformation.Picture)
            {
            }
            column(Name; CompanyInformation.Name)
            {

            }
        }
    }

    requestpage
    {
        layout
        {

        }

        actions
        {

        }
    }
    trigger OnInitReport()
    begin
        if CompanyInformation.Get() then begin
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        end;
    end;

    var
        myInt: Integer;
        CompanyInformation: Record "Company Information";

}