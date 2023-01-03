@php
    $product = Session::get('cart');
    $tax = 0 ;
    $shipping = 30;
    $total = $product->price + $tax + $shipping ;
@endphp
<div class="col-lg-3">
    <div class="card_pro_info">
        <div class="sidebar_wrap mb-4">
            <div class="heading mb-3">
                <h3>Order Summary</h3>
            </div>
            <div class="">
                <table class="table table-borderless table-responsive">
                    <tr>
                        <th class="w-50">Cart Subtotal: </th>
                        <td class="w-50 text-right">Rs. {{ $product->price }}</td>
                    </tr>
                    {{-- <tr>
                        <th class="w-50">State tax:</th>
                        <td class="w-50 text-right">$5.00</td>
                    </tr> --}}
                    <tr>
                        <th class="w-50">Tax:</th>
                        <td class="w-50 text-right">Rs. <span id="tax">{{ $tax }}</span></td>
                    </tr>
                    <tr>
                        <th class="w-50">Shipping:</th>
                        <td class="w-50 text-right">Rs. {{ $shipping }}</td>
                    </tr>
                    <tr class="text-danger">
                        <th class="w-50"><strong>Order Total:</strong></th>
                        <td class="w-50 text-right"><strong>Rs. {{ $total }}</strong></td>
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
                    <img src="{{ asset($product->photo ?? 'assets/img/default_thumb.png') }}" class="mr-2"
                        width="65" alt="">
                    <div class="media-body">
                        <h4><a href="{{ route('ad.details', $product->pk_no, $product->url_slug) }}">{{ $product->ad_title }}</a></h4>
                        <span>{{ '1 x ' . $product->price }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
