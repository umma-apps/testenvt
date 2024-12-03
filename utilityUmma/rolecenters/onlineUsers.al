page 86011 OnlineUsers
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = OnlineUsers;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(DoB; Rec.DoB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DoB field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email Address field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No field.';
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