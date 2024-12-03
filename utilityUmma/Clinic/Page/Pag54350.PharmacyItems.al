page 54350 "Pharmacy Items"
{
    PageType = List;
    SourceTable = "Pharmacy Items";
    DeleteAllowed = false;
    SourceTableView = where("Drug Category" = filter(<> "Lab Reagents"));


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of measure"; Rec."Unit of measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of measure field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory field.';
                }
                field("Drug Category"; Rec."Drug Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Drug Category field.';
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("UnitOfMeasure")
            {
                Caption = 'Unit Of Measure';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                image = UnitOfMeasure;
                RunObject = Page "Phamarcy Unit Of Measure";
                RunPageLink = "Item Code" = field("No.");
            }
        }
    }
}