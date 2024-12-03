table 85002 "HRM-Terms Setup"
{
    DrillDownPageId = "HRM-Terms Values";
    LookupPageId ="HRM-Terms Values";

    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;Code; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
         field(2;Description; Text[50])
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}