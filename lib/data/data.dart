List<Map<String, dynamic>> data = [
  {"image": "m1.jpg", "pdDetail": "Navy Waist Coat", "price": 12350.0, "rate":4.2,  "count": 0},
  {"image": "wm1.jpg", "pdDetail": "Multi Linen Fabric", "price": 7655.0, "rate":4.0, "count": 0} ,
  {"image": "wm6.jpg", "pdDetail": "Poly Stain Fabric", "price": 9450.0, "rate":3.5, "count": 0},
  {"image": "w8.jpg", "pdDetail": "Lilac Color Kurti", "price": 3517.0, "rate":3.7, "count": 0},
  {"image": "m7.jpg", "pdDetail": "Brown Linen Kurta", "price": 11350.0, "rate":4.7, "count": 0},
  {"image": "wm4.jpg", "pdDetail": "Multi Lawn Fabric", "price": 12350.0, "rate":4.1, "count": 0},
  {"image": "m2.jpg", "pdDetail": "Sand Waist Coat", "price": 13350.0, "rate":3.8, "count": 0},
    {"image": "m_darkgreen.jpg", "pdDetail": "Dark Green Kurta", "price": 4450.0, "rate":4.1, "count": 0,},

  {"image": "m_black.jpg", "pdDetail": "Black Linen Kurta", "price": 5500.0, "rate":3.7, "count": 0,},
  {"image": "w_basic.jpg", "pdDetail": "Basic Linen Kurti", "price": 5650.0, "rate":4.0, "count": 0,},
  {"image": "w_boxy.jpg", "pdDetail": "Boxy Linen Kurti", "price": 5750.0, "rate":3.7, "count": 0,},
  {"image": "m_maroon.jpg", "pdDetail": "Maroon Linen Kura", "price": 4325.0,"rate":3.5, "count": 0,},
    {"image": "m5.jpg", "pdDetail": "Milky White Kurta", "price": 9250.0, "rate":3.9, "count": 0},
      {"image": "m8.jpg", "pdDetail": "Light Olive Kurta", "price": 10550.0, "rate":4.2, "count": 0},

  {"image": "w_jac.jpg", "pdDetail": "Jacq Embroidery", "price": 7650.0, "rate":3.8, "count": 0,},
  {"image": "w_emb.jpg", "pdDetail": "Embroidery Kurti", "price": 6120.0, "rate":4.0,"count": 0,},
  {"image": "m_offwhite.jpg", "pdDetail": "Off White  Kurta", "price": 4550.0, "rate":4.1, "count": 0,},
  {"image": "w_basic_y.jpg", "pdDetail": "Multi Basic Kurti", "price": 4350.0,"rate":3.8, "count": 0,},
  {"image": "w_boxy_b.jpg", "pdDetail": "Boxy Basic Kurti", "price": 4550.0, "rate":3.9,"count": 0,},
];

List<Map<String, dynamic>> men = [
  {"image": "m1.jpg", "pdDetail": "Navy Waist Coat", "price": 12350.0, "rate":4.5, "count": 0},
    {"image": "m7.jpg", "pdDetail": "Brown Linen Kurta", "price": 11350.0, "rate":3.8, "count": 0},
    {"image": "m_maroon.jpg", "pdDetail": "Maroon Linen Kura", "price": 4325.0, "rate":4.1, "count": 0,},
  {"image": "m2.jpg", "pdDetail": "Sand Waist Coat", "price": 13350.0, "rate":4.2, "count": 0},
  {"image": "m8.jpg", "pdDetail": "Light Olive Kurta", "price": 10550.0, "rate":3.5, "count": 0},
  {"image": "m5.jpg", "pdDetail": "Milky White Kurta", "price": 9250.0, "rate":3.9, "count": 0},
    {"image": "m_darkgreen.jpg", "pdDetail": "Dark Green Kurta", "price": 4450.0, "rate":4.5, "count": 0,},
  {"image": "m_black.jpg", "pdDetail": "Black Linen Kurta", "price": 5500.0, "rate":4.2, "count": 0,},
    {"image": "m_offwhite.jpg", "pdDetail": "Off White Kurta", "price": 4550.0, "rate":3.7, "count": 0,},

 
];

List<Map<String, dynamic>> women = [
  {"image": "wm1.jpg", "pdDetail": "Multi Linen Fabric", "price": 7655.0, "rate":4.4, "count": 0} ,
  {"image": "wm6.jpg", "pdDetail": "Poly Stain Fabric", "price": 9450.0, "rate":4.6, "count": 0},
    {"image": "w8.jpg", "pdDetail": "Lilac Color Kurti", "price": 3517.0, "rate":3.9, "count": 0},

   {"image": "w_basic.jpg", "pdDetail": "Basic Linen Kurti", "price": 5650.0, "rate":3.5, "count": 0,},
  {"image": "w_boxy.jpg", "pdDetail": "Boxy Linen Kurti", "price": 5750.0, "rate":4.7, "count": 0,},
  {"image": "wm4.jpg", "pdDetail": "Multi Lawn Fabric", "price": 12350.0, "rate":4.1, "count": 0},
  {"image": "wm3.jpg", "pdDetail": "Peach Dobby Kurti", "price": 6350.0, "rate":3.7, "count": 0},
  {"image": "w_jac.jpg", "pdDetail": "Jacq Embroidery", "price": 7650.0, "rate":3.9, "count": 0,},
  {"image": "w_emb.jpg", "pdDetail": "Embroidery Kurti", "price": 6120.0, "rate":4.2, "count": 0,},
   {"image": "w_basic_y.jpg", "pdDetail": "Multi Basic Kurti", "price": 4350.0,"rate":4.5, "count": 0,},
  {"image": "w_boxy_b.jpg", "pdDetail": "Boxy Basic Kurti", "price": 4550.0,  "count": 0,},
];
  




List listTile_data = [];
List fav = [];

List<Map<String, String>> accountDetails = [];


List<Map<String, dynamic>> profilescreen = [
  {"lead": "account_circle", "title": "Your Profile"},
  {"lead": "credit_card", "title": "Payment Methods"},
  {"lead": "shopping_bag", "title": "My Orders"},
  {"lead": "settings", "title": "Settings"},
  {"lead": "help_outline", "title": "Help Center"},
  {"lead": "privacy_tip", "title": "Privacy Policy"},
  {"lead": "group_add", "title": "Invite Friends"},
  {"lead": "logout", "title": "Log out"}
];

