table 54278 "Phamarcy Unit Of Measure"
{
    fields
    {
        field(1; "Item Code"; code[30])
        {
            TableRelation = "Pharmacy Items";
        }
        // field(2; "Unit Code"; Enum "Pharmacy Unit of Measure")
        // {

        // }
        field(3; "Cost"; Decimal)
        {

        }

    }

    keys
    {
        key(pk; "Item Code")
        {

        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; "Item Code", Cost)
        {

        }
    }


}