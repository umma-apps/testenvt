pageextension 52178551 "Vendor Card Ext." extends "Vendor Card"
{
    layout
    {
        addafter(Blocked)
        {

            field("Campus Code"; Rec."Campus Code")
            {
                ToolTip = 'Specifies the value of the Campus Code field.';
                ApplicationArea = All;
            }
            field("Date of Prequalification"; Rec."Date of Prequalification")
            {
                ToolTip = 'Specifies the value of the Date of Prequalification field.';
                ApplicationArea = All;
            }
            field("Gen Category Of Supply Code";Rec."Gen Category Of Supply Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of general Category of Supply';
            }
            field("Specific Cat. of Supply Code"; Rec."Specific Cat. of Supply Code")
            {
                ToolTip = 'Specifies the value of the Specific Category of Supply Code field.';
                ApplicationArea = All;
            }
            field("Specific Category of Supply"; Rec."Specific Category of Supply")
            {
                ToolTip = 'Specifies the value of the Specific Category of Supply field.';
                ApplicationArea = All;
            }
            field("Prequalification Period";Rec."Prequalification Period")
            {
                ToolTip = 'specifies pre qualification period';
                ApplicationArea = All;
            }

        }
        addafter("Disable Search by Name")
        {

            field(Status; Rec.Status)
            {
                ToolTip = 'Specifies the value of the Status field.';
                ApplicationArea = All;
            }
        }
        addafter(Contact)
        {
            group("Contact Persons")
            {

                field("Contact Person"; Rec."Contact Person")
                {
                    ToolTip = 'Specifies the value of the Contact Person field.';
                    ApplicationArea = All;
                }
                field("Contact Person Mobile"; Rec."Contact Person Mobile")
                {
                    ToolTip = 'Specifies the value of the Contact Person Mobile field.';
                    ApplicationArea = All;
                }
            }
        }
        addafter("VAT Registration No.")
        {

            field("KRA PIN"; Rec."KRA PIN")
            {
                ToolTip = 'Specifies the value of the KRA PIN field.';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}