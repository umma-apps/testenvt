table 52178598 "Prequalification Years"
{
    DataClassification = ToBeClassified;
    
    
    fields
    {
        field(1; PrequalYr; code[20])
        {
            Caption = 'Code';
        }
        field(2; "Prequalification Year"; Text[20])
        {
            
        }
        field(3; "Current Period"; Boolean)
        {
            
        }
    }
    
    keys
    {
        key(Key1; PrequalYr)
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