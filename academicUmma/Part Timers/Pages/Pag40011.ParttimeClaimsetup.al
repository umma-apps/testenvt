page 40011 "Parttime Claim setup"
{
    Caption = 'Parttime Claim setup';
    PageType = Document;
    SourceTable = "PartTine Claims SetUp";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Hosing Levy G/l"; Rec."Hosing Levy G/l")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hosing Levy G/l field.', Comment = '%';
                }
                field("Paye G/l"; Rec."Paye G/l")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paye G/l field.', Comment = '%';
                }


                field("Housing Levy%"; Rec."Housing Levy%")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Housing Levy% field.', Comment = '%';
                }
                field("Housing levy Relief%"; Rec."Housing levy Relief%")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Housing levy Relief% field.', Comment = '%';
                }
                field("Gross Amount g/L"; Rec."Gross Amount g/L")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gross Amount g/L field.', Comment = '%';

                }
                field("Other deduction G/l"; Rec."Other deduction G/l")
                {
                    ApplicationArea = All;

                }
                field("NetPay G/l "; Rec."NetPay G/l ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NetPay G/l field.', Comment = '%';
                }
                field("netPay%"; Rec."netPay%")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the netPay% field.', Comment = '%';
                }
            }
        }
    }
}
