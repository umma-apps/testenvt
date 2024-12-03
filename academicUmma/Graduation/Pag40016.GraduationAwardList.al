page 40016 "Graduation Award List"
{
    Caption = 'Graduation Award List';
    PageType = List;
    SourceTable = "Graduation Award List";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry Number"; Rec."Entry Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry Number field.', Comment = '%';
                }
                field("Student Number"; Rec."Student No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Number field.', Comment = '%';
                }
                field("Sur Name"; Rec."Sur Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sir Name field.', Comment = '%';
                }
                field("Middle Name "; Rec."Middle Name ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.', Comment = '%';
                }
                field("Last Name "; Rec."Last Name ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field("Campus "; Rec."Campus ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Campus field.', Comment = '%';
                }
                field("Graduation Year"; Rec."Graduation Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Graduation Year field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field("Program"; Rec."Program")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Program field.', Comment = '%';
                }
                field(Faculty; Rec.Faculty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Faculty field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Email; rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Phone_Number; rec.Phone_Number)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }

            }
        }
    }
}
