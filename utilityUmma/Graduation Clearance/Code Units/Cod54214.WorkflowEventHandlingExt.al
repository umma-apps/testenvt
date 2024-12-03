codeunit 54214 "Workflow Event Handling Ext."
{

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        /*Repair Request */
        RepairRequestSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Repair Request is Requested';
        RepairRequestRequestCancelEventDescTxt: TextConst ENU = 'Approval of Repair Request is Canceled';
        /* Maintence Schedule */
        MaintenceScheduleSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Maintence Schedule is Requested';
        MaintenceScheduleRequestCancelEventDescTxt: TextConst ENU = 'Approval of Maintence Schedule is Canceled';
        /* Maintenance Request */
        MaintenanceRequestSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Maintenance Request is Requested';
        MaintenanceRequestRequestCancelEventDescTxt: TextConst ENU = 'Approval of Maintenance Request is Canceled';
        /* Utility Bill */
        UtilityBillSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Utility Bill is Requested';
        UtilityBillRequestCancelEventDescTxt: TextConst ENU = 'Approval of Utility Bill is Canceled';
        //meeting Booking
        meetingBookingSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Meeting Booking is Requested';
        meetingBookingRequestCancelEventDescTxt: TextConst ENU = 'Approval of Meeting Booking is Canceled';
        //studentClearance
        studentClearanceForApprovalEventDescTxt: TextConst ENU = 'Approval of Student Clearance is Requested';
        studentclearanceRequestCancelEventDescTxt: TextConst ENU = 'Approval of Student Clearance is Canceled';


    /* *************************************************************************************************************************************/
    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
      
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendStudentClearanceForApprovalCode, Database::"Student Clerance", studentClearanceForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStudentClearanceCode, Database::"Student Clerance", studentclearanceRequestCancelEventDescTxt, 0, false);


    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    var
        WorkflowEvent: Codeunit "Workflow Event Handling";
    begin
        //meeting Booking
       
        //studentClearance
        case EventFunctionName of
            RunWorkflowOnCancelStudentClearanceCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelStudentClearanceCode, RunWorkflowOnSendStudentClearanceForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendStudentClearanceForApprovalCode);
        end;

    end;

    /*************************************************************************************************************************** */
    //meetingBooking
    procedure RunWorkflowOnSendMeetingBookingForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendMeetingBookingForApproval'));
    end;

   

  
    //Student clearance 
    procedure RunWorkflowOnSendStudentClearanceForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendStudentClearanceForApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgnt. Util.", 'OnSendStudentClearanceForApproval', '', true, true)]
    local procedure RunWorkflowOnSendStudentClearanceForApproval(Var StudentClearance: Record "Student Clerance")
    begin

        WorkflowManagement.HandleEvent(RunWorkflowOnSendStudentClearanceForApprovalCode, StudentClearance)
    end;

    procedure RunWorkflowOnCancelStudentClearanceCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelStudentClearance'));
    end;

  
   
  

    /* Maintence Schedule */
  

  

   

    /*************************************************************************************************************************** */
  
}
