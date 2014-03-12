Spree Delivery Date
=================

Requires user to enter a delivery date during checkout (delivery section). The delivery date must be tomorrow or later.

* Uses validation to ensure the user specifies a date tomorrow or later.
* Shows delivery date during checkout confirmation.
* Shows delivery date when viewing or editing order as admin.
* Allows admin to filter orders by delivery date (date range).
* Allows admin to sort orders by delivery date.
* Adds delivery date column to orders index page table.

Installing
=======

Add the gem to your Gemfile

    $ gem 'spree_delivery_date'

bundle with

    $ bundle update

and run

    $ rails g spree_delivery_date:install

to install and (be asken to) run the migrations. This migration simply adds the delivery_date field to Spree::Order.
