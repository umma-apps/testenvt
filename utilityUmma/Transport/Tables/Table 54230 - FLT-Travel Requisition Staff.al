table 54230 "FLT-Travel Requisition Staff"
{

    fields
    {
        field(1; "Req No"; Code[20])
        {
        }
        field(2; "Passenger Type"; Option)
        {
            OptionMembers = Staff,Student;
        }
        field(3; "Passenger No"; Code[20])
        {
            TableRelation = IF ("Passenger Type" = CONST(Staff)) "HRM-Employee (D)"."No."
            ELSE
            IF ("Passenger Type" = CONST(Student)) "Customer"."No." WHERE("Customer Type" = const(Student));

            trigger OnValidate()
            begin


                IF "Passenger Type" = "Passenger Type"::staff THEN BEGIN
                    IF HrEmployee.Get("Passenger No") THEN
                        "Passenger Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                    Position := HrEmployee.Initials;
                END;

                IF "Passenger Type" = "Passenger Type"::Student THEN BEGIN
                    IF Cust.GET("Passenger No") THEN
                        "Passenger Name" := cust.Name;
                END;

            end;

        }
        field(4; "Passenger Name"; Text[70])
        {
        }
        field(5; Position; Text[70])
        {
        }
        field(6; "Daily Work Ticket"; Code[20])
        {
        }
        field(7; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Req No", EntryNo)
        {
        }
    }

    fieldgroups
    {
    }

    var
        HrEmployee: Record "HRM-Employee (D)";
        Cust: Record Customer;
}

