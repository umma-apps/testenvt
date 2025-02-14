/// <summary>
/// Table HRM-Staff Transport Alloc. (ID 52178578).
/// </summary>
table 50902 "HRM-Staff Transport Alloc."
{
    Caption = 'HRM-Staff Transport Alloc.';

    fields
    {
        field(2; Commencement; Text[30])
        {
        }
        field(3; "Destination(s)"; Text[30])
        {
        }
        field(4; "Vehicle Reg Number"; Code[20])
        {
        }
        field(5; "Assigned Driver"; Code[20])
        {
            TableRelation = "HRM-Drivers";

            trigger OnValidate()
            begin
                HRDrivers.Reset;
                if HRDrivers.Get("Assigned Driver") then begin
                    "Driver Name" := HRDrivers."Driver Name";
                end;
            end;
        }
        field(7; "Date of Allocation"; Date)
        {
        }
        field(8; "Vehicle Allocated by"; Code[20])
        {
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(10; Status; Option)
        {
            Editable = false;
            OptionMembers = Open,Released,Closed,Cancelled;
        }
        field(13; "Date of Trip"; Date)
        {
        }
        field(14; "Purpose of Trip"; Text[250])
        {
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Comments; Text[250])
        {
        }
        field(63; "Driver Name"; Text[100])
        {
        }
        field(64; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".Code;

            trigger OnValidate()
            begin

                /*TESTFIELD(Status,Status::Open);
                IF NOT UserMgt.CheckRespCenter(1,Department) THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                */

            end;
        }
        field(65; "Loaded to WorkTicket"; Boolean)
        {
        }
        field(66; "Time out"; Time)
        {
        }
        field(67; "Time In"; Time)
        {
        }
        field(68; "Journey Route"; Text[250])
        {
        }
        field(69; "Time of Trip"; Time)
        {
        }
        field(70; "Closing Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(71; "Linked to Invoice No"; Code[20])
        {
        }
        field(72; "No of Days Requested"; Integer)
        {
        }
        field(73; "Authorized  By"; Code[30])
        {
        }
        field(75; "Transport Allocation No"; Code[20])
        {
            Editable = false;
        }
        field(76; "Passenger Capacity"; Integer)
        {
        }
        field(77; "Requisition Type"; Option)
        {
            OptionMembers = Internal,External;
        }
    }

    keys
    {
        key(Key1; "Transport Allocation No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Transport Allocation No" = '' then begin
            //  HRSetup.Get;
            //  HRSetup.TestField(HRSetup."Transport Req Nos");
            //  NoSeriesMgt.InitSeries(HRSetup."Transport Req Nos",xRec."No. Series",0D,"Transport Allocation No","No. Series");
        end;

        "Authorized  By" := UserId;
        "Date of Allocation" := Today;
    end;

    var
        //HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRDrivers: Record "HRM-Drivers";
        Text0001: Label 'You cannot modify an Approved or Closed Record';
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
}

