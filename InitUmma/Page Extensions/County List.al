page 52178550 "County List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = County;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
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