<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="WebApplication1.WebUserControl1" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css" />


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div>
            <button runat="server" id="bnt1" onserverclick="Btn1_Click">Botão 1</button>
            <button runat="server" id="bnt2" onserverclick="Btn2_Click">Botão 2</button>
            <button runat="server" id="bnt3" onserverclick="Btn3_Click">Botão 3</button>
            <button runat="server" id="bnt4" onserverclick="Btn4_Click">Botão 4</button>
        </div>
        <div id="reportrange" style="background: #fff; margin-top: 10px; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
            <i class="fa fa-calendar"></i>&nbsp;
            <span></span><i class="fa fa-caret-down"></i>
            <button style="display: none" class="btnHidden" runat="server" id="Button5" onserverclick="Btn5_Click"></button>
        </div>

        <asp:HiddenField ID="DataI" runat="server" />
        <asp:HiddenField ID="DataF" runat="server" />

    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">


    function pageLoad(sender, args) {

        InitialiseSettings();
    }

    function InitialiseSettings() {

        var start = moment($('input[id$=DataI]').val());
        var end = moment($('input[id$=DataF]').val());


        function cb(start, end) {
            $('input[id$=DataI]').val(start.format('YYYY-MM-DD'));
            $('input[id$=DataF]').val(end.format('YYYY-MM-DD'));
            $('#reportrange span').html(start.format('DD-MM-YYYY') + ' - ' + end.format('DD-MM-YYYY'));
            $('.daterangepicker.ltr.show-ranges.opensright').css("display", "none");
        }



        $('#reportrange').on('apply.daterangepicker', function (ev, picker) {

            $('.btnHidden').click();
            

            setTimeout(function () {
                start = moment($('input[id$=DataI]').val());
                end = moment($('input[id$=DataF]').val());
                $('#reportrange span').html(start.format('DD-MM-YYYY') + ' - ' + end.format('DD-MM-YYYY'));
            }, 500);
        });


        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end);

    };
</script>
