xmlport 85548 "Import PRL data"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = false;
    UseRequestPage = false;
    schema
    {
        textelement(Root)
        {
            tableelement(data; "PRL-Historical")
            {
                fieldattribute(lineNo; data.lineNo)
                {
                }
                fieldattribute(StaffNo; data.StaffNo)
                {
                }
                fieldattribute(Names; data.Names)
                {
                }
                fieldattribute(TransactionCode; data.TransactionCode)
                {
                }
                fieldattribute(TransactionName; data.TransactionName)
                {
                }
                fieldattribute(Amount; data.Amount)
                {
                }
                fieldattribute(periodMonth; data.periodMonth)
                {
                }
                fieldattribute(periodYear; data.periodYear)
                {
                }
            }
        }
    }

    requestpage
    {
        layout
        {

        }

        actions
        {

        }
    }

    var
        myInt: Integer;
}