table 85515 "HRM-Departmental Tragets"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; objCode; Code[5])
        {
        }
        field(2; "PF. No."; Code[20])
        {
            Editable = true;
            NotBlank = true;
        }
        field(3; Objective; Text[100])
        {

        }
    }
    
    keys
    {
        key(Key1; objCode)
        {
            Clustered = true;
        }
    }
    
   
    
}