CREATE OR REPLACE VIEW itemsview AS
SELECT
    items.*,
    categories.*
FROM
    items
    INNER JOIN categories on items.items_cat = categories.categories_id;

CREATE
OR REPLACE VIEW myfavorite AS
SELECT
    favorite.*,
    items.*,
    users.users_id
FROM
    favorite
    INNER JOIN users ON users.users_id = favorite.favorite_id
    INNER JOIN items ON items.items_id = favorite.favorite_itemsid;




    CREATE OR REPLACE VIEW cartview AS
SELECT SUM(items.items_price - items.items_price *items_discount/100)AS itemsprice , COUNT(cart.cart_itemsid)AS countitems, cart.*,items.*FROM cart INNER JOIN items ON items.items_id= cart.cart_itemsid
WHERE cart_orders =0
GROUP BY cart.cart_id, cart.cart_usersid