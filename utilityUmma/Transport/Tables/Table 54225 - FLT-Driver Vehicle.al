table 54225 "FLT-Driver Vehicle"
{
    DrillDownPageID = "FLT-Driver Vehicle List";
    LookupPageID = "FLT-Driver Vehicle List";

    fields
    {
        field(1; Driver; Code[10])
        {
            TableRelation = "FLT-Driver";

            trigger OnValidate()
            begin
                Drv.Reset;
                Drv.Get(Driver);
                "Driver Name" := Drv."Driver Name";
                "License Number" := Drv."Driver License Number";
                "License Expiry" := Drv."Next License Renewal";
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
        }
        field(3; "License Number"; Code[10])
        {
        }
        field(4; "License Expiry"; Date)
        {
        }
        field(5; Vehicle; Code[10])
        {
            TableRelation = "FLT-Vehicle Header"."No." WHERE(Type = CONST(Vehicle));

            trigger OnValidate()
            begin
                Vhcl.Reset;
                Vhcl.Get(Vehicle);
                "Vehicle Make" := Vhcl.Make;
                "Vehicle Model" := Vhcl.Model;
                "Vehicle Registration No." := Vhcl."Registration No.";
            end;
        }
        field(6; "Vehicle Make"; Code[10])
        {
        }
        field(7; "Vehicle Model"; Code[10])
        {
        }
        field(8; "Vehicle Registration No."; Code[10])
        {
            TableRelation = "FLT-Vehicle Header"."Registration No.";
        }
        field(9; "From Date"; Date)
        {
        }
        field(10; "To Date"; Date)
        {
        }
        field(11; "Rotation No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Rotation No", Driver)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Drv: Record "FLT-Driver";
        Vhcl: Record "FLT-Vehicle Header";
}

