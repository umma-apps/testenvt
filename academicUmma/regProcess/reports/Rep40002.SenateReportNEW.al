report 40002 "Senate Report(NEW)"
{
    Caption = 'Senate Report(NEW)';
    RDLCLayout = './Reports/SSR/senateReport(New).rdl';
    dataset
    {
        dataitem(Senate; "Senate Report New")
        {
            RequestFilterFields = Semester, Programme;
            DataItemTableView = sorting(Stage);
            //PrintOnlyIfDetail = true;

            //DataItemTableView = where(Status = filter('Pass'));
            column(Student_No_; "Student No.")
            {

            }
            column(Student_Name; "Student Name")
            {

            }
            column(Average; Average)
            {

            }

            column(pic; CompInfo.Picture)
            {

            }
            column(name; CompInfo.Name)
            {

            }

            column(PassListCount; PassListCount)
            {

            }
            column(progName; progName)
            {

            }
            column(departName; departName)
            {

            }
            column(facultyName; facultyName)
            {

            }
            column(seq; seq)
            {

            }
            column(currSem; currSem)
            {

            }
            column(currAcad; currAcad)
            {

            }
            column(Status; Status)
            {

            }
            column(failList; failList)
            {

            }
            column(Stage; Stage)
            {

            }
            column(Grade; Grade)
            {

            }
            column(supCount; supCount)
            {

            }
            column(retakeCount; retakeCount)
            {

            }

            trigger OnAfterGetRecord()
            begin
                ///Senate.Reset();
                //Senate.SetRange(Status, Senate.Status::Pass);
                ///if Senate.Find('-') then begin
                //seq := seq + 1;
                senateList.Reset();
                senateList.SetRange(Status, 'PASS');
                senateList.SetRange(Semester, Senate.Semester);
                senateList.SetRange(Programme, Senate.Programme);
                if senateList.Find('-') then begin
                    PassListCount := senateList.Count();
                end;
                senateList.Reset();
                senateList.SetRange(Status, 'FAIL');
                senateList.SetRange(Semester, Senate.Semester);
                senateList.SetRange(Programme, Senate.Programme);
                if senateList.Find('-') then begin
                    failList := senateList.Count();
                end;
                specialsup.Reset();
                specialsup.SetRange(Programme, Senate.Programme);
                specialsup.SetRange(Catogory, specialsup.Catogory::Supplementary);
                specialsup.SetRange(Semester, Senate.Semester);
                if specialsup.Find('-') then begin
                    Clear(uniqueStudNo);
                    repeat
                        // Check if the student number is already in the list
                        if not uniqueStudNo.Contains(specialsup."Student No.") then begin
                            // If not, add it to the list
                            uniqueStudNo.Add(specialsup."Student No.");
                        end;
                        supCount := uniqueStudNo.Count();
                    until specialsup.Next() = 0;
                end;
                specialsup.Reset();
                specialsup.SetRange(Programme, Senate.Programme);
                specialsup.SetRange(Catogory, specialsup.Catogory::Retake);
                specialsup.SetRange(Semester, Senate.Semester);
                if specialsup.Find('-') then begin
                    Clear(uniqueStudNo);
                    repeat
                        // Check if the student number is already in the list
                        if not uniqueStudNo.Contains(specialsup."Student No.") then begin
                            // If not, add it to the list
                            uniqueStudNo.Add(specialsup."Student No.");
                        end;
                        retakeCount := uniqueStudNo.Count();
                    until specialsup.Next() = 0;

                end;
                prog.Reset();
                prog.SetRange(Code, Senate.Programme);
                if prog.Find('-') then begin
                    progName := prog.Description;
                    departName := prog."Department Name";
                    facultyName := prog."Faculty Name";
                end;
                currSem := GetCurrentSemester(Senate.Semester);
                currAcad := GetCurrentYear();
                ///end;




                //studUnits.SetRange();
            end;
        }
        dataitem("Aca-Special Exams Details"; "Aca-Special Exams Details")
        {
            //DataItemLink = Programme = field(Programme);
            RequestFilterFields = Programme;
            DataItemTableView = sorting(Stage);
            column(StudNo; "Student No.")
            {

            }
            column(Semester; Semester)
            {

            }
            column(Unit_Code; "Unit Code")
            {

            }
            column(StageUnits; Stage)
            {

            }
            column(Programme; Programme)
            {

            }
            column(Catogory; Catogory)
            {

            }
            column(custName; custName)
            {

            }

            trigger OnAfterGetRecord()
            begin
                cust.Reset();
                cust.SetRange("No.", "Aca-Special Exams Details"."Student No.");
                if cust.Find('-') then begin
                    custName := cust.Name;
                end;

            end;
        }
    }
    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(General)
    //             {
    //                 field(Programmez; "Aca-Special Exams Details".Programme)
    //                 {
    //                     ApplicationArea = All;
    //                     TableRelation
    //                 }

    //             }
    //         }
    //     }
    // }
    trigger OnInitReport()
    begin

        if CompInfo.Get() then begin
            CompInfo.CalcFields(CompInfo.Picture);
        end;



    end;

    var
        studUnits: Record "ACA-Student Units";
        senateList: Record "Senate Report New";
        gender: Option;
        CompInfo: Record "Company Information";
        CurrentYr: Record "ACA-Academic Year";
        CurrentSem: Record "ACA-Semesters";
        currSem: Text;
        currAcad, custName : Text;
        seq, PassListCount, failList, supCount, retakeCount : Decimal;
        prog: Record "ACA-Programme";
        progName, departName, facultyName : text;
        cust: Record Customer;
        specialsup: Record "Aca-Special Exams Details";
        uniqueStudNo: List of [Text];



    procedure GetCurrentYear() Message: Text
    begin
        CurrentYr.RESET;
        CurrentYr.SETRANGE(Current, TRUE);
        IF CurrentYr.FIND('-') THEN BEGIN
            Message := CurrentYr.Code;
        END;
    end;

    procedure GetCurrentSemester(sem: code[20]) Message: Text
    begin
        CurrentSem.RESET;
        CurrentSem.SETRANGE("Code", sem);
        IF CurrentSem.FIND('-') THEN BEGIN
            Message := CurrentSem.Code;
        END;
    end;

}
