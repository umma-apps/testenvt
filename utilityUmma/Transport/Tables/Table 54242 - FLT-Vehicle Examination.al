table 54242 "FLT-Vehicle Examination"
{

    fields
    {
        field(1; "Examination No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Examination Date"; Date)
        {
        }
        field(3; "Driver No."; Code[20])
        {
            TableRelation = "HRM-Employee (D)"."No.";
        }
        field(4; "Driver Name"; Text[30])
        {
            CalcFormula = Lookup("HRM-Employee (D)"."First Name" WHERE("No." = FIELD("Driver No.")));
            FieldClass = FlowField;
        }
        field(5; "Officer In Charge"; Code[20])
        {
            TableRelation = "HRM-Employee (D)"."No.";
        }
        field(6; "Officer In Charge Name"; Text[30])
        {
            CalcFormula = Lookup("HRM-Employee (D)"."First Name" WHERE("No." = FIELD("Officer In Charge")));
            FieldClass = FlowField;
        }
        field(7; "Speedometer Working"; Boolean)
        {
        }
        field(8; "General Remarks"; Text[250])
        {
        }

    }

    keys
    {
        key(Key1; "Examination No.")
        {
        }
    }

    fieldgroups
    {
    }
}

