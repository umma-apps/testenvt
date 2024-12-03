tableextension 52178553 "Fixed Asset Ext" extends "Fixed Asset"
{
    fields
    {
        field(31; "Tag No"; Code[100])
        {

        }
        field(32; "Asset Code"; Code[100])
        {

        }
        field(33; "Asset Nos"; Integer)
        {

        }
        field(34; "Asset Class"; Option)
        {
            OptionMembers = "";
        }
        field(35; "Asset Description"; Text[100])
        {

        }
        field(36; Office; Text[100])
        {

        }

        field(38; "Status"; Text[100])
        {

        }
        field(50000; "Approximate Value"; Decimal)
        {

        }

        field(50001; "Building Location"; Code[20])
        {
            TableRelation = Location;
        }
        field(50002; Rooms; Code[20])
        {
            TableRelation = Location;
        }//"Book Value"
        field(50003; "Book Value"; Decimal)
        {
            Caption = 'Net Book Value';
            //TableRelation = Location;
        }
        field(50004; "Registration No"; code[20])
        {

        }
        field(50005; "Chasis No"; code[20])
        {

        }
        field(50006; "Manufacture Year"; code[20])
        {

        }
        field(50007; "Engine No"; code[20])
        {

        }
        field(50008; "Registration Date"; code[20])
        {

        }
        field(50009; "Land Ref No"; code[20])
        {

        }
        field(50010; "Acreage(Ha)"; code[20])
        {

        }
        field(50011; "Lease Inspection(Year)"; code[20])
        {

        }
        field(50012; "Lease Period"; code[20])
        {

        }
        field(50013; "Gross Book Value"; Decimal)
        {

        }
        field(50014; "Acumilated Depreciation"; Decimal)
        {

        }
        field(50015; "Acquisition Value"; Decimal)
        {

        }
        field(50016; "Custodian Payroll No"; code[20])
        {

        }

    }
}