<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\SubCategoryController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('home.home');
});

Route::get('cc', 'HomeController@cc');

Route::get('changelang', 'CommonController@setLanguage')->name('changelang');

Route::get('paypal/payment', 'PayPalController@paypal_view');
Route::get('get/payment', 'PayPalController@payment')->name('payment');
Route::get('cancel', 'PayPalController@cancel')->name('payment.cancel');
Route::get('payment/success', 'PayPalController@success')->name('payment.success');

Route::get('/', 'HomeController@index')->name('home');
Route::get('/verify/user/{token}', 'HomeController@verifyUser')->name('verify-user');
Route::get('/about-us', 'CommonController@getAboutUs')->name('about-us');
Route::get('/contact-us', 'CommonController@getContactUs')->name('contact-us');
Route::get('/terms-conditions', 'CommonController@getTermsConditions')->name('terms-conditions');
Route::get('/promote-your-ad', 'CommonController@getPromoteAd')->name('promote-ads');
Route::get('/privacy-policy', 'CommonController@getPrivacyPolicy')->name('privacy-policy');
Route::get('/how-to-sell-fast', 'CommonController@getHowToSellFast')->name('how-to-sell-fast');
Route::get('/get-membership', 'CommonController@getMembership')->name('get-membership');
Route::get('/faq', 'CommonController@getFaq')->name('faq');
Route::get('/promotions', 'CommonController@getPromotions')->name('promotions');
Route::get('/packages', 'CommonController@getPackages')->name('packages');
Route::get('/payment/gateway', 'CommonController@payment_gateway')->name('payment.gateway');
Route::get('promotion/payment/gateway', 'CommonController@promotion_payment_gateway')->name('promotion.payment.gateway');
Route::get('/package/free', 'PackageController@getFreePackage')->name('package.free');
Route::get('/site-map', 'CommonController@getSiteMap')->name('site-map');
Route::get('/doorstep-delivery', 'CommonController@getDoorstepDelivery')->name('doorstep-delivery');


// doorstep checkout
Route::get('/addToCart', 'CheckoutController@addToCart')->name('addToCart');
Route::get('/checkout/shipping/address', 'CheckoutController@checkoutShipping')->name('checkout.shipping');
Route::post('/checkout/shipping/store', 'CheckoutController@storeShipping')->name('checkout.shipping.store');
Route::get('/checkout/billing/address', 'CheckoutController@checkoutBilling')->name('checkout.billing');
Route::post('/checkout/billing/store', 'CheckoutController@storeBilling')->name('checkout.billing.store');
Route::get('/checkout/review/payment', 'CheckoutController@checkoutPayment')->name('checkout.payment');
Route::get('/checkout/paystack/payment', 'CheckoutController@paystackPayment')->name('checkout.paystack.payment');

//Ad post
Route::get('/ad-post/{subcategory?}', 'AdPostController@getAdPost')->name('ad-post');
Route::post('/ad-post/{subcategory?}', 'AdPostController@postAdGeneral')->name('post-general.store');
Route::post('/ad-post-property/{subcategory?}', 'AdPostController@postAdProperty')->name('post-property.store');
Route::post('/ad-post-job/{subcategory?}', 'AdPostController@postAdJob')->name('post-job.store');
Route::post('/ad-post-service/{subcategory?}', 'AdPostController@postAdService')->name('post-service.store');

Route::get('/ad/edit-post/{id}/{subcategory?}', 'AdPostController@getEditAds')->name('edit-post');
Route::get('/ad/prod_img_delete/{id}', 'AdPostController@getDeleteImage')->name('product.img_delete');
Route::post('/ad/update-post/{id}', 'AdPostController@updatePostGeneral')->name('update-post-general.update');
Route::post('/ad/update-post-service/{id}', 'AdPostController@updatePostAdService')->name('update-post-service.update');
Route::post('/ad/update-post-property/{id}', 'AdPostController@updatePostProperty')->name('update-post-property.update');
Route::post('/ad/update-post-job/{id}', 'AdPostController@updatePostJob')->name('update-post-job.update');

Route::get('/ad-post/{id}/like', 'AdPostController@getPostLike')->name('ad-post-like');
Route::get('/ad-post/{id}/dislike', 'AdPostController@getPostDislike')->name('ad-post-dislike');

Route::get('/ad/{pk_no}/{url_slug?}', 'AdsController@getAdDetails')->name('ad.details');

Route::post('/ad/{pk_no}/report', 'AdsController@postAdReport')->name('ad.report');
Route::get('/shop/{id}/{url_slug?}', 'AdsController@getShopPage')->name('shop_page_details');

Route::get('/ads/{area?}/{category?}', 'AdsController@getAdsList')->name('ads.list');
//Route::get('/ads/{area?}/{category?}', 'AdsController@getAdsList')->name('ads.area');

//user shop route
Route::get('/create-shop', ['as' => 'create-shop', 'uses' => 'ShopController@getCreateShop', 'middleware' => 'checkPackage']);

Route::post('/store-shop', ['as' => 'store-shop', 'uses' => 'ShopController@getStoreShop', 'middleware' => 'checkPackage']);

Route::get('/my-shop', 'ShopController@getMyShop')->name('my-shop');
// Route::get('/modify-shop', 'ShopController@getModifyShop')->name('modify-shop');
Route::post('/update-shop', 'ShopController@getUpdateShop')->name('update-shop');

