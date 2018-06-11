pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
// CSD1.00 - 2018-06-11 - NRowland
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")

            {

            }
            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("Room")
            {
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {
                    Visible = ShowMaxField;
                }
            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (type = type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
}