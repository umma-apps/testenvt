pageextension 52178559 "InventorySetupEXT" extends "Inventory Setup"
{
    layout
    {
        addafter("Copy Item Descr. to Entries")
        {
            field("Item Issue Template"; Rec."Item Issue Template")
            {
                ApplicationArea = All;
            }
            field("Item Issue Batch";Rec."Item Issue Batch")
            {
                ApplicationArea = All;
            }
            field("SIV Numbers";Rec."SIV Numbers")
            {
                ApplicationArea = All;
            }
        }
    }
}