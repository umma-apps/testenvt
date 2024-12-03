table 54895 "HMS-Triage Rec. lines"
{

    fields
    {
        field(1; "Patient No"; Code[20])
        {
        }
        field(2; "Test Code"; Code[30])
        {
            TableRelation = "HMS-Triage Test Setup"."Test Code";
        }
        field(3; "Test Description"; Text[250])
        {
            CalcFormula = Lookup("HMS-Triage Test Setup"."Test Description" WHERE("Test Code" = FIELD("Test Code")));
            FieldClass = FlowField;
        }
        field(4; "Test Date"; Date)
        {
        }
        field(5; "Test Time"; Time)
        {
        }
        field(6; "Test By"; Text[250])
        {
        }
        field(7; Readings; Text[140])
        {
        }
        field(8; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Patient No", "Test Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Test Date" := TODAY;
        "Test Time" := TIME;
        "Test By" := USERID;
    end;
}

