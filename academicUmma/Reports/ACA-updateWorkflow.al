report 86618 "Update Workflow"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(userGroup; "Workflow User Group")
        {
            RequestFilterFields = Code;
            column(Code; Code)
            {

            }
            dataitem(usersWF; "Workflow User Group Member")
            {

            }
            dataitem(Users; Users)
            {

            }
            trigger OnAfterGetRecord()
            begin

            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    var
        wfuserG: Record "Workflow User Group";
}