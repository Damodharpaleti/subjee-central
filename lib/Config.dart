// ignore_for_file: non_constant_identifier_names

class Config {
  static String imageurl = "https://d1w5pk8mlxemfz.cloudfront.net/grocery/";
  //Dev
  // static String url = "http://44.201.67.164:8083/subjeeCentralService/";
  // static String loginUrl = "http://44.201.67.164:8081/loginService/";

  //production
  // static String url = "http://43.205.203.15:8083/subjeeCentralService/";
  // static String loginUrl = "http://43.205.203.15:8081/loginService/";

  static String url = "https://api.suyoga.app/subjeeCentralService/";
  static String loginUrl = "https://api.suyoga.app/loginService/";
  static String paypalclientId = '';
  static String paypalscretkey = '';
  static String paypalusrl = 'https://api.sandbox.paypal.com';
  static String placeOrderURL = "product/v1/placeOrder";

  static String timeslot = "category/v1/timeSolt";
  static String getPayments = "product/v1/transactionDetails";
  static String dashboardImage =
      "http://images.suyoga.co.in/Company_website_images";
  static String login = "authenticate";
  static String otp = "user/v1/otp";
  static String regOtp = "user/v1/Regotp";
  static String forgotPassword = "user/v1/forgotPassword";
  static String updatemobNumber = "user/v1/updateMobile";
  static String validatePincode = "category/v1/validatePostalCode";
  static String cityList = "area/v1/getCityList";
  static String getPartnersList = "product/v1/getPartnerList";
  static String getDeliveryPartnersList = "product/v1/getDeliveryPartnerList";
  //product/v1/getDeliveryPartnerList
  static String addPartnersList = "product/v1/AddPartner";
  static String getOrders = "orders/v1/getOrdersList";
  static String UserFeedback = "userFeedBack/v1/getUserFeedBack";
  static String SearchuserFeedback = "userFeedBack/v1/getUserFeedBackBySearch";
  static String getOrderDetails = "orders/v1/getOrderDetails";
  static String cancelOrder = "orders/v1/cancelOrder";
  static String deliverOrder = "orders/v1/DeliverOrder";
  static String product = 'product/v1/getProductByCity';

  //static String product = 'product/v1/getProductByDetails';
  static String searchByProductName = "product/v1/searchProductByname";

  static String searchsamProductName = "product/v1/searchSamarpanaProducts";
  static String samarpanaproduct = 'product/v1/getSamarpanaProductByDetails';
  static String searchBySamarpanaProductName =
      "product/v1/searchSamarpanaProdByname";

  static String updateProduct = "product/v1/AddProduct";
  static String updateSamarpanaProduct = "product/v1/AddSamarpanaProduct";
//product/v1/AddSamarpanaProduct
  static String addPincode = "product/v1/addPincode";

  static String addTransposrter =
      "http://43.205.203.15:8087/vaahanaService/Vehicle/v1/addTransporter";

  static String imageUrl = "http://images.suyoga.co.in/retail/";

  static String bannerimg1 = "SUG_web_mind.jpg";
  static String bannerimg2 = "SUG_web_right.jpg";
  static String bannerimg3 = "SUG_web_healthy.jpg";
  static String bannerimg4 = "SUG_web_sale.jpg";
  static String bannerimg5 = "SUG_web_k2k.jpg";
  static String loginOtp = "user/v1/loginotp";
  static String deletepincode = "product/v1/deletePincodeById";
  static String promolist = "product/v1/getPromocodeList";
  static String getnonservicelist = "area/v1/getNonserviceDetails";
}
