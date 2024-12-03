report 40008 "Exam Transcript"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/provTranscript2.rdl';

    dataset
    {
        dataitem(examResults; "ACA-Student Units")

        {
            RequestFilterFields = "Student No.", Semester;
            column(Student_No_; "Student No.")
            {

            }
            column(Student_Name; "Student Name")
            {

            }
            column(Semester; Semester)
            {

            }
            column(Campus_Code; "Campus Code")
            {

            }
            column(Unit; Unit)
            {

            }
            column(Stage; Stage)
            {

            }
            column(Description; Description)
            {

            }
            column(CATs_Marks; "CATs Marks")
            {

            }
            column(Exam_Marks; "Exam Marks")
            {

            }
            column(Total_Score; "Total Score")
            {

            }
            column(Grade; Grade)
            {

            }
            column(Pic; CompanyInformation.Picture)
            {

            }
            column(CompName; CompanyInformation.Name)
            {

            }
            column(Academic_Year; "Academic Year")
            {

            }
            column(progName; progName)
            {

            }
            column(facultyName; facultyName)
            {

            }
            column(credit; credit)
            {
                
            }
            trigger OnAfterGetRecord()
            begin
                prog.Reset();
                prog.SetRange(Code, examResults.Programme);
                if prog.Find('-') then begin
                    progName := prog.Description;
                    facultyName := prog."Faculty Name";
                end;
                unitsSub.Reset();
                unitsSub.SetRange(Code, examResults.Unit);
                if unitsSub.Find('-') then begin
                    credit := unitsSub."Credit Hours";
                end;
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
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
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
        progName, facultyName : Text;
        credit: Decimal;
        CompanyInformation: Record 79;
        prog: Record "ACA-Programme";
        unitsSub: Record "ACA-Units/Subjects";
}