table 40002 "Senate Report New"
{
    Caption = 'Senate Report New';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {

        }
        field(2; "Student Name"; Text[200])
        {

        }
        field(3; Average; Decimal)
        {

        }
        field(4; "Acdemic Year"; Code[20])
        {

        }
        field(5; Semester; code[20])
        {
            TableRelation = "ACA-Semesters";
        }
        field(6; Status; code[20])
        {
            //OptionMembers = Pass,Fail;
        }
        field(7; Grade; Code[20])
        {

        }
        field(8; Programme; code[20])
        {
            TableRelation = "ACA-Programme";
        }
        field(9; Stage; code[20])
        {

        }
        field(10; SuppUnits; text[200])
        {

        }

    }
    keys
    {
        key(PK; "Student No.", Semester, "Acdemic Year", Stage)
        {
            Clustered = true;
        }
    }
}
