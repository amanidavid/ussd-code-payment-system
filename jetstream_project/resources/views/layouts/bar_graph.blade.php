<script>
    document.addEventListener('DOMContentLoaded', function() {
        var dailyPaymentsData = @json($dailyPayments);

        var dates = dailyPaymentsData.map(function(item) {
            return item.date;
        });
        var amounts = dailyPaymentsData.map(function(item) {
            return item.total_amount;
        });

        c3.generate({
            bindto: '#dailyPaymentsChart',
            data: {
                x: 'x',
                columns: [
                    ['x'].concat(dates),
                    ['Total Amount'].concat(amounts)
                ],
                colors: {
                    'Total Amount': '#006DF0'
                },
                type: 'bar'
            },
            axis: {
                x: {
                    type: 'category'
                }
            }
        });
    });
</script>