page 85547 "Historical Payroll Data"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PRL-Historical";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(StaffNo; Rec.StaffNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the StaffNo field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(TransactionCode; Rec.TransactionCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TransactionCode field.';
                }
                field(TransactionName; Rec.TransactionName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TransactionName field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(periodMonth; Rec.periodMonth)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the periodMonth field.';
                }
                field(periodYear; Rec.periodYear)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the periodYear field.';
                }
                // field(lineNo; Rec.lineNo)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the lineNo field.';
                // }
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
        //     action(Import)
        //     {
        //         ApplicationArea = All;
        //         RunObject = xmlport "Import PRL data";
        //     }
        }
    }
}