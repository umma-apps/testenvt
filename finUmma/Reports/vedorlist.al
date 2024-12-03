report 52178712 "Pre-Qualified Suppliers"
{
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Reports/SSR/preQualSup.rdl';

    dataset
    {
        dataitem(preSup; Vendor)
        {
            RequestFilterFields = "Prequalification Period";
            column(No_preSup; "No.")
            {
            }
            column(Name_preSup; Name)
            {
            }
            column(SpecificCategoryofSupply_preSup; "Specific Category of Supply")
            {
            }
            column(DateofPrequalification_preSup; "Date of Prequalification")
            {
            }
            column(compName; compInfo.Name)
            {

            }
            column(compInfo; compInfo.Picture)
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
            area(processing)
            {
                action(jornal)
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = Report "Journal Validate";

                }
                
            }
        }
    }
    trigger OnInitReport()
    begin
        compinfo.RESET;
        IF compinfo.FIND('-') THEN BEGIN
            compinfo.CALCFIELDS(compinfo.Picture);
        END;
    end;

    var
        myInt: Integer;
        compInfo: Record "Company Information";
}