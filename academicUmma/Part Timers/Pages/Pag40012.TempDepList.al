page 40012 "Temp Dep List"
{
    ApplicationArea = All;
    Caption = 'Temp Dep List';
    PageType = List;
    SourceTable = TempDeptSums;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Department Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gross Amount field.', Comment = '%';
                }
                field("Housing Levy"; Rec."Housing Levy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Housing Levy field.', Comment = '%';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net Pay field.', Comment = '%';
                }
                field("Other Deductions"; Rec."Other Deductions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Deductions field.', Comment = '%';
                }
                field("Paye Amount"; Rec."Paye Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paye Amount field.', Comment = '%';
                }
            }
        }
    }
}