Route::get('/dashboard-overview', 'UserController@getDashboardOverview')->name('dashboard-overview');
Route::get('/my-dashboard', 'UserController@getMyDashboard')->name('my-dashboard');
Route::get('/my-ads', 'AdPostController@getMyAds')->name('my-ads');
Route::get('/ad-expired/{id}', 'AdPostController@adExpired')->name('ad-expired');
Route::post('/expired-update', 'AdPostController@expiredUpdate')->name('expired-update');
Route::get('/my-ads/{id}/delete', 'AdPostController@getMyAdDelete')->name('my-ads.delete');
Route::post('/my-profile-update', 'UserController@postMyProfileUpdate')->name('my-profile-update');
Route::post('/my-password-update', 'UserController@postMyPasswordUpdate')->name('my-password-update');
Route::get('/my-membership', 'UserController@getMyMembership')->name('my-membership');
Route::get('/favorite-ads', 'UserController@getFavoriteAds')->name('favorite-ads');
Route::post('/favorite-ad', 'UserController@postFavoriteAd')->name('favorite-ad');
Route::get('/promoted-ads', 'AdPromotionController@getpromotedAds')->name('promoted-ads');
Route::get('/promoted-ads/{id}/new', 'AdPromotionController@getPromoteAd')->name('promoted-ads.create');
Route::get('/ads-promotion', 'AdPromotionController@getAdsPromotion')->name('ads-promotion');
Route::get('/get-product-model/{brand_id}', 'AdPostController@getProductModel')->name('prod_model');
Route::get('/get-area/{location}/{type}', 'CommonController@getArea')->name('get-area');
Route::get('/check-otp/{mobile}/{serial}', 'OTPController@checkOTP')->name('check-otp');
Route::get('/verify-otp/{otp}/{serial}', 'OTPController@verifyOTP')->name('verify-otp');
// Purchase history
Route::get('/purchase-history', 'UserController@getMyPurchaseHistory')->name('purchase-history');
Route::get('/invoice/{id}', 'UserController@getMyPurchaseInvoice')->name('purchase.invoice');
// Order history
Route::get('/my-orders', 'UserController@myOrders')->name('user.orders');
Route::get('/order-details/{id}', 'UserController@orderDetails')->name('user.order.details');


// Review

Route::post('/seller/rate', 'UserController@rateReview')->name('seller.review');


//contact
Route::post('/contact-us', 'ContactController@contactUs')->name('contact');
//subscribe
Route::post('/subscribe', 'SubscribeController@subscribeUs')->name('subscribe');

//payment
Route::post('/payment/create', 'PaymentController@getCreate')->name('payment.create');
Route::post('/payment/success', 'PaymentController@paymentSuccess')->name('payment.success');
Route::get('/payment/failed', 'PaymentController@getFailed')->name('payment.failed');
Route::get('/payment/free-promtion', 'PaymentController@freePayment')->name('payment.free_promtion');

//fb login
Route::get('login/facebook', 'Auth\LoginController@redirectToProvider');
Route::get('login/facebook/callback', 'Auth\LoginController@handleProviderCallback');

//google
Route::get('login/google', 'Auth\LoginController@redirectToGoogle');
Route::get('login/google/callback', 'Auth\LoginController@handleGoogleCallback');

//Need login
Route::get('/chat', 'ChatController@getChatList')->name('chat');
Route::get('/chat/get/{ad_id}/{to_pk_no}', 'ChatController@getChat')->name('chat.get');
Route::post('/chat/store', 'ChatController@postChat')->name('chat.store');

// Route::post('/ad-post/{subcategory?}', 'AdPostController@postElectronicMobile')->name('post_electronic_mobile.store');
Route::get('/test', 'AdPostController@test')->name('test');

// Route::get('/dashboard', function () {

//     if (Auth::check()) {
//         return redirect()->route('admin.dashboard');
//     }

//     return redirect()->route('admin.login');
// });

Route::get('admin', ['as' => 'admin.login', 'uses' => 'Admin\AdminAuthController@getLogin']);
Route::get('admin/login', ['as' => 'admin.login', 'uses' => 'Admin\AdminAuthController@getLogin']);
Route::post('admin/admin', ['as' => 'admin.login.save', 'uses' => 'Admin\AdminAuthController@postLogin']);
Route::get('admin/logout', ['as' => 'admin.logout', 'uses' => 'Admin\AdminAuthController@getLogout']);
Route::get('stripe', ['as' => 'stripe.payment', 'uses' => 'StripePaymentController@stripe']);
Route::post('stripe/post', ['as' => 'stripe.post', 'uses' => 'StripePaymentController@stripePost']);

