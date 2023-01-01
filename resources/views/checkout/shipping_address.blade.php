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
                            <a class="step" href="{{ route('checkout.billing') }}">
                                <h4 class="step-title">2. Billing Address:</h4>
                            </a>

                            <a class="step" href="{{ route('checkout.payment') }}">
                                <h4 class="step-title">4. Review and pay</h4>
                            </a>
                        </div>
                    </div>
                      <!-- shipping address form -->
                        <div class="shipping_form">
                            <div class="title mb-3">
                                <h3>Shipping Address</h3>
                            </div>
                            <form class="row" action="#" method="post">
                                <div class="form-group col-md-6">
                                    <label for="firstname">First Name</label>
                                    <input type="text" name="firstname" id="firstname" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="lastname">Last Name</label>
                                    <input type="text" name="lastname" id="lastname" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email Address</label>
                                    <input type="text" name="email" id="email" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone_number">Phone Number</label>
                                    <input type="text" name="phone_number" id="phone_number" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address">Address</label>
                                    <input type="text" name="address" id="address" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="apartment">Apartment (optional)</label>
                                    <input type="text" name="apartment" id="apartment" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="city">City</label>
                                    <input type="text" name="city" id="city" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="state">State</label>
                                    <input type="text" name="state" id="state" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="zip_code">Zip Code</label>
                                    <input type="text" name="zip_code" id="zip_code" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="country">Country</label>
                                    <select name="country" id="country" class="form-control">
                                        <option value="Choose Country" disabled=""></option>
                                        <option value="">Bangladesh</option>
                                        <option value="">India</option>
                                        <option value="">Pakistan</option>
                                    </select>
                                </div>
                                <div class="form-group col-12">
                                    <label for="order_note">Order notes</label>
                                    <textarea name="order_note" id="order_note" cols="30" rows="5" class="form-control"></textarea>
                                </div>
                                <div class="form-group col-12">
                                    <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="shippingAddress">
                                      <label class="form-check-label" for="shippingAddress">
                                        Same as shipping address
                                      </label>
                                    </div>
                                </div>
                                <div class="form-group col-12">
                                    <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="trams_condition">
                                      <label class="form-check-label" for="trams_condition">
                                        I agree to the <a href="#">Privacy Policy</a>.
                                      </label>
                                    </div>
                                </div>
                                <div class="form-group col-12">
                                    <div class="float-right">
                                        <button class="btn btn-primary">Continue</button>
                                    </div>
                                </div>
                            </form>
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

 