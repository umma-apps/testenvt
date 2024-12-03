page 52178782 bufferpage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = bufferTable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(docno; Rec.docno)
                {
                    ApplicationArea = All;
                }
                field("date"; Rec."date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the date field.';
                }
                field(description; Rec.description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the description field.';
                }
                field(fiscalyr; Rec.fiscalyr)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the fiscalyr field.';
                }
                field(glAcc; Rec.glAcc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the glAcc field.';
                }
                field(jnlRef; Rec.jnlRef)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the jnlRef field.';
                }
                field(jnldesc; Rec.jnldesc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the jnldesc field.';
                }
                field(transAmount; Rec.transAmount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the transAmount field.';
                }
                field(exist;Rec.exist)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the exist field.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}