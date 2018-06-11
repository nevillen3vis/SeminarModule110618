page 123456700 "Seminar Setup"
// CSD1.00 - 2018-06-11 NRowland
{
    PageType = Card;
    SourceTable = "Seminar Setup";
    Caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminar Registration Nos.";"Seminar Registration Nos.")
                {
                    
                }
                field("Posted Seminar Reg. Nos.";"Posted Seminar Reg. Nos.")
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
trigger OnOpenPage();
begin
    If not get then begin
        init;
        insert;
    end;
end;
    var
        myInt : Integer;
}