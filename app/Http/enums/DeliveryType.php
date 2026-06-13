<?php
namespace App\Http\enums;


enum DeliveryType: string
{
    case NO_DELIVERY = 'no_delivery';
    case FREE_DELIVERY = 'free_delivery';
    case BASED_ON_LOCATION = 'based_on_location';
    case FIXED_PRICE = 'fixed_price';
}

