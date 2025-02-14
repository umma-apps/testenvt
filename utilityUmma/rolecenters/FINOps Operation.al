page 86001 "Finance Operations RC"
{
    Caption = 'HRM-Finance Operations RC', Comment = '{Dependency=Match,"ProfileDescription_FinOps"} ';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part("Dashboard Greetings"; "Dashboard Greetings")

            {
                ApplicationArea = all;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

            // group(Control1900724808)
            // {
            //     ShowCaption = false;

            //    
            //     part(Control1900601808; "Acc. Payables Activities")
            //     {
            //         ApplicationArea = Basic, Suite;
            //     }
            //     part("User Tasks Activities"; "User Tasks Activities")
            //     {
            //         ApplicationArea = Suite;
            //     }
            //     part(Control1905989608; "My Items")
            //     {
            //         ApplicationArea = Basic, Suite;
            //     }
            // }
            // group(Control1900724708)
            // {
            //     ShowCaption = false;
            //     part(Control1902476008; "My Vendors")
            //     {
            //         ApplicationArea = Basic, Suite;
            //     }
            //     part(Control10; "Report Inbox Part")
            //     {
            //         ApplicationArea = Basic, Suite;
            //     }
            //     part(Control12; "My Job Queue")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Visible = false;
            //     }
            //     systempart(Control1901377608; MyNotes)
            //     {
            //         ApplicationArea = Basic, Suite;
            //     }
            // }
        }
    }

    actions
    {
        area(reporting)
        {

            action("&Vendor - List")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Vendor - List';
                Image = "Report";
                RunObject = Report "Vendor - List";
                ToolTip = 'View the list of your vendors.';
            }

            action("Vendor - &Balance to date")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - &Balance to date';
                Image = "Report";
                RunObject = Report "Vendor - Balance to Date";
                ToolTip = 'View, print, or save a detail balance to date for selected vendors.';
            }
            action("Vendor - &Summary Aging")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - &Summary Aging';
                Image = "Report";
                RunObject = Report "Vendor - Summary Aging";
                ToolTip = 'View a summary of the payables owed to each vendor, divided into three time periods.';
            }
            action("Non-Tuition Customer Statement")
            {
                ApplicationArea = Basic, Suite;
                //Caption = 'Vendor - &Summary Aging';
                Image = "Report";
                RunObject = Report "Customer Statement Summary";
                ToolTip = 'View a summary of the payables owed to each customer';
            }
            action("Vendor Statement")
            {
                ApplicationArea = Basic, Suite;
                //Caption = 'Vendor - &Summary Aging';
                Image = "Report";
                RunObject = Report "Vendor Statement Summary";
                ToolTip = 'View a summary of the payables owed to each Vendor';
            }
            action("Payment Voucher List")
            {
                ApplicationArea = Basic, Suite;
                //Caption = 'Vendor - &Summary Aging';
                Image = "Report";
                RunObject = Report "Payment Voucher summary ";
                ToolTip = 'View a summary of all  isssued payment vouchers';
            }
            action("Aged &Accounts Payable")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged &Accounts Payable';
                Image = "Report";
                RunObject = Report "Aged Accounts Payable";
                ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            }
            action("Vendor - &Purchase List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - &Purchase List';
                Image = "Report";
                RunObject = Report "Vendor - Purchase List";
                ToolTip = 'View a list of your purchases in a period, for example, to report purchase activity to customs and tax authorities.';
            }
            action("Pa&yments on Hold")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pa&yments on Hold';
                Image = "Report";
                RunObject = Report "Payments on Hold";
                ToolTip = 'View a list of all vendor ledger entries on which the On Hold field is marked.';
            }
            action("P&urchase Statistics")
            {
                ApplicationArea = Suite;
                Caption = 'P&urchase Statistics';
                Image = "Report";
                RunObject = Report "Purchase Statistics";
                ToolTip = 'View a list of amounts for purchases, invoice discount and payment discount in $ for each vendor.';
            }
            separator(Action63)
            {
            }
            action("Vendor &Document Nos.")
            {
                Visible = false;
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor &Document Nos.';
                Image = "Report";
                //   RunObject = Report "Vendor Document Nos.";
                ToolTip = 'View a list of vendor ledger entries, sorted by document type and number. The report includes the document type, document number, posting date and source code of the entry, the name and number of the vendor, and so on. A warning appears when there is a gap in the number series or the documents were not posted in document-number order.';
            }
            action("Purchase &Invoice Nos.")
            {
                Visible = false;
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase &Invoice Nos.';
                Image = "Report";
                //   RunObject = Report "Purchase Invoice Nos.";
                ToolTip = 'View or set up the number series for purchase invoices.';
            }
            action("Purchase &Credit Memo Nos.")
            {
                Visible = false;
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase &Credit Memo Nos.';
                Image = "Report";
                //  RunObject = Report "Purchase Credit Memo Nos.";
                ToolTip = 'View or set up the number series for purchase credit memos.';
            }
        }
        area(embedding)
        {
            ToolTip = 'View and process vendor payments, and approve incoming documents.';
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(Payment)
            {
                Image = Payment;
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Voucher';
                RunObject = Page "FIN-Payment Vouchers";
                ToolTip = 'Create a new Payment Voucher. Create Payable document';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Purchase Return Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Return Orders';
                RunObject = Page "Purchase Return Order List";
                ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
            }
            action("Purchase Credit Memos")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
                ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(PurchaseJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Purchases),
                                    Recurring = CONST(false));
                ToolTip = 'Post any purchase-related transaction directly to a vendor, bank, or general ledger account instead of using dedicated documents. You can post all types of financial purchase transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a purchase journal.';
            }
            action(PaymentJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Payments),
                                    Recurring = CONST(false));
                ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
            }
            action(GeneralJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                    Recurring = CONST(false));
                ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
            }
        }
        area(sections)
        {
            group("Finance Operations")
            {
                action("Buffer Table")
                {
                    Image = Payment;
                    ApplicationArea = Basic, Suite;
                    //Caption = 'Payment Voucher';
                    RunObject = Page bufferpage;
                    //ToolTip = 'Create a new Payment Voucher. Create Payable document';
                }
                action("Payment Voucher")
                {
                    Image = Payment;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Voucher';
                    RunObject = Page "FIN-Payment Vouchers";
                    ToolTip = 'Create a new Payment Voucher. Create Payable document';
                }
                action("Receipts")
                {
                    Image = Receivables;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipts';
                    RunObject = Page "FIN-Receipts List";
                    ToolTip = 'Create Receipt for Receivable';
                }

                action("Imprest")
                {
                    image = ItemRegisters;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest List';
                    RunObject = Page "FIN-Imprests List";
                    ToolTip = 'Create New Imprest';
                }
                action("ImprestAccounting")
                {
                    ApplicationArea = All;
                    RunObject = page "FIN-Imprest Accounting";
                    Image = ICPartner;
                    Caption = 'Imprest Accounting';
                }

                action("Claims")
                {
                    Image = CopyGLtoCostBudget;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff Claims';
                    RunObject = Page "FIN-Staff Claim List";
                    RunPageMode = Create;
                    ToolTip = 'Raise staff claim';
                }
                action("Interbank Transfer")
                {
                    Image = Bank;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Interbank Transfer';
                    RunObject = Page "FIN-Interbank Transfer";
                    ToolTip = 'Tranfer Funds Between Cash Book Accounts';
                }
                action("Cash Office Setup UP2")
                {
                    ApplicationArea = All;
                    RunObject = page "FIN-Cash Office Setup UP";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Cash Office Setup ';
                }
                action(cashOffice)
                {
                    ApplicationArea = All;
                    RunObject = Page "Cash Office Setup UP";
                    Image = Setup;

                }

            }


            group("B&udget")
            {
                action("Budget List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Budget Names';
                    Image = GLRegisters;
                    RunObject = Page "G/L Budget Names";
                    ToolTip = 'View List of Budgets';
                }
            }

            group(Stores)
            {
                action("Purchase &Order")
                {
                    ApplicationArea = Suite;
                    Caption = 'Receive';
                    Image = Document;

                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create a new purchase order.';
                }
                action(Item)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items List';
                    RunObject = Page "Item List";
                    ToolTip = 'Create New Item';
                }
                action("Store Requisition")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Store Requisition';
                    RunObject = Page "PROC-Store Requisition";
                    ToolTip = 'Raise  store requisition';
                }
                action("Posted Store Requisition")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Store Requisition';
                    RunObject = Page "PROC-Posted Store Requisition";
                    ToolTip = 'View Archived Store Requisition';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View posted purchase invoices and credit memos, and analyze G/L registers.';
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted return shipments.';
                }
                action("Posted Payment Voucher")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Payment Voucher';
                    RunObject = Page "FIN-Posted Payment Vouch.";
                }
                action("Posted Receipts")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Receipts';
                    RunObject = Page "FIN-Posted Receipts list";
                }
                action("Posted Imprest ")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Imprest';
                    RunObject = Page "FIN-Posted imprest list";
                }
                action("Posted Imprest Surr")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Imprest Accounting';
                    RunObject = Page "FIN-Posted Travel Advs. Acc.";
                }

                action("Posted Staff Claims")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Staff Claims';
                    RunObject = Page "FIN-Posted Staff Claim List";
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View posted G/L entries.';
                }
            }
            group("Setups")
            {
                action("Period Setup")
                {
                    ApplicationArea = ALL;
                    RunObject = page "FIN-Budget Periods Setup";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Periods Setup';


                }
                action("Period Setup1")
                {
                    ApplicationArea = ALL;
                    RunObject = page "FIN-Budget Periods Setup";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Periods Setup';


                }
                action("Cash Office Setup UP")
                {
                    ApplicationArea = All;
                    RunObject = page "FIN-Cash Office Setup UP";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Cash Office Setup ';
                }
                action("Cash Office User Set Up")
                {

                    ApplicationArea = All;
                    RunObject = page "FIN-Cash Office User Temp. UP";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Cash Office User Template';
                }
                action("Receipt Types")
                {
                    ApplicationArea = All;
                    RunObject = page "FIN-Receipts Types";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Receipt Types ';
                }
                action("Budgetary Control Setup")
                {

                    ApplicationArea = All;
                    RunObject = page "FIN-Budgetary Control Setup";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Budgetary Control Setup';
                }
                action("Payment Types")
                {
                    ApplicationArea = All;
                    RunObject = page "FIN-Payment Types";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Payment Types Setup';
                }
                action("Imprest Types")
                {
                    ApplicationArea = All;
                    RunObject = page "FIN-Imprest Types";
                    Image = SetupPayment;
                    RunPageMode = Create;
                    Caption = 'Imprest Types Setup';
                }
                // action("Imprest Rates")
                // {
                //     ApplicationArea = All;
                //     RunObject = page "FIN_Imprest Rates";
                //     Image = Relatives;
                //     RunPageMode = Create;
                //     Caption = 'Imprest Rates';
                // }
                action("Tax Codes")
                {
                    ApplicationArea = all;
                    Caption = 'Tax Codes';
                    RunObject = Page "FIN-Tarriff Codes List";
                }

            }
            group("Approvals")
            {
                ToolTip = 'Find Documents waiting for your approval';
                Caption = 'Approval Request';
                action("Requests To Approve")
                {
                    ApplicationArea = All;
                    RunObject = page "Requests to Approve";
                    Image = ApplyEntries;
                    Caption = 'Requests To Approve';
                }

            }
            group("Common Requisitions")
            {
                ToolTip = 'Common Requisitions';
                Caption = 'Common Requisitions';
                action("Imprest Req")
                {

                    image = ItemRegisters;
                    ApplicationArea = All;
                    Ellipsis = true;
                    Caption = 'Imprest Requisition';
                    RunObject = Page "FIN-Imprests List";
                    ToolTip = 'Make New Imprest Requision';
                }
                action("Stores Requisitions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition CR";
                }
                action("Purchase Requisiton")
                {
                    ApplicationArea = All;
                    Ellipsis = true;
                    Caption = 'Purchase Requisition';
                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Initiate purchase of Item';
                }
                action("Claim")
                {
                    Image = CopyGLtoCostBudget;
                    ApplicationArea = All;
                    Caption = 'Staff Claims';
                    RunObject = Page "FIN-Staff Claim List";
                    RunPageMode = Create;
                    ToolTip = 'Raise staff claim';
                }//HRM-Leave Requisition List
                action("Leave Req")
                {
                    Image = CopyGLtoCostBudget;
                    ApplicationArea = All;
                    Caption = 'Leave Rquisition';
                    RunObject = Page "HRM-Leave Requisition List";
                    RunPageMode = Create;
                    ToolTip = 'Leave Requisition';
                }//HRM-Leave Requisition List


            }
        }
        area(creation)
        {
            action("&Vendor")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Vendor';
                Image = Vendor;

                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Vendor Card";
                RunPageMode = Create;
                ToolTip = 'Set up a new vendor from whom you buy goods or services. ';
            }
            action("&Purchase Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Purchase Order';
                Image = Document;

                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Purchase goods or services from a vendor.';
            }
            action("Purchase &Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase &Invoice';
                Image = NewPurchaseInvoice;

                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase invoice.';
            }
            action("Purchase Credit &Memo")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Credit &Memo';
                Image = CreditMemo;

                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase credit memo to revert a posted purchase invoice.';
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Payment &Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment &Journal';
                Image = PaymentJournal;
                RunObject = Page "Payment Journal";
                ToolTip = 'View or edit the payment journal where you can register payments to vendors.';
            }
            action("P&urchase Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&urchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
                ToolTip = 'Post any purchase transaction for the vendor. ';
            }
            action(VendorPayments)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Vendor Payments';
                Image = SuggestVendorPayments;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Vendor Ledger Entries";
                RunPageView = WHERE("Document Type" = FILTER(Invoice),
                                    "Remaining Amount" = FILTER(< 0),
                                    "Applies-to ID" = FILTER(''));
                ToolTip = 'Opens vendor ledger entries for all vendors with invoices that have not been paid yet.';
            }
            separator(Administration)
            {
                Caption = 'Administration';
                IsHeader = true;
            }
            action("Purchases && Payables &Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchases && Payables &Setup';
                Image = Setup;
                RunObject = Page "Purchases & Payables Setup";
                ToolTip = 'Define your general policies for purchase invoicing and returns, such as whether to require vendor invoice numbers and how to post purchase discounts. Set up your number series for creating vendors and different purchase documents.';
            }
            separator(History)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                RunObject = Page Navigate;
                ShortCutKey = 'Shift+Ctrl+I';
                ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
        }
    }
}

