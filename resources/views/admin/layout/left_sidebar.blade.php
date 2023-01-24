<ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
    <li class=" nav-item @yield('dashboard')">
        <a href="{{ route('admin.dashboard') }}"><i class="la la-home"></i><span class="menu-title"
                data-i18n="{{ __('dashboard') }}">{{ __('dashboard') }}</span></a>
    </li>
    @if (hasAccessAbility('view_product', $roles))
        <li class=" nav-item @yield('Product Management')">
            <a href="#"><i class="la la-list"></i><span class="menu-title"
                    data-i18n="{{ __('product') }}">{{ __('product') }}</span></a>
            <ul class="menu-content">
                @if (hasAccessAbility('view_product', $roles))
                    <li class="nav-item @yield('product_list')"><a class="menu-item"
                            href="{{ route('admin.product.list') }}"><i></i><span
                                data-i18n="@yield('product_list')">{{ __('product_list') }}</span></a></li>
                @endif



            </ul>
        </li>
    @endif
    @if (hasAccessAbility('view_package', $roles))
        <li class="nav-item @yield('Package')">
            <a href="#"><i class="la la-list"></i><span class="menu-title"
                    data-i18n="package_list">{{ __('Package_page_title') }}</span></a>
            <ul class="menu-content">
                <li class="nav-item @yield('package_list')"><a class="menu-item"
                        href="{{ route('admin.package.lists') }}"><i></i><span
                            data-i18n="@yield('package_list')">{{ __('package_menu') }}</span></a></li>
            </ul>
        </li>
    @endif

    @if (hasAccessAbility('view_promotion', $roles))
        <li class="nav-item @yield('Promotion')">
            <a href="#"><i class="la la-list"></i><span class="menu-title"
                    data-i18n="promotion_list">{{ __('promotion_title') }}</span></a>
            <ul class="menu-content">
                <li class="nav-item @yield('promotion_list')"><a class="menu-item"
                        href="{{ route('admin.promotion.list') }}"><i></i><span
                            data-i18n="@yield('promotion_list')">{{ __('promotion_sub_title') }}</span></a>
                </li>
            </ul>
        </li>
    @endif

    <li class="nav-item @yield('transaction')">
        <a href="{{ route('transaction.history') }}">
            <i class="la la-list"></i>
            <span class="menu-title" data-i18n="#">Transaction History</span>
        </a>
    </li>
    <li class="nav-item @yield('order')">
        <a href="{{ route('admin.order.index') }}">
            <i class="la la-list"></i>
            <span class="menu-title" data-i18n="#">Orders</span>
        </a>
    </li>

    <li class="nav-item @yield('main_components')"><a class="menu-item" href="#"><i class="la la-calendar"></i><span
                class="menu-title" data-i18n="@yield('main_components')">{{ __('main_components') }}</span></a>
        <ul class="menu-content">
            <ul class="menu-content">
                @if (hasAccessAbility('view_category', $roles))
                    <li class="@yield('category')"><a class="menu-item"
                            href="{{ route('product.category.list') }}"><i></i><span
                                data-i18n="@yield('category')">{{ __('category') }}</span></a></li>
                @endif
                @if (hasAccessAbility('view_sub_category', $roles))
                    <li class="@yield('sub_category')"><a class="menu-item"
                            href="{{ route('admin.sub_category.list') }}"><i></i><span
                                data-i18n="@yield('sub_category')">{{ __('sub_category') }}</span></a></li>
                @endif

                @if (hasAccessAbility('view_brand', $roles))
                    <li class="@yield('product_brand') @yield('brand')"><a class="menu-item"
                            href="{{ route('admin.brand.list') }}"><i></i><span
                                data-i18n="@yield('product_brand')">{{ __('product_brand') }}</span></a></li>
                @endif

                @if (hasAccessAbility('view_modal', $roles))
                    <li class="@yield('product_model')"><a class="menu-item" href="{{ route('admin.product-model') }}"><span
                                data-i18n="@yield('product_model')">{{ __('product_model') }}</span></a></li>
                @endif

                @if (hasAccessAbility('view_city', $roles))
                    <li class="@yield('cities')"><a class="menu-item"
                            href="{{ route('admin.city.list') }}"><i></i><span
                                data-i18n="@yield('cities')">{{ __('cities') }}</span></a></li>
                @endif

                {{-- @if (hasAccessAbility('view_division', $roles))
                <li class="@yield('divisions')"><a class="menu-item" href="{{route('admin.division.list')}}"><i></i><span data-i18n="@yield('divisions')">{{ __('divisions') }}</span></a></li>
                @endif --}}

                @if (hasAccessAbility('view_area', $roles))
                    <li class="@yield('area')"><a class="menu-item"
                            href="{{ route('admin.area.list') }}"><i></i><span
                                data-i18n="@yield('area')">{{ __('area') }}</span></a></li>
                @endif

                {{-- @if (hasAccessAbility('view_product_type', $roles))
                <li class="@yield('product_type')"><a class="menu-item" href="{{route('admin.product_type.list')}}"><i></i><span data-i18n="@yield('product_type')">{{ __('product_type') }}</span></a></li>
                @endif --}}

            </ul>

        </ul>
    </li>

    <li
        class="nav-item {{ Request::is('admin/languages') || Request::is('admin/languages/create') || Request::is('admin/languages/*') ? 'active' : '' }}">
        <a href="{{ route('languages.index') }}">
            <i class="la la-list"></i>
            <span class="menu-title" data-i18n="#">{{ __('languages') }}</span>
        </a>
    </li>
    <li
        class="nav-item {{ Request::is('admin/currency') || Request::is('admin/currency/create') || Request::is('admin/currency/*') ? 'active' : '' }}">
        <a href="{{ route('currency.index') }}">
            <i class="la la-money"></i>
            <span class="menu-title" data-i18n="#">{{  __('currency') }}</span>
        </a>
    </li>
    @if (hasAccessAbility('view_customer', $roles))
        <li class=" nav-item @yield('Customer Management')">
            <a href="#">
                <i class="la la-user-plus"></i>
                <span class="menu-title"
                    data-i18n="{{ __('customer_management') }}">{{ __('customer_management') }}</span>
            </a>
            <ul class="menu-content">
                @if (hasAccessAbility('view_customer', $roles))
                    <li class="@yield('customer_list')">
                        <a href="{{ route('admin.customer.list') }}">
                            <i></i>
                            <span class="menu-title"
                                data-i18n="{{ __('customer_list') }}">{{ __('customer_list') }}</span>
                        </a>
                    </li>
                @endif
            </ul>
        </li>
    @endif

    {{-- <li class="nav-item {{ Request::is('admin/payment-gateway') || Request::is('admin/payment-gateway/create') || Request::is('admin/payment-gateway/*') ? 'active' : '' }}">
        <a href="{{ route('payment-gateway.index') }}">
            <i class="la la-money"></i>
            <span class="menu-title" data-i18n="#">Payment Gateway</span>
        </a>
    </li> --}}

    @if (hasAccessAbility('view_admin_user', $roles))
        <li class=" nav-item @yield('Admin Mangement')">
            <a href="#">
                <i class="la la-user-plus"></i>
                <span class="menu-title" data-i18n="{{ __('admin_management') }}">{{ __('admin_management') }}</span>
            </a>
            <ul class="menu-content">
                @if (hasAccessAbility('view_admin_user', $roles))
                    <li class="@yield('admin-user')">
                        <a href="{{ route('admin.admin-user') }}">
                            <i></i>
                            <span class="menu-title" data-i18n="{{ __('admin_user') }}">{{ __('admin_user') }}</span>
                        </a>
                    </li>
                @endif
                @if (hasAccessAbility('view_user_group', $roles))
                    <li class=" nav-item @yield('user-group')">
                        <a href="{{ route('admin.user-group') }}">
                            <i></i>
                            <span class="menu-title" data-i18n="{{ __('group') }}">{{ __('group') }}</span>
                        </a>
                    </li>
                @endif
                {{--
                @if (hasAccessAbility('assign_user_access', $roles))
                    <li class=" nav-item @yield('assign-access')">
                        <a href="{{ route('admin.assign-access') }}">
                            <i></i>
                            <span class="menu-title"
                                  data-i18n="{{ __('assign_access') }}">{{ __('assign_access') }}</span>
                        </a>
                    </li>
                @endif
                --}}
            </ul>
        </li>
    @endif

    @if (Auth::user()->web_setting_access == 1)
        @if (hasAccessAbility('view_role', $roles))
            <li class=" nav-item @yield('Role Management')">
                <a href="#">
                    <i class="la la-user-plus"></i>
                    <span class="menu-title"
                        data-i18n="{{ __('role_management') }}">{{ __('role_management') }}</span>
                </a>
                <ul class="menu-content">
                    @if (hasAccessAbility('view_role', $roles))
                        <li class="@yield('role')">
                            <a class="menu-item" href="{{ route('admin.role') }}">
                                <i></i>
                                <span data-i18n="{{ __('role') }}">{{ __('role') }}</span>
                            </a>
                        </li>
                    @endif
                    @if (hasAccessAbility('view_menu', $roles))
                        <li class="@yield('permission-group')">
                            <a class="menu-item" href="{{ route('admin.permission-group') }}">
                                <i></i>
                                <span data-i18n="{{ __('menus') }}">{{ __('menus') }}</span>
                            </a>
                        </li>
                    @endif
                    @if (hasAccessAbility('view_action', $roles))
                        <li class="@yield('permission')"><a class="menu-item"
                                href="{{ route('admin.permission') }}"><i></i><span
                                    data-i18n="{{ __('actions') }}">{{ __('actions') }}</span></a>
                        </li>
                    @endif
                </ul>
            </li>
        @endif

        <li class=" nav-item @yield('Web Setting')">
            <a href="#">
                <i class="la la-user-plus"></i>
                <span data-i18n="web_setting" class="menu-title">Web Setting</span>
            </a>
            <ul class="menu-content">
                @if (hasAccessAbility('view_client_query', $roles))
                    <li class="@yield('client_query')">
                        <a class="menu-item" href="{{ route('admin.client.query') }}">
                            <i></i>
                            <span data-i18n="client_query">{{ __('client_quries') }}</span>
                        </a>
                    </li>
                @endif

                @if (hasAccessAbility('view_faq', $roles))
                    <li class="@yield('faq')">
                        <a class="menu-item" href="{{ route('admin.faq.list') }}">
                            <i></i>
                            <span data-i18n="faq">{{ __('faq') }}</span>
                        </a>
                    </li>
                    <li class="@yield('site-setting')">
                        <a class="menu-item" href="{{ route('site.website') }}">
                            <i></i>
                            <span data-i18n="faq">{{ __('site_setting') }}</span>
                        </a>
                    </li>
                @endif

                {{-- <li class="@yield('site-ads')">
                    <a class="menu-item" href="{{ route('site.ads') }}">
                        <i></i>
                        <span data-i18n="faq">{{ __('website_ads') }}</span>
                    </a>
                </li> --}}




                @if (hasAccessAbility('view_about_us', $roles))
                    <li class="@yield('about_us')">
                        <a class="menu-item" href="{{ route('admin.about.us') }}">
                            <i></i>
                            <span data-i18n="about">{{ __('about') }}</span>
                        </a>
                    </li>
                @endif

                {{-- @if (hasAccessAbility('view_contact_us', $roles))
            <li class="@yield('contact_us')">
                <a class="menu-item" href="{{route('admin.contact.us')}}">
                    <i></i>
                    <span data-i18n="contact_us">Contact Us</span>
                </a>
            </li>
            @endif --}}

                @if (hasAccessAbility('view_terms_condition', $roles))
                    <li class="@yield('terms_condition')">
                        <a class="menu-item" href="{{ route('admin.terms.conditions') }}">
                            <i></i>
                            <span data-i18n="{{ __('t_conditions') }}">{{ __('t_conditions') }}</span>
                        </a>
                    </li>
                @endif

                @if (hasAccessAbility('view_privacy_policy', $roles))
                    <li class="@yield('privacy_policy')">
                        <a class="menu-item" href="{{ route('admin.privacy.policy') }}">
                            <i></i>
                            <span data-i18n="{{ __('privacy_policy') }}">{{ __('privacy_policy') }}</span>
                        </a>
                    </li>
                @endif

                @if (hasAccessAbility('view_quick_rules', $roles))
                    <li class="@yield('quick_rules')">
                        <a class="menu-item" href="{{ route('admin.quick.rules') }}">
                            <i></i>
                            <span data-i18n="{{ __('quick_rules') }}">{{ __('quick_rules') }}</span>
                        </a>
                    </li>
                @endif

                <li class="@yield('promotions')">
                    <a class="menu-item" href="{{ route('admin.promotions') }}">
                        <i></i>
                        <span data-i18n="{{ __('promotions') }}">{{ __('promotions') }}</span>
                    </a>
                </li>

                <li class="@yield('promite')">
                    <a class="menu-item" href="{{ route('admin.promote') }}">
                        <i></i>
                        <span data-i18n="{{ __('promote') }}">{{ __('promote') }}</span>
                    </a>
                </li>

                <li class="@yield('sidebar')">
                    <a class="menu-item" href="{{ route('admin.sidebar') }}">
                        <i></i>
                        <span data-i18n="{{ __('sidebar_info') }}">{{ __('sidebar_info') }}</span>
                    </a>
                </li>

                @if (hasAccessAbility('view_howtosell', $roles))
                    <li class="@yield('howto_sell_first')">
                        <a class="menu-item" href="{{ route('admin.howtosell.fast') }}">
                            <i></i>
                            <span data-i18n="{{ __('how_to_sell_fast') }}">{{ __('how_to_sell_fast') }}</span>
                        </a>
                    </li>
                @endif

                @if (hasAccessAbility('view_why_membership', $roles))
                    <li class="@yield('why_membership')">
                        <a class="menu-item" href="{{ route('admin.why.membership') }}">
                            <i></i>
                            <span data-i18n="{{ __('why_mem') }}">{{ __('why_mem') }}</span>
                        </a>
                    </li>
                @endif

                @if (hasAccessAbility('view_footer', $roles))
                    <li class="@yield('footer')">
                        <a class="menu-item" href="{{ route('admin.footer') }}">
                            <i></i>
                            <span data-i18n="{{ __('footer_title') }}">{{ __('footer_title') }}</span>
                        </a>
                    </li>
                @endif

                @if (hasAccessAbility('view_copy_right', $roles))
                    <li class="@yield('copy_right')">
                        <a class="menu-item" href="{{ route('admin.copy.right') }}">
                            <i></i><span data-i18n="{{ __('copy_right_title') }}">{{ __('copy_right_title') }}</span>
                        </a>
                    </li>
                @endif

            </ul>
        </li>

    @endif

</ul>
