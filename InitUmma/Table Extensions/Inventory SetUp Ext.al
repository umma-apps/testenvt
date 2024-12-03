tableextension 52178556 "Inventory SetUp Ext" extends "Inventory Setup"
{

    fields
    {
        field(7307; "Item Issue Template"; Code[20])
        {
            TableRelation = "Item Journal Template".Name;
        }
        field(7308; "Item Issue Batch"; Code[20])
        {
            TableRelation = "Item Journal Batch".Name;
 

        }
         field(50000; "SIV Numbers"; Code[20])
        {
            
            

        }
    }
}