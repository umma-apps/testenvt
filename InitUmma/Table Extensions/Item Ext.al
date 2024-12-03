tableextension 52178557 Item extends Item
{
    fields
    {
        field(5000; "Item G/L Budget Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }

        field(99008503; "Is Controlled"; Boolean)
        {

        }
    }
}