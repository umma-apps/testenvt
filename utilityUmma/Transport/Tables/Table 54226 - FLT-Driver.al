table 54226 "FLT-Driver"
{
    DrillDownPageID = "FLT-Driver List";
    LookupPageID = "FLT-Driver List";

    fields
    {
        field(1; "driver  PF NO"; Code[10])
        {
            TableRelation = "HRM-Employee (D)"."No." where(Driver = filter('true'));

            trigger OnValidate()
            var
                driver: Record "HRM-Employee (D)";
            begin
                driver.Reset;
                driver.Get("driver  PF NO");
                "Driver Name" := driver."First Name" + ' ' + driver."Middle Name" + ' ' + driver."Last Name";
                grade := driver.Grade;
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
            Editable = false;
        }
        field(3; "Driver License Number"; Code[20])
        {
        }
        field(4; "Last License Renewal"; Date)
        {
        }
        field(5; "Renewal Interval"; Option)
        {
            OptionMembers = " ",Days,Weeks,Months,Quarterly,Years;
        }
        field(6; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                StrValue := 'D';

                if "Renewal Interval" = "Renewal Interval"::Days then begin
                    StrValue := 'D';
                end
                else
                    if "Renewal Interval" = "Renewal Interval"::Weeks then begin
                        StrValue := 'W';
                    end
                    else
                        if "Renewal Interval" = "Renewal Interval"::Months then begin
                            StrValue := 'M';
                        end
                        else
                            if "Renewal Interval" = "Renewal Interval"::Quarterly then begin
                                StrValue := 'Q';
                            end
                            else
                                if "Renewal Interval" = "Renewal Interval"::Years then begin
                                    StrValue := 'Y';
                                end;

                "Next License Renewal" := CalcDate(Format("Renewal Interval Value") + StrValue, "Last License Renewal");
            end;
        }
        field(7; "Next License Renewal"; Date)
        {
        }
        field(8; "Year Of Experience"; Decimal)
        {
        }
        field(9; Grade; Code[20])
        {
            Editable = false;
        }
        field(10; Active; Boolean)
        {
        }
        field(11; "License Class"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "driver  PF NO")
        {
        }
    }

    fieldgroups
    {
    }

    var
        EMP: Record "HRM-Employee (D)";
        StrValue: Text[1];
}

