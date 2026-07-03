import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Terms and conditions',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Objectionable Material",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "You understand that by using this Site or any services provided on the Site, you may encounter Content that may be deemed by some to be offensive, indecent, or objectionable, which Content may or may not be identified as such. You agree to use the Site and any service at your sole risk and that to the fullest extent permitted under applicable law, Suyoga and its affiliates shall have no liability to you for Content that may be deemed offensive, indecent, or objectionable to you.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Return & Refunds",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "We have a no questions asked return and refund policy which entitles all our members to return the product at the time of delivery if due to some reason they are not satisfied with the quality or freshness of the product. We will take the returned product back with us and issue a credit note for the value of the return products which will be credited to your account on the Site. This can be used to pay your subsequent shopping bills.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Cancellation by Site / Customer",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "You as a customer can cancel your order anytime up to the cut-off time of the slot for which you have placed an order by calling our customer service. In such a case we will refund any payments already made by you for the order. If we suspect any fraudulent transaction by any customer or any transaction which defies the terms & conditions of using the website, we at our sole discretion could cancel such orders. We will maintain a negative list of all fraudulent transactions and customers and would deny access to them or cancel any orders placed by them.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Modification of Terms & Conditions of Service",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "Suyoga may at any time modify the Terms & Conditions of Use of the Website without any prior notification to you. You can access the latest version of these Terms & Conditions at any given time on the Site. You should regularly review the Terms & Conditions on the Site. In the event the modified Terms & Conditions is not acceptable to you, you should discontinue using the Service. However, if you continue to use the Service you shall be deemed to have agreed to accept and abide by the modified Terms & Conditions of Use of this Site.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Indemnity",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "You agree to defend, indemnify and hold harmless Suyoga, its employees, directors, officers, agents and their successors and assigns from and against any and all claims, liabilities, damages, losses, costs and expenses, including attorney's fees, caused by or arising out of claims based upon your actions or inactions, which may result in any loss or liability to Suyoga or any third party including but not limited to breach of any warranties, representations or undertakings or in relation to the non-fulfilment of any of your obligations under this User Agreement or arising out of the your violation of any applicable laws, regulations including but not limited to Intellectual Property Rights, payment of statutory dues and taxes, claim of libel, defamation, violation of rights of privacy or publicity, loss of service by other subscribers and infringement of intellectual property or other rights. This clause shall survive the expiry or termination of this User Agreement.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Termination",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "This User Agreement is effective unless and until terminated by either you or Suyoga. You may terminate this User Agreement at any time, provided that you discontinue any further use of this Site. Suyoga may terminate this User Agreement at any time and may do so immediately without notice, and accordingly deny you access to the Site, Such termination will be without any liability to Suyoga. Upon any termination of the User Agreement by either you or Suyoga, you must promptly destroy all materials downloaded or otherwise obtained from this Site, as well as all copies of such materials, whether made under the User Agreement or otherwise. Suyoga's right to any Comments shall survive any termination of this User Agreement. Any such termination of the User Agreement shall not cancel your obligation to pay for the product already ordered from the Website or affect any liability that may have arisen under the User Agreement.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Colours",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "We have made every effort to display the colours of our products that appear on the Website as accurately as possible. However, as the actual colours you see will depend on your monitor, we cannot guarantee that your monitor's display of any colour will be accurate.")),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Reviews, Feedback, Submissions",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        'All reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered to the Site on or by this Site or otherwise disclosed, submitted or offered in connection with your use of this Site (collectively, the "Comments") shall be and remain the property of Suyoga. Such disclosure, submission or offer of any Comments shall constitute an assignment to Suyoga of all worldwide rights, titles and interests in all copyrights and other intellectual properties in the Comments. Thus, Suyoga owns exclusively all such rights, titles and interests and shall not be limited in any way in its use, commercial or otherwise, of any Comments. Suyoga will be entitled to use, reproduce, disclose, modify, adapt, create derivative works from, publish, display and distribute any Comments you submit for any purpose whatsoever, without restriction and without compensating you in any way. Suyoga is and shall be under no obligation (1) to maintain any Comments in confidence; (2) to pay you any compensation for any Comments; or (3) to respond to any Comments. You agree that any Comments submitted by you to the Site will not violate this policy or any right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and will not cause injury to any person or entity. You further agree that no Comments submitted by you to the Website will be or contain libelous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of "spam".Please note all reviews submitted by customers are subject to checks and moderation by our content Team. Suyoga reserves the rights to moderate as well as publish/not publish the reviews.Suyoga reserves the rights to solicit or withhold reviews and ratings with no liability. Suyoga reserve the right to accept, reject, moderate, monitor & edit or remove any comment. You grant Suyoga the right to use the name that you submit in connection with any Comments. You agree not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Comments you submit. You are and shall remain solely responsible for the content of any Comments you make, and you agree to indemnify Suyoga and its affiliates for all claims resulting from any Comments you submit. Suyoga and its affiliates take no responsibility and assume no liability for any Comments submitted by you or any third party.')),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Governing Law and Jurisdiction",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "This User Agreement shall be construed in accordance with the applicable laws of India. The Courts at Bangalore shall have exclusive jurisdiction in any proceedings arising out of this agreement.Any dispute or difference either in interpretation or otherwise, of any terms of this User Agreement between the parties hereto, the same shall be referred to an independent arbitrator who will be appointed by Suyoga and his decision shall be final and binding on the parties hereto. The above arbitration shall be in accordance with the Arbitration and Conciliation Act, 1996 as amended from time to time. The arbitration shall be held in Bangalore. The High Court of judicature at Bangalore alone shall have the jurisdiction and the Laws of India shall apply.")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "You Agree and Confirm",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '1	That in the event that a non-delivery occurs on account of a mistake by you (i.e. wrong name or address or any other wrong information) any extra cost incurred by Suyoga for redelivery shall be claimed from you.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '2	That you will use the services provided by the Site, its affiliates, consultants and contracted companies, for lawful purposes only and comply with all applicable laws and regulations while using and transacting on the Site.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '3	You will provide authentic and true information in all instances where such information is requested of you. Suyoga reserves the right to confirm and validate the information and other details provided by you at any point of time. If upon confirmation your details are found not to be true (wholly or partly), it has the right in its sole discretion to reject the registration and debar you from using the Services and / or other affiliated websites without prior intimation whatsoever.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '4	You authorise Suyoga to contact you for any transactional purposes related to your order/account.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '5	That you are accessing the services available on this Site and transacting at your sole risk and are using your best and prudent judgment before entering into any transaction through this Site.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '6	That the address at which delivery of the product ordered by you is to be made will be correct and proper in all respects.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '7	That before placing an order you will check the product description carefully. By placing an order for a product you agree to be bound by the conditions of sale included in the items description')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "You may not use the Site for any of the following purposes:",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '1	Disseminating any unlawful, harassing, libellous, abusive, threatening, harmful, vulgar, obscene, or otherwise objectionable material.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '2	Transmitting material that encourages conduct that constitutes a criminal offence or results in civil liability or otherwise breaches any relevant laws, regulations or code of practice.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '3	Gaining unauthorized access to other computer systems.')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '4	Interfering with any other persons use or enjoyment of the Site.')),
                SizedBox(
                  height: 10,
                ),
              ])
        ])));
  }
}




