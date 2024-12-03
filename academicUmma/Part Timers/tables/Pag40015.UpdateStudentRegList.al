page 40015 "Update Student Reg List"
{
    ApplicationArea = All;
    Caption = 'Update Student Reg List';
    PageType = List;
    SourceTable = "Update Student Registration";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Reg.Transacton ID"; "Reg.Transacton ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reg.Transacton ID field.', Comment = '%';
                }

                field("Student No"; Rec."Student No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field(Modified; Rec.Modified)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Modified field.', Comment = '%';
                }

            }

        }

    }
    actions
    {
        area(Processing)
        {
            action("Update Student Reg")
            {
                ApplicationArea = All;
                Promoted = true;
                RunObject = report "Update Student Reg";
            }
        }

    }
}
