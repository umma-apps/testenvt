page 40006 "PTClaims Header"
{
    Caption = 'PTClaims Header';
    PageType = List;
    CardPageId = "PTClaimsHeader";
    SourceTable = "PT Claims Header";

    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Batch No"; Rec."Batch No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch No field.', Comment = '%';
                }
                field(Semster; Rec.Semster)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semster field.', Comment = '%';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Date Generated"; Rec."Date Generated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Generated field.', Comment = '%';
                }
            }
        }
    }
}
