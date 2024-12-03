pageextension 52178553 "FA Page Extension" extends "Fixed Asset Card"
{
    layout
    {

        addafter("FA Subclass Code")
        {

            field("Location Code"; Rec."Location Code")
            {
                ToolTip = 'Specifies the value of the Location Code field.';
                ApplicationArea = All;
            }
            field("Approximate Value"; Rec."Approximate Value")
            {
                ToolTip = 'Specifies the value of the Approximate Value field.';
                ApplicationArea = All;
            }
            field("Building Location"; Rec."Building Location")
            {
                ToolTip = 'Specifies the value of the Building Located field.';
                ApplicationArea = All;
            }
            field(Rooms; Rec.Rooms)
            {
                ToolTip = 'Specifies the value of the Rooms field.';
                ApplicationArea = All;
            }
            field("Book Value"; Rec."Book Value")
            {
                ToolTip = 'Specifies the value of the Book Value field.';
                ApplicationArea = All;
            }
            field(Office; Rec.Office)
            {
                ApplicationArea = All;
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = All;
            }

        }
        addafter("Responsible Employee")
        {
            group("MotorVehicle Details")
            {
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                }
                field("Chasis No"; Rec."Chasis No")
                {
                    ApplicationArea = All;
                }
                field("Manufacture Year"; Rec."Manufacture Year")
                {
                    ApplicationArea = All;
                }
                field("Engine No"; Rec."Engine No")
                {
                    ApplicationArea = ALL;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                }
            }
            group("Land Details")
            {
                field("Land Ref No"; Rec."Land Ref No")
                {
                    ApplicationArea = All;
                }
                field("Acreage(Ha)"; Rec."Acreage(Ha)")
                {
                    ApplicationArea = All;
                }
                field("Lease Inspection(Year)"; Rec."Lease Inspection(Year)")
                {
                    ApplicationArea = All;
                }
                field("Lease Period"; Rec."Lease Period")
                {
                    ApplicationArea = All;
                }
            }

        }
        addafter("Book Value")
        {
            field("Gross Book Value"; Rec."Gross Book Value")
            {
                ApplicationArea = All;
            }
            field("Acumilated Depreciation"; Rec."Acumilated Depreciation")
            {
                ApplicationArea = All;
            }
            field("Acquisition Value"; Rec."Acquisition Value")
            {
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