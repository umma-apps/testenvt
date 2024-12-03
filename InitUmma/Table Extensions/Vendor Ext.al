tableextension 52178565 "Vendor Ext" extends Vendor
{
    fields
    {
        field(50000; "Campus Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50001; "Date of Prequalification"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "KRA PIN"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Contact Person"; Text[100])
        {

            DataClassification = ToBeClassified;
        }
        field(50004; "Contact Person Mobile"; Text[20])
        {

            DataClassification = ToBeClassified;
        }
        field(50005; Status; Option)
        {

            OptionMembers = Active,Suspended;

            trigger OnValidate()
            begin
                if Status = Status::Suspended then
                    Blocked := Blocked::All;

                if Status = Status::Active then
                    Blocked := Blocked::" ";
            end;
        }
        field(50006; "Specific Category of Supply"; code[20])
        {

        }
        field(50007; "Specific Cat. of Supply Code"; code[20])
        {
            Caption = 'Specific Category of Supply Code';
        }
        field(50008; "Gen Category Of Supply Code"; code[20])
        {
            Caption = 'General Category of Supply Code';
        }
        field(50009; "Category of Supply"; Option)
        {
            OptionMembers = General, "Kitchen Supplies", Stationery, Services;
        }
        field(50010; "Prequalification Period"; code[20])
        {
            TableRelation = "Prequalification Years";
        }
    }

    var
        myInt: Integer;
}