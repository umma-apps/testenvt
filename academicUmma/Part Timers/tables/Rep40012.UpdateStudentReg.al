report 40012 "Update Student Reg"
{
    ApplicationArea = All;
    Caption = 'Update Student Reg';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(UpdateStudentRegistration; "Update Student Registration")
        {
            RequestFilterFields = "Student No", "Semester";
            column(StudentNo; "Student No")
            {
            }
            column(Semester; Semester)
            {
            }
            column(sn; sn)
            {

            }
            trigger OnAfterGetRecord()
            begin
                sn := sn + 1;
                UpstudReg.reset;
                UpstudReg.SetRange(Modified, false);
                UpstudReg.SetRange("Student No", UpdateStudentRegistration."Student No");
                if UpstudReg.FindSet() then begin
                    repeat
                        Creg.reset;
                        Creg.SetRange(Creg."Student No.", UpstudReg."Student No");
                        Creg.SetRange(Creg."Reg. Transacton ID", UpstudReg."Reg.Transacton ID");
                        if Creg.FindSet() then begin
                            Creg.Posted := true;
                            Creg.Modify;
                        end;
                        UpstudReg.Modified := true;
                        UpstudReg.Modify;
                    until UpstudReg.Next = 0;
                end;
                Message('Update Complete');

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
    var
        sn: Integer;
        Creg: Record "ACA-Course Registration";
        UpstudReg: Record "Update Student Registration";
}
