pageextension 52178550 "Bank Account Card Ext" extends "Bank Account Card"
{
    layout
    {
        addafter("Bank Account No.")
        {
            field("Receipt No. Series"; Rec."Receipt No. Series")
            {
                ApplicationArea = All;
            }
            field("Bank Type"; Rec."Bank Type")
            {
                ApplicationArea = All;
            }
        }
    }
}