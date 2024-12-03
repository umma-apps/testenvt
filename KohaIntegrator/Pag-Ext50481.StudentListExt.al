pageextension 50481 "Student List Ext" extends "ACA-Students Card"
{
    actions
    {
        addafter(Register)
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
