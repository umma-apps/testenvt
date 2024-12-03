tableextension 52178566 "Base Caledner Ext"  extends "Base Calendar Change"
{
    fields
    {
        field(7; "Date Day"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Date Month"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}