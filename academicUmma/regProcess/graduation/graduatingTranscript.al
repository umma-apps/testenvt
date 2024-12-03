report 86627 "Final Graduation Transcript2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/testReport2.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Final Exam Result2")
        {
            RequestFilterFields = StudentID;
            column(ExamEntry; ExamEntry)
            {
            }
            column(ProgrammeID; ProgrammeID)
            {
            }
            column(programName; programName)
            {

            }
            column(AcademicYr; AcademicYr)
            {
            }
            column(Session; Session)
            {
            }
            column(StudentName; StudentName)
            {

            }
            column(StudentID; StudentID)
            {
            }
            column(UnitCode; UnitCode)
            {
            }
            column(UnitDesc; UnitDesc)
            {
            }
            column(MeanScore; MeanScore)
            {
            }
            column(MeanGrade; MeanGrade)
            {
            }
            column(Name; Name)
            {
            }
            column(Programme; Programme)
            {
            }
            column(Faculty; Faculty)
            {
            }
            column(Pname; Pname)
            {
            }
            column(CreditUnit; CreditUnit)
            {
            }
            column(Weight; Weight)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields(StudentName, programName);
                Name := '';
                cust.Reset();
                Cust.SETRANGE("No.", FinalExamResult.StudentID);
                IF Cust.FIND('-')
                   THEN BEGIN

                    // Total := Cust.COUNT;
                    Name := Cust."First Name" + ' ' + Cust."Middle Name" + ' ' + cust."Last Name";
                    Programme := Cust."Current Programme";
                    //Total := Total+1;
                END
                ELSE
                    Name := 'A man has no Name';

                Programmes.SETRANGE(Code, Programme);
                IF Programmes.FIND('-') THEN
                    Pname := Programmes.Description



                // MESSAGE(Programmes.Name);
                ELSE
                    Pname := 'No Program';
                Programmes.SETRANGE(Code, Programme);
                IF Programmes.FIND('-') THEN
                    Faculty := Programmes.Faculty



                // MESSAGE(Programmes.Name);
                ELSE
                    Pname := 'No Program';

                //IF FinalExamResult.MeanScore = '' THEN
                //CurrReport.SKIP
            end;

            trigger OnPreDataItem()
            begin
                // TESTFIELD("Final Exam Results".StudentID);
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

    labels
    {
    }

    var
        Name: Text[250];
        Programme: Code[250];
        Faculty: Code[250];
        Cust: Record Customer;
        Programmes: Record "ACA-Programme";
        Pname: Text[250];
        TotalQP: Decimal;
        TotalCHR: Decimal;
        FinalMean: Decimal;
        Grade: Code[10];
        FinalExamResult: Record "Final Exam Result2";
}

