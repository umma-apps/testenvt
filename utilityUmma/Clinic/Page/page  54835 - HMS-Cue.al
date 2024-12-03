page 54835 "HMS-Cue"
{
    PageType = CardPart;
    SourceTable = "HMS-Cue";

    layout
    {
        area(content)
        {
            cuegroup("Registration Statistics")
            {
                Caption = 'Registration Statistics';
                field(Students; Rec.Students)
                {
                    Caption = 'Students';
                    DrillDownPageID = "HMS-Patient Student List";
                    ApplicationArea = All;
                }
                field(Employees; Rec.Employees)
                {
                    Caption = 'Employees';
                    DrillDownPageID = "HMS-Patient Employee List";
                    ApplicationArea = All;
                }
                field(Dependants; Rec.Dependants)
                {
                    Caption = 'Dependants';
                    DrillDownPageID = "HMS-Patient Relative List";
                    ApplicationArea = All;
                }
                field(InactiveEmp; Rec."Other Patients")
                {
                    Caption = 'Other Patients';
                    DrillDownPageID = "HMS-Patient Others List";
                    ApplicationArea = All;
                }
            }
        }
    }


    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        rec.Reset();
        if not rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;
    end;

}

