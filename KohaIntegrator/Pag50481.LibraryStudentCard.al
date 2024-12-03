page 50481 "Library Student Card"
{
    Caption = 'Library Student List';
    SourceTable = Customer;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; "No.")
                {
                }
                field(Name; Name)
                {
                }
                field(Balance; Balance)
                {
                }
                field(Address; Address)
                {
                }
                field("Address 2"; "Address 2")
                {
                    CaptionML = ENU = 'Town';
                }
                field("Phone No."; "Phone No.")
                {
                }
                field(Gender; Gender)
                {
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                }
                field(Status; Status)
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Send to Koha")
            {
                ApplicationArea = All;
                Image = LiFo;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    KohaHandler: Codeunit "Koha Handler";
                begin
                    KohaHandler.createStudentPatron(Rec);
                end;
            }
        }
    }
}
