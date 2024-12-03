pageextension 52178552 "User Setup Ext." extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {


            field("Allow Change Company"; Rec."Allow Change Company")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Change Company field.';
            }
            field("Allow Change Role"; Rec."Allow Change Role")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Change Role field.';
            }
            field("Allow Open My Settings"; Rec."Allow Open My Settings")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Open My Settings field.';
            }
            field("Allow Open UserSetup"; Rec."Allow Open UserSetup")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow UserSetup';
            }
            field("Allow Open Transcript"; Rec."Allow Open Transcript")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow OPEN Transcript field';
            }
            field("Allow Open user settings"; Rec."Allow Open user settings")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Open user settings field.';
            }
            field("Allow Add Unit"; Rec."Allow Add Unit")
            {
                ApplicationArea = All;

            }
            field("Create  System Users"; Rec."Create System Users")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Users field.';
            }
            field("Can Personalize profile"; Rec."Can Personalize profile")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can Personalize profile field.';
            }
            field("Can Create Profile"; Rec."Can Create Profile")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can Create Profile field.';
            }
            field("Can Archive Students"; Rec."Can Archive Students")
            {
                ToolTip = 'Specifies the value of the Can Archive Students field.';
                ApplicationArea = All;
            }

            field("Can Edit Academic Year"; Rec."Can Edit Academic Year")
            {
                ToolTip = 'Specifies the value of the Can Edit Academic Year field.';
                ApplicationArea = All;
            }
            field("Approver ID"; Rec."Approver ID")
            {
                ToolTip = 'Specifies the user ID of the person who must approve records that are made by the user in the User ID field before the record can be released.';
                ApplicationArea = All;
            }
            field(Approvermail; Rec.Approvermail)
            {
                ToolTip = 'Specifies the value of the Approvermail field.';
                ApplicationArea = All;
            }
            field("Approval Role"; Rec."Approval Role")
            {
                ToolTip = 'Specifies the value of the Approval Role field.';
                ApplicationArea = All;
            }
            field("Approval Title"; Rec."Approval Title")
            {
                ToolTip = 'Specifies the value of the Approval Title field.';
                ApplicationArea = All;
            }
            field("Is Employee"; Rec."Is Employee")
            {
                ToolTip = 'Specifies the value of the Is Employee field.';
                ApplicationArea = All;
            }
            field("Job Tittle"; Rec."Job Tittle")
            {
                ToolTip = 'Specifies the value of the Job Tittle field.';
                ApplicationArea = All;
            }
            field("User Signature"; Rec."User Signature")
            {
                ToolTip = 'Specifies the value of the User Signature field.';
                ApplicationArea = All;
                Enabled = true;
                Editable = true;
            }
            field(UserName; Rec.UserName)
            {
                ToolTip = 'Specifies the value of the UserName field.';
                ApplicationArea = All;
            }
            field("Staff No"; Rec."Staff No")
            {
                ToolTip = 'Specifies the value of the Staff No field.';
                ApplicationArea = All;
            }
            field(Substitute; Rec.Substitute)
            {
                ToolTip = 'Specifies the User ID of the user who acts as a substitute for the original approver.';
                ApplicationArea = All;
            }
            field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
            {
                ToolTip = 'Specifies Campus';
                Caption = 'Campus Code';
                ApplicationArea = All;
            }
            field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                ToolTip = 'Specifies Department';
                Caption = 'Department';
                ApplicationArea = All;
            }
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ToolTip = 'Specifies Faculty';
                Caption = 'Faculty';
                ApplicationArea = All;
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ToolTip = 'Specifies the value of the Responsibility Center field.';
                ApplicationArea = All;
            }
            field(Lecturer; Rec.Lecturer)
            {
                ToolTip = 'Specifies the value of the Lecturer field.';
                ApplicationArea = All;
            }
            field("Create Supplier"; Rec."Create Supplier")
            {
                ToolTip = 'Specifies the value of the Create Supplier field.';
                ApplicationArea = All;
            }
            field("Create Salary"; Rec."Create Salary")
            {
                ToolTip = 'Specifies the value of the Create Salary field.';
                ApplicationArea = All;
            }
            field("Create PR Transactions"; Rec."Create PR Transactions")
            {
                ToolTip = 'Specifies the value of the Create PR Transactions field.';
                ApplicationArea = All;
            }
            field("Create Items"; Rec."Create Items")
            {
                ToolTip = 'Specifies the value of the Create Items field.';
                ApplicationArea = All;
            }
            field("Create GL"; Rec."Create GL")
            {
                ToolTip = 'Specifies the value of the Create GL field.';
                ApplicationArea = All;
            }
            field("Create FA"; Rec."Create FA")
            {
                ToolTip = 'Specifies the value of the Create FA field.';
                ApplicationArea = All;
            }
            field("Create Employee"; Rec."Create Employee")
            {
                ToolTip = 'Specifies the value of the Create Employee field.';
                ApplicationArea = All;
            }
            field("Create Emp. Transactions"; Rec."Create Emp. Transactions")
            {
                ToolTip = 'Specifies the value of the Create Emp. Transactions field.';
                ApplicationArea = All;
            }
            field("Create Customer"; Rec."Create Customer")
            {
                ToolTip = 'Specifies the value of the Create Customer field.';
                ApplicationArea = All;
            }
            field("Create Course_Reg"; Rec."Create Course_Reg")
            {
                ToolTip = 'Specifies the value of the Create Course_Reg field.';
                ApplicationArea = All;
            }
            field("Employee No."; Rec."Employee No.")
            {
                ToolTip = 'Specifies the value of the Employee No. field.';
                ApplicationArea = All;
            }
            field("Can Reverse Sales"; Rec."Can Reverse Sales")
            {
                ToolTip = 'Specifies the value of the Can Reverse Sales field.';
                ApplicationArea = All;
            }
            field("Can Process Senate Marks"; Rec."Can Process Senate Marks")
            {
                ToolTip = 'Specifies the value of the Can Process Senate Marks field.';
                ApplicationArea = All;
            }
            field("Can Process Graduation"; Rec."Can Process Graduation")
            {
                ToolTip = 'Specifies the value of the Can Process Graduation field.';
                ApplicationArea = All;
            }
            field("Can Post Customer Refund"; Rec."Can Post Customer Refund")
            {
                ToolTip = 'Specifies the value of the Can Post Customer Refund field.';
                ApplicationArea = All;
            }
            field("Can Post Cust. Deposits"; Rec."Can Post Cust. Deposits")
            {
                ToolTip = 'Specifies the value of the Can Post Cust. Deposits field.';
                ApplicationArea = All;
            }
            field("Can Edit Semester"; Rec."Can Edit Semester")
            {
                ToolTip = 'Specifies the value of the Can Edit Semester field.';
                ApplicationArea = All;
            }
            field("Approve Results Cancellation"; Rec."Approve Results Cancellation")
            {
                ToolTip = 'Specifies the value of the Approve Results Cancellation field.';
                ApplicationArea = All;
            }
            field("Approve Payroll Closure"; Rec."Approve Payroll Closure")
            {
                ToolTip = 'Specifies the value of the Approve Payroll Closure field.';
                ApplicationArea = All;
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ToolTip = 'Specifies the user who has rights to unblock approval workflows, for example, by delegating approval requests to new substitute approvers and deleting overdue approval requests.';
                ApplicationArea = All;
            }
            field("Allow Transaction Reversal"; Rec."Allow Transaction Reversal")
            {
                ToolTip = 'Specifies the value of the Allow Transaction Reversal field.';
                ApplicationArea = All;
            }
            field("Can Stop Reg."; Rec."Can Stop Reg.")
            {
                ToolTip = 'Specifies the value of the Can Stop Reg. field.';
                ApplicationArea = All;
            }
            field("Can Upload Marks"; Rec."Can Upload Marks")
            {
                ToolTip = 'Specifies the value of the Can Upload Marks field.';
                ApplicationArea = All;
            }
            field("Can modify unit Alocation"; Rec."Can modify unit Alocation")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(UserSignature)
            {
                Caption = 'Import Signature';
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "APP-User-Setup Signatures";
                RunPageLink = "User ID" = field("User ID");
            }
        }
    }

    // trigger OnOpenPage()
    // var
    //     usersetup: Record "User Setup";
    //     Nopermission: Label 'You have insufficient Rights to access the setup';
    // begin
    //     AllowAccessSetup := true;
    //     if usersetup.get(UserId) then
    //         if (usersetup."Create System Users") then begin
    //             AllowAccessSetup := usersetup."Create System Users";
    //             exit
    //         end;
    //     Error(Nopermission);
    // end;

    var
        AllowAccessSetup: boolean;

    
}