report 66679 "Bachelors Admission Letter"
{

    ApplicationArea = All;
    RDLCLayout = './Reports/SSR/bachelorsAdmissionLetter.rdl';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(bAdmLetter; "ACA-Applic. Form Header")
        {
            column(Admission_No; "Admission No")
            {

            }
            column(Application_No_; "Application No.")
            {

            }
            column(programName; programName)
            {

            }
            column(Programme_Faculty; "Programme Faculty")
            {

            }
            column(Faculty_Name; "Faculty Name")
            {

            }
            column(Application_Date; format("Application Date"))
            {

            }
            column(Other_Names; "Other Names")
            {

            }
            column(First_Name; "First Name")
            {

            }
            column(Surname; Surname)
            {

            }
            column(First_Degree_Choice; "First Degree Choice")
            {

            }
            column(CompanyInformation; CompanyInformation.Picture)
            {

            }
            column(Fee_payable; "Fee payable")
            {

            }
            column(Reporting_date; "Reporting date")
            {

            }
            column(fee; format(fee))
            {

            }
            column(Intake_Code; "Intake Code")
            {

            }
            column(Date_of_Admission; format("Date of Admission"))
            {

            }
            column(name; CompanyInformation.Name)
            {

            }
            column(faculty; faculty)
            {

            }
            column(Settlement_Type; "Settlement Type")
            {

            }
            column(oriDate; oriDate)
            {

            }
            column(regdate; regdate)
            {

            }
            column(appDate; appDate)
            {

            }
            column(Campus; Campus)
            {

            }
            column(campusText; campusText)
            {

            }
            column(department; department)
            {

            }
            column(campCode; campCode)
            {

            }
            column(ReportingDate; ReportingDate)
            {

            }


            trigger OnAfterGetRecord()
            begin
                prog.Reset();
                prog.SetRange(Code, bAdmLetter."First Degree Choice");
                if prog.Find('-') then begin
                    department := prog."Department Name";
                    faculty := prog."Faculty Name";
                end;
                campusN.Reset();
                campusN.SetRange("Dimension Code", 'CAMPUS');
                campusN.SetRange(Code, bAdmLetter.Campus);
                if campusN.Find('-') then begin
                    campCode := campusN.Name;
                end;

                // progFee.Reset();
                // progFee.SetRange(progFee.ProgCode, bAdmLetter."First Degree Choice");
                // progFee.SetRange(progFee.ModeOfstudy, bAdmLetter."Settlement Type");
                // progFee.SetRange(progFee.Campus, bAdmLetter.Campus);
                // if progFee.Find('-') then begin
                //     fee := progFee.intakeFee;
                // end
                // else
                //     Error('No Fee Defined on Intake Setup');
                // prog.reset();
                // prog.SetRange(prog.Code, bAdmLetter."First Degree Choice");
                // if prog.find('-') then begin
                //     faculty := prog."Faculty Name";
                // end
                // else
                //     error('Program Faculty Name Not Defined');
                Intake.Reset();
                Intake.SetRange(Intake."Code", bAdmLetter."Intake Code");
                Intake.SetRange(Intake.Level, bAdmLetter."Programme Level");
                if Intake.Find('-') then begin
                    ReportingDate := Format(Intake."Reporting Date", 0, 4);
                    regdate := Format(Intake."Reporting End Date", 0, 4);
                    appDate := Format("Application Date", 0, 4);
                    oriDate := Format(Intake."Orientation Date", 0, 4);
                end
                else
                    Error('No Date Defined on Intake Setup');
                // if Campus = 'LANGATA' then
                //     campusText := langatatext
                // else
                //     campusText := gabatext;
            end;



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
        campCode: Text;
        CompanyInformation: Record "Company Information";
        progFee: Record "ACA-ProgramIntakeFee";
        fee: Decimal;
        Intake: Record "ACA-Intake";
        ReportingDate: Text;
        prog: Record "ACA-Programme";
        faculty: text[200];
        Dimn: Record "Dimension Value";
        oriDate: Text;
        regdate: Text;
        appDate: Text;
        gabatext: Label 'Main Hall - Gaba Campus';
        //oritext: Label '';

        campusText: text[200];
        department: Text;
        campusN: Record "Dimension Value";




    // trigger OnPreReport()
    // begin

    // end;




}