Route::group(['prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => 'auth:admin'], function () {
    // Dashboard
    //Route::get('dashboard', ['middleware' => 'acl:dashboard', 'as' => 'admin.dashboard', 'uses' => 'DashboardController@index']);
    Route::get('dashboard', ['as' => 'admin.dashboard', 'uses' => 'DashboardController@getIndex']);
    // Route::get('/admin/dasb', ['as' => 'admin.dashboard', 'uses' => 'DashboardController@homepage']);
    // Admin User
    Route::get('admin-users', ['middleware' => 'acl:view_admin_user', 'as' => 'admin.admin-user', 'uses' => 'AdminUserController@getIndex']);
    Route::get('admin-user/new', ['middleware' => 'acl:add_admin_user', 'as' => 'admin.admin-user.new', 'uses' => 'AdminUserController@getCreate']);
    Route::post('admin-user/store', ['middleware' => 'acl:add_admin_user', 'as' => 'admin.admin-user.store', 'uses' => 'AdminUserController@postStore']);
    Route::get('admin-user/{id}/edit', ['middleware' => 'acl:edit_admin_user', 'as' => 'admin.admin-user.edit', 'uses' => 'AdminUserController@getEdit']);
    Route::post('admin-user/{id}/update', ['middleware' => 'acl:edit_admin_user', 'as' => 'admin.admin-user.update', 'uses' => 'AdminUserController@putUpdate']);
    Route::get('admin-user/{id}/delete', ['middleware' => 'acl:delete_admin_user', 'as' => 'admin.admin-user.delete', 'uses' => 'AdminUserController@getDelete']);

    // languages
    Route::resource('languages', LanguagesController::class);
    Route::put('setdefaultlanguage', [App\Http\Controllers\Admin\LanguagesController::class, 'setDefaultLanguage'])->name('setDefault.Language');
    Route::get('languages/setting/{code}', [App\Http\Controllers\Admin\LanguagesController::class, 'languageSetting'])->name('Language.setting');
    // translation
    Route::post('translation/update', [App\Http\Controllers\Admin\LanguagesController::class, 'transUpdate'])->name('translation.update');
    Route::post('auto/translation/single', [App\Http\Controllers\Admin\LanguagesController::class, 'autoTransSingle'])->name('translation.update.auto');
    Route::post('auto/translation/update/all', [App\Http\Controllers\Admin\LanguagesController::class, 'transUpdateAutoAll'])->name('translation.update.auto.all');
    
    // User-Group
    Route::get('user-group', ['middleware' => 'acl:view_user_group', 'as' => 'admin.user-group', 'uses' => 'UserGroupController@getIndex']);
    Route::get('user-group/new', ['middleware' => 'acl:new_user_group', 'as' => 'admin.user-group.new', 'uses' => 'UserGroupController@getCreate']);
    Route::post('user-group/store', ['middleware' => 'acl:new_user_group', 'as' => 'admin.user-group.store', 'uses' => 'UserGroupController@postStore']);
    Route::get('user-group/{id}/edit', ['middleware' => 'acl:edit_user_group', 'as' => 'admin.user-group.edit', 'uses' => 'UserGroupController@getEdit']);
    Route::post('user-group/{id}/update', ['middleware' => 'acl:edit_user_group', 'as' => 'admin.user-group.update', 'uses' => 'UserGroupController@putUpdate']);
    Route::get('user-group/{id}/delete', ['middleware' => 'acl:delete_user_group', 'as' => 'admin.user-group.delete', 'uses' => 'UserGroupController@getDelete']);

    // User-Group
    Route::get('assign-access', ['middleware' => 'acl:assign_user_access', 'as' => 'admin.assign-access', 'uses' => 'AssignAccessController@getIndex']);
    Route::post('assign-access', ['middleware' => 'acl:assign_user_access', 'as' => 'admin.assign-access', 'uses' => 'AssignAccessController@postIndex']);

    // Role
    Route::get('role', ['middleware' => 'acl:view_role', 'as' => 'admin.role', 'uses' => 'RoleController@getIndex']);
    Route::get('role/new', ['middleware' => 'acl:add_role', 'as' => 'admin.role.new', 'uses' => 'RoleController@getCreate']);
    Route::post('role/store', ['middleware' => 'acl:add_role', 'as' => 'admin.role.store', 'uses' => 'RoleController@postStore']);
    Route::get('role/{id}/edit', ['middleware' => 'acl:edit_role', 'as' => 'admin.role.edit', 'uses' => 'RoleController@getEdit']);
    Route::post('role/{id}/update', ['middleware' => 'acl:edit_role', 'as' => 'admin.role.update', 'uses' => 'RoleController@postUpdate']);
    Route::get('role/{id}/delete', ['middleware' => 'acl:delete_role', 'as' => 'admin.role.delete', 'uses' => 'RoleController@getDelete']);

    // Permission-Group
    Route::get('permission-group', ['middleware' => 'acl:view_menu', 'as' => 'admin.permission-group', 'uses' => 'PermissionGroupController@getIndex']);
    Route::get('permission-group/new', ['middleware' => 'acl:new_menu', 'as' => 'admin.permission-group.new', 'uses' => 'PermissionGroupController@getCreate']);
    Route::post('permission-group/store', ['middleware' => 'acl:new_menu', 'as' => 'admin.permission-group.store', 'uses' => 'PermissionGroupController@postStore']);
    Route::get('permission-group/{id}/edit', ['middleware' => 'acl:edit_menu', 'as' => 'admin.permission-group.edit', 'uses' => 'PermissionGroupController@getEdit']);
    Route::post('permission-group/{id}/update', ['middleware' => 'acl:edit_menu', 'as' => 'admin.permission-group.update', 'uses' => 'PermissionGroupController@putUpdate']);
    Route::get('permission-group/{id}/delete', ['middleware' => 'acl:delete_menu', 'as' => 'admin.permission-group.delete', 'uses' => 'PermissionGroupController@getDelete']);

    // permission
    Route::get('permission', ['middleware' => 'acl:view_action', 'as' => 'admin.permission', 'uses' => 'PermissionController@getIndex']);
    Route::get('permission/new', ['middleware' => 'acl:new_action', 'as' => 'admin.permission.new', 'uses' => 'PermissionController@getCreate']);
    Route::post('permission/store', ['middleware' => 'acl:new_action', 'as' => 'admin.permission.store', 'uses' => 'PermissionController@postStore']);
    Route::get('permission/{id}/edit', ['middleware' => 'acl:edit_action', 'as' => 'admin.permission.edit', 'uses' => 'PermissionController@getEdit']);
    Route::post('permission/{id}/update', ['middleware' => 'acl:edit_action', 'as' => 'admin.permission.update', 'uses' => 'PermissionController@putUpdate']);
    Route::get('permission/{id}/delete', ['middleware' => 'acl:delete_action', 'as' => 'admin.permission.delete', 'uses' => 'PermissionController@getDelete']);

    // Gym Admin
    // Route::get('gym-admin', ['as' => 'admin.gym-admin', 'uses' => 'GymAdminController@getIndex']);
    // Route::get('gym-admin/new', ['as' => 'admin.gym-admin.new', 'uses' => 'GymAdminController@getCreate']);
    // Route::post('gym-admin/store', ['as' => 'admin.gym-admin.store', 'uses' => 'GymAdminController@postStore']);
    // Route::get('gym-admin/{id}/edit', ['as' => 'admin.gym-admin.edit', 'uses' => 'GymAdminController@getEdit']);
    // Route::post('gym-admin/{id}/update', ['as' => 'admin.gym-admin.update', 'uses' => 'GymAdminController@putUpdate']);
    // Route::get('gym-admin/{id}/delete', ['as' => 'admin.gym-admin.delete', 'uses' => 'GymAdminController@getDelete']);

    // Gym
    // Route::get('gym', ['as' => 'admin.gym', 'uses' => 'GymController@getIndex']);
    // Route::get('gym/new', ['as' => 'admin.gym.new', 'uses' => 'GymController@getCreate']);
    // Route::post('gym/store', ['as' => 'admin.gym.store', 'uses' => 'GymController@postStore']);
    // Route::get('gym/{id}/edit', ['as' => 'admin.gym.edit', 'uses' => 'GymController@getEdit']);
    // Route::post('gym/{id}/update', ['as' => 'admin.gym.update', 'uses' => 'GymController@putUpdate']);
    // Route::get('gym/{id}/delete', ['as' => 'admin.gym.delete', 'uses' => 'GymController@getDelete']);

    // Workout Body Parts
    // Route::get('workout-body-parts', ['as' => 'admin.workout-body-parts', 'uses' => 'WorkoutBodyPartsController@getIndex']);
    // Route::get('workout-body-parts/new', ['as' => 'admin.workout-body-parts.new', 'uses' => 'WorkoutBodyPartsController@getCreate']);
    // Route::post('workout-body-parts/store', ['as' => 'admin.workout-body-parts.store', 'uses' => 'WorkoutBodyPartsController@postStore']);
    // Route::get('workout-body-parts/{id}/edit', ['as' => 'admin.workout-body-parts.edit', 'uses' => 'WorkoutBodyPartsController@getEdit']);
    // Route::post('workout-body-parts/{id}/update', ['as' => 'admin.workout-body-parts.update', 'uses' => 'WorkoutBodyPartsController@putUpdate']);
    // Route::get('workout-body-parts/{id}/delete', ['as' => 'admin.workout-body-parts.delete', 'uses' => 'WorkoutBodyPartsController@getDelete']);

    // Workout item
    // Route::get('workout-item', ['as' => 'admin.workout-item', 'uses' => 'WorkoutItemController@getIndex']);
    // Route::get('workout-item/new', ['as' => 'admin.workout-item.new', 'uses' => 'WorkoutItemController@getCreate']);
    // Route::post('workout-item/store', ['as' => 'admin.workout-item.store', 'uses' => 'WorkoutItemController@postStore']);
    // Route::get('workout-item/{id}/edit', ['as' => 'admin.workout-item.edit', 'uses' => 'WorkoutItemController@getEdit']);
    // Route::post('workout-item/{id}/update', ['as' => 'admin.workout-item.update', 'uses' => 'WorkoutItemController@putUpdate']);
    // Route::get('workout-item/{id}/delete', ['as' => 'admin.workout-item.delete', 'uses' => 'WorkoutItemController@getDelete']);

    //product
    Route::get('product', ['middleware' => 'acl:view_product', 'as' => 'admin.product.list', 'uses' => 'ProductController@getIndex']);
    Route::get('product/{id}/reports', ['middleware' => 'acl:view_product', 'as' => 'product.reports', 'uses' => 'ProductController@getReport']);
    Route::get('product/{id}/edit', ['middleware' => 'acl:edit_product', 'as' => 'admin.product.edit', 'uses' => 'ProductController@getEdit']);
    Route::get('product/{id}/view', ['middleware' => 'acl:view_product', 'as' => 'admin.product.view', 'uses' => 'ProductController@getView']);
    Route::get('product/get-url-slug', ['middleware' => 'acl:edit_product', 'as' => 'get-url-slug', 'uses' => 'ProductController@getUrlSlug']);
    Route::post('product/{id}/update', ['middleware' => 'acl:edit_product', 'as' => 'admin.product.update', 'uses' => 'ProductController@putUpdate']);
    Route::get('product/{id}/delete', ['middleware' => 'acl:delete_product', 'as' => 'admin.product.delete.single', 'uses' => 'ProductController@getDelete']);
    Route::get('product/{id}/delete_all', ['middleware' => 'acl:delete_product', 'as' => 'admin.product.delete', 'uses' => 'ProductController@getDeleteall']);
    Route::get('product-select-deleted', ['middleware' => 'acl:delete_product', 'as' => 'admin.product.selecteddelete', 'uses' => 'ProductController@getDeleteallSelected']);

    //product-model
    Route::get('product-model', ['middleware' => 'acl:view_model', 'as' => 'admin.product-model', 'uses' => 'ProductModelController@getIndex']);
    Route::get('product-model/new', ['middleware' => 'acl:new_model', 'as' => 'admin.product-model.new', 'uses' => 'ProductModelController@getCreate']);
    Route::post('product-model/store', ['middleware' => 'acl:new_model', 'as' => 'admin.product-model.store', 'uses' => 'ProductModelController@postStore']);
    Route::get('product-model/{PK_NO}/edit', ['middleware' => 'acl:edit_model', 'as' => 'admin.product-model.edit', 'uses' => 'ProductModelController@getEdit']);
    Route::post('product-model/{PK_NO}/update', ['middleware' => 'acl:edit_model', 'as' => 'admin.product-model.update', 'uses' => 'ProductModelController@putUpdate']);
    Route::get('product-model/{PK_NO}/delete', ['middleware' => 'acl:delete_model', 'as' => 'admin.product-model.delete', 'uses' => 'ProductModelController@getDelete']);
    Route::get('get_brand/{sub_category_id}', ['middleware' => 'acl:new_model', 'as' => 'admin.get_brand', 'uses' => 'BrandController@getBrandBySubCat']);

    //Brand
    Route::get('product-brand', ['middleware' => 'acl:view_brand', 'as' => 'admin.brand.list', 'uses' => 'BrandController@getIndex']);
    Route::get('product-brand/new', ['middleware' => 'acl:new_brand', 'as' => 'admin.brand.create', 'uses' => 'BrandController@getCreate']);
    Route::post('product-brand/store', ['middleware' => 'acl:new_brand', 'as' => 'admin.brand.store', 'uses' => 'BrandController@postStore']);
    Route::get('product-brand/{id}/edit', ['middleware' => 'acl:edit_brand', 'as' => 'admin.brand.edit', 'uses' => 'BrandController@postEdit']);
    Route::post('product-brand/{id}/update', ['middleware' => 'acl:edit_brand', 'as' => 'admin.brand.update', 'uses' => 'BrandController@postUpdate']);
    Route::get('product-brand/{id}/delete', ['middleware' => 'acl:delete_brand', 'as' => 'admin.brand.delete', 'uses' => 'BrandController@getDelete']);
    Route::get('get_brand/{sub_category_id}', ['middleware' => 'acl:new_brand', 'as' => 'admin.get_brand', 'uses' => 'BrandController@getBrandBySubCat']);
    Route::get('prod_subcategory/{id}', ['middleware' => 'acl:new_brand', 'as' => 'product.prod_subcategory.', 'uses' => 'ProductController@getSubcat']);

    //Package
    Route::get('package-list', ['middleware' => 'acl:view_package', 'as' => 'admin.package.lists', 'uses' => 'PackageController@getIndex']);
    Route::get('package/new', ['middleware' => 'acl:new_package', 'as' => 'admin.package.create', 'uses' => 'PackageController@getCreate']);
    Route::post('package/store', ['middleware' => 'acl:new_package', 'as' => 'admin.package.store', 'uses' => 'PackageController@postStore']);
    Route::get('package/{id}/edit', ['middleware' => 'acl:edit_package', 'as' => 'admin.package.edit', 'uses' => 'PackageController@getEdit']);
    Route::post('package/{id}/update', ['middleware' => 'acl:edit_package', 'as' => 'admin.package.update', 'uses' => 'PackageController@postUpdate']);
    Route::get('package/{id}/delete', ['middleware' => 'acl:delete_package', 'as' => 'admin.package.delete', 'uses' => 'PackageController@getDelete']);

    //City
    Route::get('city', ['middleware' => 'acl:view_city', 'as' => 'admin.city.list', 'uses' => 'CityController@getIndex']);
    Route::get('city/new', ['middleware' => 'acl:new_city', 'as' => 'admin.city.create', 'uses' => 'CityController@getCreate']);
    Route::post('city/store', ['middleware' => 'acl:new_city', 'as' => 'admin.city.store', 'uses' => 'CityController@postStore']);
    Route::get('city/{id}/edit', ['middleware' => 'acl:edit_city', 'as' => 'admin.city.edit', 'uses' => 'CityController@getEdit']);
    Route::post('city/{id}/update', ['middleware' => 'acl:edit_city', 'as' => 'admin.city.update', 'uses' => 'CityController@postUpdate']);
    Route::get('city/{PK_NO}/delete', ['middleware' => 'acl:delete_city', 'as' => 'admin.city.delete', 'uses' => 'CityController@getDelete']);
    Route::get('get-area-by-location/{location}/{location_id}', ['middleware' => 'acl:view_city', 'as' => 'get-area-by-location', 'uses' => 'CityController@getAreaByLocation']);

    //Division
    Route::get('division', ['middleware' => 'acl:view_division', 'as' => 'admin.division.list', 'uses' => 'DivisionController@getIndex']);
    Route::get('division/new', ['middleware' => 'acl:new_division', 'as' => 'admin.division.create', 'uses' => 'DivisionController@getCreate']);
    Route::post('division/store', ['middleware' => 'acl:new_division', 'as' => 'admin.division.store', 'uses' => 'DivisionController@postStore']);
    Route::get('division/{id}/edit', ['middleware' => 'acl:edit_division', 'as' => 'admin.division.edit', 'uses' => 'DivisionController@getEdit']);
    Route::post('division/{id}/update', ['middleware' => 'acl:edit_division', 'as' => 'admin.division.update', 'uses' => 'DivisionController@postUpdate']);
    Route::get('division/{id}/delete', ['middleware' => 'acl:delete_division', 'as' => 'admin.division.delete', 'uses' => 'DivisionController@getDelete']);

    //Area
    Route::get('area', ['middleware' => 'acl:view_area', 'as' => 'admin.area.list', 'uses' => 'AreaController@getIndex']);
    Route::get('area/new', ['middleware' => 'acl:new_area', 'as' => 'admin.area.create', 'uses' => 'AreaController@getCreate']);
    Route::post('area/store', ['middleware' => 'acl:new_area', 'as' => 'admin.area.store', 'uses' => 'AreaController@postStore']);
    Route::get('area/{id}/edit', ['middleware' => 'acl:edit_area', 'as' => 'admin.area.edit', 'uses' => 'AreaController@getEdit']);
    Route::post('area/{id}/update', ['middleware' => 'acl:edit_area', 'as' => 'admin.area.update', 'uses' => 'AreaController@postUpdate']);
    Route::get('area/{id}/delete', ['middleware' => 'acl:delete_area', 'as' => 'admin.area.delete', 'uses' => 'AreaController@getDelete']);

    //Product Type
    Route::get('product-type', ['middleware' => 'acl:view_product_type', 'as' => 'admin.product_type.list', 'uses' => 'ProductTypeController@getIndex']);
    Route::get('product-type/new', ['middleware' => 'acl:new_product_type', 'as' => 'admin.product_type.create', 'uses' => 'ProductTypeController@getCreate']);
    Route::post('product-type/store', ['middleware' => 'acl:new_product_type', 'as' => 'admin.product_type.store', 'uses' => 'ProductTypeController@postStore']);
    Route::get('product-type/{id}/edit', ['middleware' => 'acl:edit_product_type', 'as' => 'admin.product_type.edit', 'uses' => 'ProductTypeController@getEdit']);
    Route::post('product-type/{id}/update', ['middleware' => 'acl:edit_product_type', 'as' => 'admin.product_type.update', 'uses' => 'ProductTypeController@postUpdate']);
    Route::get('product-type/{id}/delete', ['middleware' => 'acl:delete_product_type', 'as' => 'admin.product_type.delete', 'uses' => 'ProductTypeController@getDelete']);

    //Customer
    Route::get('customer', ['middleware' => 'acl:view_customer', 'as' => 'admin.customer.list', 'uses' => 'CustomerController@getIndex']);
    Route::get('customer/new', ['middleware' => 'acl:new_customer', 'as' => 'admin.customer.create', 'uses' => 'CustomerController@getCreate']);
    Route::post('customer/store', ['middleware' => 'acl:new_customer', 'as' => 'admin.customer.store', 'uses' => 'CustomerController@postStore']);
    Route::get('customer/{id}/edit', ['middleware' => 'acl:edit_customer', 'as' => 'admin.customer.edit', 'uses' => 'CustomerController@getEdit']);
    Route::get('customer/{id}/view', ['middleware' => 'acl:view_customer', 'as' => 'admin.customer.view', 'uses' => 'CustomerController@getView']);
    Route::post('customer/{id}/update', ['middleware' => 'acl:edit_customer', 'as' => 'admin.customer.update', 'uses' => 'CustomerController@postUpdate']);
    Route::get('customer/{id}/delete', ['middleware' => 'acl:delete_customer', 'as' => 'admin.customer.delete', 'uses' => 'CustomerController@getDelete']);
    Route::get('customer/{id}/active', ['middleware' => 'acl:edit_customer', 'as' => 'admin.customer.active', 'uses' => 'CustomerController@active']);
    Route::get('customer/ads/view/{id}', ['middleware' => 'acl:viewads_customer', 'as' => 'admin.customer.ads', 'uses' => 'CustomerController@customerAdsView']);

    //Category
    Route::get('category', ['middleware' => 'acl:view_category', 'as' => 'product.category.list', 'uses' => 'CategoryController@getIndex']);
    Route::get('category/new', ['middleware' => 'acl:new_category', 'as' => 'product.category.create', 'uses' => 'CategoryController@getCreate']);
    Route::post('category/store', ['middleware' => 'acl:new_category', 'as' => 'product.category.store', 'uses' => 'CategoryController@postStore']);
    Route::get('category/{id}/edit', ['middleware' => 'acl:edit_category', 'as' => 'product.category.edit', 'uses' => 'CategoryController@getEdit']);
    Route::post('category/{id}/update', ['middleware' => 'acl:edit_category', 'as' => 'product.category.update', 'uses' => 'CategoryController@postUpdate']);
    Route::get('category/{id}/delete', ['middleware' => 'acl:delete_category', 'as' => 'product.category.delete', 'uses' => 'CategoryController@getDelete']);

    //Sub Category
    Route::get('sub_category/{cat_id?}', ['middleware' => 'acl:view_sub_category', 'as' => 'admin.sub_category.list', 'uses' => 'SubCategoryController@getIndex']);
    Route::get('sub_category/new', ['middleware' => 'acl:new_sub_category', 'as' => 'admin.sub_category.create', 'uses' => 'SubCategoryController@getCreate']);
    Route::post('sub_category/store', ['middleware' => 'acl:new_sub_category', 'as' => 'admin.sub_category.store', 'uses' => 'SubCategoryController@postStore']);
    Route::get('sub_category/{id}/edit', ['middleware' => 'acl:edit_sub_category', 'as' => 'admin.sub_category.edit', 'uses' => 'SubCategoryController@getEdit']);
    Route::post('sub_category/{id}/update', ['middleware' => 'acl:edit_sub_category', 'as' => 'admin.sub_category.update', 'uses' => 'SubCategoryController@postUpdate']);
    Route::get('sub_category/{id}/delete', ['middleware' => 'acl:delete_sub_category', 'as' => 'admin.sub_category.delete', 'uses' => 'SubCategoryController@getDelete']);

    //packages
    // Route::get('package', ['middleware' => 'acl:view_sub_category', 'as' => 'admin.package.create', 'uses' => 'PackageController@getIndex']);
    Route::get('package/{id}/view', ['middleware' => 'acl:view_sub_category', 'as' => 'admin.package.view', 'uses' => 'PackageController@getView']);
    Route::get('package/{id}/edit', ['middleware' => 'acl:view_sub_category', 'as' => 'admin.package.edit', 'uses' => 'PackageController@getEdit']);

    //promotion
    Route::get('promotion', ['middleware' => 'acl:view_promotion', 'as' => 'admin.promotion.list', 'uses' => 'PromotionController@getIndex']);
    Route::get('promotion/{id}/view', ['middleware' => 'acl:view_promotion', 'as' => 'admin.promotion.view', 'uses' => 'PromotionController@getView']);
    Route::get('promotion/{id}/edit', ['middleware' => 'acl:edit_promotion', 'as' => 'admin.promotion.edit', 'uses' => 'PromotionController@getEdit']);
    Route::post('promotion/{id}/update', ['middleware' => 'acl:edit_promotion', 'as' => 'admin.promotion.update', 'uses' => 'PromotionController@postUpdate']);

    //site setting routes
    Route::get('/admin/about-us', ['middleware' => 'acl:view_about_us', 'as' => 'admin.about.us', 'uses' => 'SettingController@getAboutUs']);
    Route::post('/admin/about-us-update/{id}', ['middleware' => 'acl:view_about_us', 'as' => 'admin.about.us.update', 'uses' => 'SettingController@getAboutUsUpdate']);
    Route::get('admin/contact-us', ['middleware' => 'acl:view_contact_us', 'as' => 'admin.contact.us', 'uses' => 'SettingController@getContactUs']);
    Route::get('terms-&-conditions', ['middleware' => 'acl:view_terms_condition', 'as' => 'admin.terms.conditions', 'uses' => 'SettingController@getTermsConditions']);
    Route::post('terms-&-conditions->update/{id}', ['middleware' => 'acl:view_terms_condition', 'as' => 'admin.terms.conditions.update', 'uses' => 'SettingController@getTermsConditionsUpdate']);
    Route::get('admin/privacy-policy', ['middleware' => 'acl:view_privacy_policy', 'as' => 'admin.privacy.policy', 'uses' => 'SettingController@getPrivacyPolicy']);
    Route::post('admin/privacy-policy-update/{id}', ['middleware' => 'acl:view_privacy_policy', 'as' => 'admin.privacy.policy.update', 'uses' => 'SettingController@getPrivacyPolicyUpdate']);
    Route::get('quick-rules', ['middleware' => 'acl:view_quick_rules', 'as' => 'admin.quick.rules', 'uses' => 'SettingController@getQuickRules']);
    Route::post('quick-rules/update/{id}', ['middleware' => 'acl:view_quick_rules', 'as' => 'admin.quick.rulesupdate', 'uses' => 'SettingController@getQuickRulesUpdate']);

    Route::get('why-membership', ['middleware' => 'acl:view_why_membership', 'as' => 'admin.why.membership', 'uses' => 'SettingController@getWhyMembership']);
    Route::post('why-membership-update/{id}', ['middleware' => 'acl:view_why_membership', 'as' => 'admin.why.membership.update', 'uses' => 'SettingController@getWhyMembershipUpdate']);
    Route::get('mail', ['middleware' => 'acl:view_mail_configuration', 'as' => 'admin.mail.configuration', 'uses' => 'SettingController@getMailConfig']);
    Route::get('footer', ['middleware' => 'acl:view_footer', 'as' => 'admin.footer', 'uses' => 'SettingController@getFooter']);
    Route::post('footer/update/{id}', ['middleware' => 'acl:view_footer', 'as' => 'admin.footer.update', 'uses' => 'SettingController@getFooterUpdate']);
    Route::get('copy-right', ['middleware' => 'acl:view_copy_right', 'as' => 'admin.copy.right', 'uses' => 'SettingController@getCopyRight']);
    Route::post('copy-right-update/{id}', ['middleware' => 'acl:view_copy_right', 'as' => 'admin.copy.right.update', 'uses' => 'SettingController@getCopyRightUpdate']);

    //page
    Route::get('howto-sell-fast', ['middleware' => 'acl:view_howtosell', 'as' => 'admin.howtosell.fast', 'uses' => 'PageController@getHowToSellFast']);
    Route::post('howto-sell-fast', ['middleware' => 'acl:view_howtosell', 'as' => 'admin.howtosell.fast.store', 'uses' => 'PageController@postHowToSellFast']);
    Route::get('promotions', ['middleware' => 'acl:view_promotions', 'as' => 'admin.promotions', 'uses' => 'PageController@admingetPromotions']);
    Route::post('promotions-update/{id}', ['middleware' => 'acl:view_promotions', 'as' => 'admin.promotions.update', 'uses' => 'PageController@admingetPromotionsUpdate']);
    Route::get('promote', ['middleware' => 'acl:view_promote', 'as' => 'admin.promote', 'uses' => 'PageController@admingetPromote']);
    Route::post('promote-update/{id}', ['middleware' => 'acl:view_promote', 'as' => 'admin.promote.update', 'uses' => 'PageController@admingetPromoteUpdate']);
    Route::get('sidebar', ['middleware' => 'acl:sidebar', 'as' => 'admin.sidebar', 'uses' => 'PageController@admingetSidebar']);
    Route::post('sidebar-update/{id}', ['middleware' => 'acl:sidebar', 'as' => 'admin.sidebar.update', 'uses' => 'PageController@admingetSidebarUpdate']);

    //client query routes
    Route::get('client-quries', ['middleware' => 'acl:view_client_query', 'as' => 'admin.client.query', 'uses' => 'ClientQueryController@getIndex']);
    Route::get('view-query', ['middleware' => 'acl:view_client_query', 'as' => 'admin.query.view', 'uses' => 'ClientQueryController@getView']);
    Route::get('reply-query', ['middleware' => 'acl:edit_client_query', 'as' => 'admin.query.reply', 'uses' => 'ClientQueryController@getReply']);

    //faq routes
    Route::get('create-faq', ['middleware' => 'acl:view_faq', 'as' => 'admin.faq.list', 'uses' => 'FaqController@getIndex']);
    Route::get('faq/new', ['middleware' => 'acl:new_faq', 'as' => 'admin.faq.create', 'uses' => 'FaqController@getCreate']);

    Route::post('faq-store', ['middleware' => 'acl:new_faq', 'as' => 'admin.faq.store', 'uses' => 'FaqController@postStore']);

    Route::get('faq/{id}/edit', ['middleware' => 'acl:edit_faq', 'as' => 'admin.faq.edit', 'uses' => 'FaqController@getEdit']);
    Route::post('faq/{id}/update', ['middleware' => 'acl:edit_faq', 'as' => 'admin.faq.update', 'uses' => 'FaqController@postUpdate']);
    Route::get('faq/{id}/view', ['middleware' => 'acl:view_faq', 'as' => 'admin.faq.view', 'uses' => 'FaqController@getView']);
    Route::get('faq/{id}/delete', ['middleware' => 'acl:delete_faq', 'as' => 'admin.faq.delete', 'uses' => 'FaqController@getDelete']);

    //site-setting
    // Route::get('site-setting', ['middleware' => 'acl:edit_faq', 'as' => 'admin.site.setting', 'uses' => 'SettingController@site_setting']);
    Route::post('site-setting/store', ['middleware' => 'acl:edit_faq', 'as' => 'admin.site-setting.store', 'uses' => 'SettingController@site_setting_store']);

    Route::get('website', [App\Http\Controllers\Admin\SettingController::class, 'site_website'])->name('site.website');
    Route::post('website/{id}', [App\Http\Controllers\Admin\SettingController::class, 'websiteUpdate'])->name('website.update');
    Route::post('website-payment/{id}', [App\Http\Controllers\Admin\SettingController::class, 'websitepaymentUpdate'])->name('website.update.payment');
    Route::post('website-socile/{id}', [App\Http\Controllers\Admin\SettingController::class, 'websiteUpdateSocile'])->name('website.update.socile');
    Route::get('system', [App\Http\Controllers\Admin\SettingController::class, 'site_system'])->name('site.system');
    Route::get('mail', [App\Http\Controllers\Admin\SettingController::class, 'site_mail'])->name('site.mail');
    Route::get('payment', [App\Http\Controllers\Admin\SettingController::class, 'site_payment'])->name('site.payment');
    Route::get('seo', [App\Http\Controllers\Admin\SettingController::class, 'site_seo'])->name('site.seo');
    Route::get('cms', [App\Http\Controllers\Admin\SettingController::class, 'site_cms'])->name('site.cms');

    Route::get('ads', [App\Http\Controllers\Admin\SettingController::class, 'adsList'])->name('site.ads');
    Route::get('ads/create', [App\Http\Controllers\Admin\SettingController::class, 'site_ads_create'])->name('site.ads.create');
    Route::post('ads/store', [App\Http\Controllers\Admin\SettingController::class, 'site_ads_store'])->name('site.ads.store');
    Route::get('ads/{id}/edit', [App\Http\Controllers\Admin\SettingController::class, 'site_ads_edit'])->name('site.ads.edit');
    Route::get('ads/{id}/delete', [App\Http\Controllers\Admin\SettingController::class, 'site_ads_delete'])->name('site.ads.delete');
    Route::put('ads/{id}/update', [App\Http\Controllers\Admin\SettingController::class, 'site_ads_update'])->name('site.ads.update');
    Route::get('ads/{id}/deletephoto', [App\Http\Controllers\Admin\SettingController::class, 'site_ads_deletephoto'])->name('site.ads.deletephoto');

    // transaction history
    Route::get('transaction-history', [App\Http\Controllers\Admin\DashboardController::class, 'transaction_history'])->name('transaction.history');
    Route::get('delete-transaction-history/{id}', [App\Http\Controllers\Admin\DashboardController::class, 'delete_transaction_history'])->name('admin.delete-transaction-history');
    Route::get('edit/{id}', [App\Http\Controllers\Admin\DashboardController::class, 'edit_transaction'])->name('admin.transaction.edit');
    Route::post('update/transaction', [App\Http\Controllers\Admin\DashboardController::class, 'update_transaction'])->name('admin.transaction.update');
    // Order history
    Route::get('orders', [App\Http\Controllers\Admin\DashboardController::class, 'orders'])->name('admin.order.index');
    Route::get('order/details/{id}', [App\Http\Controllers\Admin\DashboardController::class, 'orderDetails'])->name('admin.order.details');
    Route::get('delete/order/{id}', [App\Http\Controllers\Admin\DashboardController::class, 'orderDelete'])->name('admin.order.delete');
    Route::get('edit/order/{id}', [App\Http\Controllers\Admin\DashboardController::class, 'orderEdit'])->name('admin.order.edit');
    Route::post('update/order/{id}', [App\Http\Controllers\Admin\DashboardController::class, 'orderUpdate'])->name('admin.order.update');
});

Auth::routes();
