report 40007 "ACA-Applicants Summary"
{
    Caption = 'ACA-Applicants Summary';
    RDLCLayout = './Reports/SSR/aca-ApplicantsSummary.rdl';
    dataset
    {
        dataitem(ACAApplicFormHeader; "ACA-Applic. Form Header")
        {
            RequestFilterFields = "First Degree Choice", "Intake Code", "Application Date";
            column(Pic; CompanyInformation.Picture)
            {

            }
            column(name; CompanyInformation.Name)
            {

            }
            column(Application_No_; "Application No.")
            {

            }
            column(First_Name; "First Name")
            {

            }
            column(Other_Names; "Other Names")
            {

            }
            column(Surname; Surname)
            {

            }
            column(Gender; Gender)
            {

            }
            column(Date_Of_Birth; Format("Date Of Birth"))
            {

            }
            column(Nationality; Nationality)
            {

            }
            column(ID_Number; "ID Number")
            {

            }
            column(Passport_Number; "Passport Number")
            {

            }
            column(Religion; Religion)
            {

            }
            column(Telephone_No__1; "Telephone No. 1")
            {

            }
            column(Telephone_No__2; "Telephone No. 2")
            {

            }
            column(Programme_Level; "Programme Level")
            {

            }
            column(Intake_Code; "Intake Code")
            {

            }
            column(First_Degree_Choice; "First Degree Choice")
            {

            }
            column(programName; programName)
            {

            }
            column(Programme_Faculty; "Programme Faculty")
            {

            }
            column(Mode_of_Study; "Mode of Study")
            {

            }
            column(Campus; Campus)
            {

            }
            column(Index_Number; "Index Number")
            {

            }
            column(Year_of_Examination; "Year of Examination")
            {

            }
            column(Examination; Examination)
            {

            }
            column(Mean_Grade_Acquired; "Mean Grade Acquired")
            {

            }
            column(Knew_College_Thru; "Knew College Thru")
            {

            }
            column(seq; seq)
            {

            }
            trigger OnAfterGetRecord()
            begin
                seq := seq + 1;
            end;
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
    trigger OnInitReport()
    begin
        CompanyInformation.RESET;
        IF CompanyInformation.FIND('-') THEN BEGIN
            CompanyInformation.CALCFIELDS(Picture);
        END;
    end;


    var
        seq: Integer;
        CompanyInformation: Record "Company Information";
}
