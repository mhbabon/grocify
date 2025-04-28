<div align="center">

![Grocify Logo](https://github.com/Learnathon-By-Geeky-Solutions/dartdaredevils/blob/main/assets/logos/t-store-splash-logo-white.png)

  
# 🛒 Grocify  
**Bridging the Education Gap Through Community Learning**

![Dart](https://img.shields.io/badge/Dart-3.0-blue?logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-3.10-blue?logo=flutter&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-State_Management-purple?logo=getx&logoColor=white)
![Supabase Storage](https://img.shields.io/badge/Supabase-Storage-brightgreen?logo=supabase&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Backend-orange?logo=firebase&logoColor=white)
![Android Studio](https://img.shields.io/badge/Android_Studio-Giraffe-green?logo=androidstudio&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

</div>

<table>
<tr>
<td>


## 🚀 Getting Started  

Follow these steps to set up the project:  

 1️⃣.🚀**Clone the Repository** 
 2️⃣.🚀**Must be Add a .env File for App Load** ⭐⭐⭐
 3️⃣.🚀**Flutter Pub Get** 
 4️⃣.🚀**Flutter Run** 




## 📖 About Grocify

Grocify — your one-stop e-commerce destination!
Discover a seamless shopping experience with Grocify, where you can explore a wide range of groceries, daily essentials, fresh products, and more — all from the comfort of your home.

✅ Easy to use
✅ Fast and secure checkout
✅ Fresh products guaranteed
✅ Quick doorstep delivery
✅ Exclusive deals and discounts

With Grocify, shopping is not just easier, it’s smarter. Save your time, save your money — Grocify is here to make everyday shopping effortless and enjoyable!



## ✅ Our Solution

Grocify makes shopping smarter and easier by offering:

1.✅ Wide range of groceries and essentials at the best prices
2.✅ Fast delivery at your doorstep
3.✅ Exclusive discounts, flash sales, and loyalty rewards
4.✅ Easy returns and secure checkout
5.✅ Built with Flutter and Supabase for speed and reliability 

## 🌍 Vision: The Bigger Picture

"Grocify is not just a store — it's a lifestyle upgrade."

-Making quality groceries affordable for everyone
-Supporting local farmers and businesses
-Enabling easy access to daily essentials in every corner of Bangladesh
-Building a sustainable future through smarter shopping 


💡 Key Features for Grocify 

Feature	Description
🚀*Fresh & Quality Products	100% fresh fruits, vegetables, meat, and daily essentials
🚀*Fast Home Delivery	Get your groceries delivered to your doorstep within hours
🚀*Best Deals & Offers	Affordable prices with regular discounts and cashback
🚀*Easy Search & Navigation	Quickly find products and complete your orders effortlessly
🚀*Safe & Secure Payment	Secure transactions through trusted payment gateways
🚀*Wishlist & Reorder	Save your favorite products and easily reorder previous purchases
🚀*Real-time Order Tracking	Track your order status live from dispatch to delivery
🚀*Built with Flutter & Supabase	Fast, reliable performance powered by modern technology (PostgreSQL, Auth, Storage



</td>
</tr>
</table>


<table>
<tr>
<td>


<details>
<summary><h2>📋 Table of Contents</h2></summary>

1. 👥 [Team Members](#-team-members)  
2. 🚀 [Project Overview](#-project-overview)  
3. 🎯 [Key Goals](#-key-goals)  
4. 🌟 [Why This Matters](#-why-this-matters)  
5. 🔧 [Technical Alignment](#-technical-alignment)  
6. 🏗️ [Project Structure: MVVM Architecture with Repository Pattern](#-project-structure-mvvm-architecture-with-repository-pattern)  
7. 🗃️ [Database Design](#-database-design)  
8. 🌐 [API Documentation](#-api-documentation)  
9. 💻 [Development Guidelines](#-development-guidelines)  
10. 🧪 [Testing](#-testing)  
11. 📚 [Resources](#-resources)  
12. 🤝 [Contributing](#-contributing)  

</details>

<div align="center">

## 👥 Team Members

| Name            | Role         | GitHub Profile                             |
|-----------------|---------------|----------------------------------------------------------|
| riyadhossain-rh | Team Leader   | [@riyadhossain-rh](https://github.com/riyadhossain-rh)   |
| mhbabon         | Member        | [@mhbabon](https://github.com/mhbabon)                   |
| Sakib360a       | Member        | [@Sakib360a](https://github.com/Sakib360a)               |
| ihjohny         | Project Mento | [@ihjohny](https://github.com/ihjohny)                   |



Here's the updated **Technical Alignment** based on your **new project structure** (feature-based clean architecture with repository pattern):

---
## 🔧 **Technical Alignment**

- **Flutter Feature-Based Clean Architecture**:  
  Modular and scalable code organization, separating core services, features, models, repositories, views, and widgets for maintainability and clarity.

- **Repository Pattern**:  
  Each feature has its own repository layer that abstracts data sources (like APIs, databases), ensuring low coupling between UI and data logic.

- **GetX (State Management, Routing, Dependency Injection)**:  
  Lightweight and efficient solution for managing app state, navigation, and service dependencies across features.

- **Supabase & Firebase (or Backend Service)**:  
  Manages authentication, user-generated content, real-time updates, and database interactions securely.

- **Core Services**:  
  Includes reusable utilities like network caller, authentication service, validators, theme switching, custom widgets, and more, ensuring consistency across the app.
---


</div>

## 🏗️ **Project Structure: Feature-Based Clean Architecture with Repository Pattern**  
```
lib/
├── core/                          # (routes/utils/etc)
│   ├── constants/                 # > constants
│   ├── device/                    # > device
│   ├── exceptions/                # > exceptions
│   ├── extensions/                # > extension (preserved original name)
│   ├── formatters/                # > formatters
│   ├── helpers/                   # > helpers
│   ├── http/                      # > http
│   ├── loaders/                   # > loaders
│   ├── local_storage/             # > local_storage
│   ├── logging/                   # > logging
│   ├── popups/                    # > popups
│   ├── routes/                    # > routes
│   ├── theme/                     # > theme
│   ├── utils/                     # > utils
│   │   ├── validators.dart        # > validators
│   │   ├── snackbar_util.dart
│   │   ├── language_switch.dart
│   │   ├── theme_switch.dart
│   │   └── web_view.dart
│   ├── app.dart                   # > app.dart
│   ├── firebase_options.dart      # > firebase_options.dart
│   ├── main.dart                  # > main.dart
│   └── navigation_menu.dart       # > navigation_menu.dart
│
├── bindings/                     
│   └── general_bindings.dart
│
├── common/                        
│   ├── styles/
│   │   ├── shadows.dart
│   │   └── spacing_styles.dart
│
├── data/                         
│   ├── features/
│   │   ├── authentication/       
│   │   │   ├── controllers/
│   │   │   ├── models/
│   │   │   └── screens/
│   │   │
│   │   └── shop/                 
│   │       ├── controllers/
│   │       │   ├── all_products_controller.dart
│   │       │   ├── banner_controller.dart
│   │       │   ├── brand_controller.dart
│   │       │   ├── category_controller.dart
│   │       │   ├── favourite_controller.dart
│   │       │   ├── home_controller.dart
│   │       │   └── product_controller.dart
│   │       │
│   │       ├── models/            
│   │       │   ├── banner_model.dart
│   │       │   ├── brand_category_model.dart
│   │       │   ├── brand_model.dart
│   │       │   ├── category_model.dart
│   │       │   ├── product_attribute_model.dart
│   │       │   ├── product_category_model.dart
│   │       │   ├── product_model.dart
│   │       │   └── product_variation_model.dart
│   │       │
│   │       └── screens/           
│   │           ├── all_products/
│   │           │   └── all_products.dart
│   │           │
│   │           ├── brand/
│   │           │   ├── all_brands.dart
│   │           │   └── brand_products.dart
│   │           │
│   │           ├── cart/
│   │           │   └── widgets/
│   │           │       └── cart.dart
│   │           │
│   │           ├── checkout/
│   │           │   └── widgets/
│   │           │       └── checkout.dart
│   │           │
│   │           ├── home/
│   │           │   └── widgets/
│   │           │       └── home.dart
│   │           │
│   │           ├── order/
│   │           │   └── widgets/
│   │           │       └── order.dart
│   │           │
│   │           ├── product_details/
│   │           │   └── widgets/
│   │           │       └── product_detail.dart
│   │           │
│   │           └── product_reviews/
│   │               └── widgets/
│   │                   └── product_reviews.dart
│   │
│   └── models/                    # standalone models
│       ├── brand_category_model.dart
│       ├── brand_model.dart
│       ├── category_model.dart
│       ├── product_attribute_model.dart
│       ├── product_category_model.dart
│       ├── product_model.dart
│       └── product_variation_model.dart
│
├── resources/                     # Additional resources
│   ├── localization/
│   │   └── app_translations.dart
│   │
│   ├── colors/
│   │   └── app_colors.dart
│   │
│   ├── themes/
│   │   └── app_themes.dart
│   │
│   └── assets_path.dart
│
└── widgets/                       
    ├── appbar/                    
    │   ├── appbar.dart
    │   └── tabbar.dart
    │
    ├── brands/                    
    │   ├── brand_card.dart
    │   └── brand_show_case.dart
    │
    ├── custom_shapes/           
    │   ├── containers/
    │   └── curved_edges/
    │
    ├── effect/                 
    │   └── shimmer.dart
    │
    ├── icons/                    
    │   └── t_circular_icon.dart
    │
    ├── images/                    
    │   ├── t_circular_image.dart
    │   └── t_rounded_image.dart
    │
    ├── images_text_widgets/    
    │   └── vertical_image_text.dart
    │
    ├── layouts/                  
    │   ├── grid_layout.dart
    │   │
    │   ├── list_tile/
    │   │   ├── settings_menu_tile.dart
    │   │   └── user_profile_tile.dart
    │   │
    │   └── login_signup/        
    │       ├── form_divider.dart
    │       └── social_buttons.dart
    │
    ├── products/                
    │   ├── cart/
    │   │   ├── add_remove_button.dart
    │   │   ├── cart_item.dart
    │   │   ├── cart_menu_icon.dart
    │   │   └── coupon_widget.dart
    │   │
    │   ├── favourite_icon/
    │   │   └── favourite_icon.dart
    │   │
    │   ├── product_cards/
    │   │   ├── product_card_horizontal.dart
    │   │   └── product_card_vertical.dart
    │   │
    │   ├── ratings/
    │   │   └── rating_indicator.dart
    │   │
    │   └── sortable/
    │       └── sortable_products.dart
    │
    ├── shimmers/                 
    │   ├── boxes_shimmer.dart
    │   ├── brands_shimmer.dart
    │   ├── category_shimmer.dart
    │   ├── list_file_shimmer.dart
    │   ├── shimmer.dart
    │   └── vertical_product_shimmer.dart
    │
    ├── success_screen/            
    │   └── success_screen.dart
    │
    └── texts/                   
        ├── product_price_text.dart
        ├── product_title_text.dart
        ├── section_heading.dart
        ├── Lbrand_title_text.dart          
        └── Lbrand_title_text_with_verified_icon.dart


```
## 📌 Directory Breakdown

- **`features/`** →  
 Each feature (e.g., Auth, Category, Class, Subject, Chapter, Content) contains:
    - `controllers/` → Handles state management (using GetX).
    - `models/` → Defines data models specific to that feature.
    - `screens/` → Contains the UI screens and views for the feature.
    - `services/` → Manages API/network/database interactions (e.g., Supabase services).

- **`core/`** →  
  Common app-wide utilities and services:
    - `network/` → HTTP and Supabase interaction layers.
    - `theme/` → Colors, typography, and app-wide theming constants.
    - `utils/` → Helper functions, extensions, reusable widgets.

- **`routes/`** →  
  Centralized navigation and route management using GetX routing.

- **`bindings/`** →  
  Feature bindings for dependency injection (GetX Bindings).
---





<p align="center">

## 🌐 **API Documentation for Grocify**  
Category	Description
🔐 Auth Endpoints	Sign Up, Login, Forgot Password, OAuth (Google, Facebook)
📦 Product Storage	Upload and manage product images (fruits, groceries, daily items)
🛒 Product Database	Full CRUD for Products, Categories, Brands, and Variants
📦 Order Management	Create, update, and track customer orders and order statuses
📦 Cart Management	Manage customer shopping carts and saved items
💳 Payment Gateway	API integration for secure online payments (Stripe, SSLCommerz)
🛒 Wishlist/History	APIs for Wishlist management and Order history
💻 Dart Examples	Code snippets with http, supabase_flutter, and provider


## 💻 **Development Guidelines**  

| 🔧 Topic | ✅ Best Practices |
|---------|------------------|
| 📐 **Architecture** | MVVM: `/lib/view`, `/lib/viewmodel`, `/lib/model` |
| 🧠 **State Management** | GetX (minimal, reactive) |
| 🛡️ **Security & Clean Code** | Follow Supabase + Firebase + Flutter safety standards |


## 🧪 **Testing Strategy**

| 🧪 Test Type | 🔍 Description |
|-------------|----------------|
| 🧠 **Unit Tests** | Validates ViewModel logic & services |
| 🧩 **Widget Tests** | UI components and layouts |
| 🧪 **Supabase Mock Tests** | Use mocks for secure backend logic testing |
</p>



</td>
</tr>
</table>
