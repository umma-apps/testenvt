/// <summary>
/// Table EXT-Prog. Spec. Days (ID 74559).
/// </summary>
table 74559 "EXT-Prog. Spec. Days"
{

    fields
    {
        field(1; "Academic Year"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ACA-Academic Year".Code;
        }
        field(2; Semester; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ACA-Semesters".Code;
        }
        field(3; "Programme Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Date Code"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "TT-Days"."Day Code" WHERE("Academic Year" = FIELD("Academic Year"),
                                                      Semester = FIELD(Semester));
        }
        field(5; "Constraint Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preferred,Mandatory,Least Preferred,Avoid';
            OptionMembers = Preferred,Mandatory,"Least Preferred",Avoid;
        }
    }

    keys
    {
        key(Key1; "Academic Year", Semester, "Programme Code", "Date Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

