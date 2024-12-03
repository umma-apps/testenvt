table 40006 "PartTine Claims SetUp"
{
    Caption = 'PartTime Claims SetUp';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "primary Key"; Integer)
        {
            Caption = 'primary Key';
            AutoIncrement = true;
        }
        field(2; "Hosing Levy G/l"; Code[20])
        {
            Caption = 'Hosing Levy G/l';
            TableRelation = Vendor."No.";
        }
        field(3; "NetPay G/l "; Code[20])
        {
            Caption = 'NetPay G/l ';
            TableRelation = "G/L Account"."No.";
        }
        field(4; NetPay; Code[20])
        {
            Caption = 'NetPay';
        }
        field(5; "Housing Levy%"; Decimal)
        {
            Caption = 'Housing Levy%';
        }
        field(6; "netPay%"; Decimal)
        {
            Caption = 'netPay%';
        }
        field(7; "Housing levy Relief%"; Decimal)
        {
            Caption = 'Housing levy Relief%';
        }
        field(8; "Gross Amount g/L"; Code[20])
        {
            // Caption = 'Housing Levy G/l';
            TableRelation = "G/L Account"."No.";
        }
        field(9; "Other deduction G/l"; Code[20])
        {
            Caption = 'Other deduction G/l';
            TableRelation = "G/L Account"."No.";
        }
        field(10; "Paye G/l"; Code[20])
        {
            Caption = 'Paye G/l';
            TableRelation = "G/L Account"."No.";
        }
    }
    keys
    {
        key(PK; "primary Key")
        {
            Clustered = true;
        }
    }
}
