<?php
// Define the order statuses as constant variables in a PHP file
// app/Constants/OrderStatusConstants.php
namespace App\Http\Constants;

class OrderStatusesConstant
{

    public const statuses = [
        'in_cart',
        'pending',
        'processing',
        'in_delivery',
        'delivered',
        'canceled',
        'returned'
    ];
}

