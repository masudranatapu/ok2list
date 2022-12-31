@extends('layouts.app')

@section('content')
<section id="main" class="clearfix">
    <div class="container">
        
        <div class="breadcrumb-section">
            <ol class="breadcrumb">
                <li><a href="{{url('/')}}">Home</a></li>
                <li>Checkout</li>
            </ol>
        </div>
         
        <div class="checkout_form">
            <div class="row">
                <div class="col-lg-9">
                    <div class="tab_nav">
                        <div class="steps flex-sm-nowrap">
                            <a class="step active" href="{{ route('checkout.shipping') }}">
                                <h4 class="step-title">1. Shipping Address:</h4>
                            </a>
                            <a class="step active" href="{{ route('checkout.billing') }}">
                                <h4 class="step-title">2. Billing Address:</h4>
                            </a>

                            <a class="step active" href="{{ route('checkout.payment') }}">
                                <h4 class="step-title">4. Review and pay</h4>
                            </a>
                        </div>
                    </div>
                      <!-- shipping address form -->
                    <div class="shipping_form">
                        <div class="title mb-3">
                            <h3>Review Your Order</h3>
                        </div>
                        
                        <div class="customer_info mb-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Shipping address :</h3>
                                    <table class="table">
                                        <tr>
                                            <td>Full Name:</td>
                                            <td>Rabin</td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td>mohakhali, Dhaka-1212, Bangladesh</td>
                                        </tr>
                                        <tr>
                                            <td>Apartment#:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Phone:</td>
                                            <td>123456789</td>
                                        </tr>
                                        <tr>
                                            <td>City:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>State:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Zip Code:</td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <h3>Invoice address :</h3>
                                    <table class="table">
                                        <tr>
                                            <td>Full Name:</td>
                                            <td>Rabin</td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td>mohakhali, Dhaka-1212, Bangladesh</td>
                                        </tr>
                                        <tr>
                                            <td>Apartment#:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Phone:</td>
                                            <td>123456789</td>
                                        </tr>
                                        <tr>
                                            <td>City:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>State:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Zip Code:</td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="payment_method">
                            <div class="mb-3">
                                <h3>Pay with :</h3>
                            </div>
                            
                            <div class="paystack_method">
                                <a href="#" class="text-center">
                                    <img src="{{ asset('paystack.png') }}" width="150" alt="paystack"><br/>
                                    <span>Paystack</span>
                                </a>
                            </div>

                        </div>

                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="card_pro_info">
                        <div class="sidebar_wrap mb-4">
                            <div class="heading mb-3">
                                <h3>Order Summary</h3>
                            </div>
                            <div class="order_summary">
                                 <table class="table">
                                     <tr>
                                         <td>Cart Subtotal: </td>
                                         <td>$55.00</td>
                                     </tr>
                                     <tr>
                                         <td>State tax:</td>
                                         <td>$5.00</td>
                                     </tr>
                                     <tr>
                                         <td>State tax:</td>
                                         <td>$5.66</td>
                                     </tr>
                                     <tr>
                                         <td>Shipping:</td>
                                         <td>$0.00</td>
                                     </tr>
                                     <tr>
                                         <td><strong>Order Total:</strong></td>
                                         <td><strong>$5565.44</strong></td>
                                     </tr>
                                 </table>
                            </div>                  
                        </div>
                        <div class="sidebar_wrap">
                            <div class="heading mb-3">
                                <h3>Items In Your Cart</h3>
                            </div>
                            <div class="pro_item mb-3">
                                <div class="media position-relative">
                                    <img src="http://localhost/webdevs/ok2list/public/assets/img/default_thumb.png" class="mr-2" width="65" alt="">
                                    <div class="media-body">
                                        <h4><a href="#">Dell core-i5 6th Gen 8GB DDR4 Ram</a></h4>
                                        <span>1 x $80.00</span>
                                    </div>
                                </div>
                            </div>   
                            <div class="pro_item mb-3">
                                <div class="media position-relative">
                                    <img src="http://localhost/webdevs/ok2list/public/assets/img/default_thumb.png" class="mr-2" width="65" alt="">
                                    <div class="media-body">
                                        <h4><a href="#">Dell core-i5 6th Gen 8GB DDR4 Ram</a></h4>
                                        <span>1 x $80.00</span>
                                    </div>
                                </div>
                            </div> 
                            <div class="pro_item mb-3">
                                <div class="media position-relative">
                                    <img src="http://localhost/webdevs/ok2list/public/assets/img/default_thumb.png" class="mr-2" width="65" alt="">
                                    <div class="media-body">
                                        <h4><a href="#">Dell core-i5 6th Gen 8GB DDR4 Ram</a></h4>
                                        <span>1 x $80.00</span>
                                    </div>
                                </div>
                            </div>                
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

 