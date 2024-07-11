<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Daily Payments Data
        var dailyPaymentsData = @json($dailyPayments);

        var paymentDates = dailyPaymentsData.map(function(item) {
            return item.date;
        });
        var paymentAmounts = dailyPaymentsData.map(function(item) {
            return item.total_amount;
        });

        // Generate Bar Chart for Daily Payments
        c3.generate({
            bindto: '#dailyPaymentsChart',
            data: {
                x: 'x',
                columns: [
                    ['x'].concat(paymentDates),
                    ['Total Amount'].concat(paymentAmounts)
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

        // Daily Tax Charges Data
        var dailyChargesData = @json($dailyCharges);

        var chargeDates = dailyChargesData.map(function(item) {
            return item.date;
        });
        var chargeAmounts = dailyChargesData.map(function(item) {
            return item.total_amount;
        });

        // Generate Line Chart for Daily Tax Charges
        c3.generate({
            bindto: '#lineChart',
            data: {
                x: 'x',
                columns: [
                    ['x'].concat(chargeDates),
                    ['Total Tax Charges'].concat(chargeAmounts)
                ],
                colors: {
                    'Total Tax Charges': '#933EC5'
                },
                type: 'line'
            },
            axis: {
                x: {
                    type: 'category'
                }
            }
        });
    });
</script>