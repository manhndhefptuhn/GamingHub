/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Zarius
 */
public class SendEmail {

    public boolean sendRegister(String toEmail, String password, String fullName) {
        //provide sender's email ID
        String fromEmail = "ghub31291@gmail.com";
        String fromPassword = "wlwgwerbsfqipnan";

        //provide Mailtrap's host address
        String host = "smtp.gmail.com";
        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        //create the Session object
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, fromPassword);
            }
        });

        try {
            //create a MimeMessage object
            Message message = new MimeMessage(session);

            //set From email field
            message.setFrom(new InternetAddress(fromEmail));

            //set To email field
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            //set email subject field
            message.setSubject("Request to sign up");

            //set the content of the email message
            message.setContent("    <style type=\"text/css\">\n"
                    + "      @media only screen and (min-width: 620px) {\n"
                    + "  .u-row {\n"
                    + "    width: 600px !important;\n"
                    + "  }\n"
                    + "  .u-row .u-col {\n"
                    + "    vertical-align: top;\n"
                    + "  }\n"
                    + "\n"
                    + "  .u-row .u-col-100 {\n"
                    + "    width: 600px !important;\n"
                    + "  }\n"
                    + "\n"
                    + "}\n"
                    + "\n"
                    + "@media (max-width: 620px) {\n"
                    + "  .u-row-container {\n"
                    + "    max-width: 100% !important;\n"
                    + "    padding-left: 0px !important;\n"
                    + "    padding-right: 0px !important;\n"
                    + "  }\n"
                    + "  .u-row .u-col {\n"
                    + "    min-width: 320px !important;\n"
                    + "    max-width: 100% !important;\n"
                    + "    display: block !important;\n"
                    + "  }\n"
                    + "  .u-row {\n"
                    + "    width: 100% !important;\n"
                    + "  }\n"
                    + "  .u-col {\n"
                    + "    width: 100% !important;\n"
                    + "  }\n"
                    + "  .u-col > div {\n"
                    + "    margin: 0 auto;\n"
                    + "  }\n"
                    + "}\n"
                    + "body {\n"
                    + "  margin: 0;\n"
                    + "  padding: 0;\n"
                    + "}\n"
                    + "\n"
                    + "table,\n"
                    + "tr,\n"
                    + "td {\n"
                    + "  vertical-align: top;\n"
                    + "  border-collapse: collapse;\n"
                    + "}\n"
                    + "\n"
                    + "p {\n"
                    + "  margin: 0;\n"
                    + "}\n"
                    + "\n"
                    + ".ie-container table,\n"
                    + ".mso-container table {\n"
                    + "  table-layout: fixed;\n"
                    + "}\n"
                    + "\n"
                    + "* {\n"
                    + "  line-height: inherit;\n"
                    + "}\n"
                    + "\n"
                    + "a[x-apple-data-detectors='true'] {\n"
                    + "  color: inherit !important;\n"
                    + "  text-decoration: none !important;\n"
                    + "}\n"
                    + "\n"
                    + "table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; } @media (max-width: 480px) { #u_content_image_1 .v-container-padding-padding { padding: 40px 0px 0px !important; } #u_content_image_1 .v-src-width { width: auto !important; } #u_content_image_1 .v-src-max-width { max-width: 55% !important; } #u_content_heading_3 .v-font-size { font-size: 18px !important; } #u_content_heading_2 .v-container-padding-padding { padding: 5px 10px 40px !important; } #u_content_heading_4 .v-container-padding-padding { padding: 40px 10px 0px !important; } #u_content_heading_4 .v-text-align { text-align: center !important; } #u_content_divider_1 .v-container-padding-padding { padding: 10px 10px 10px 125px !important; } #u_content_text_2 .v-container-padding-padding { padding: 10px 10px 40px !important; } #u_content_text_2 .v-text-align { text-align: center !important; } #u_content_button_1 .v-size-width { width: 60% !important; } #u_content_social_1 .v-container-padding-padding { padding: 30px 10px 10px !important; } #u_content_text_deprecated_1 .v-container-padding-padding { padding: 10px 10px 20px !important; } }\n"
                    + "    </style>"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n"
                    + "      \n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"background-color: #f0f5f6;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table id=\"u_content_heading_4\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:50px 60px 0px;font-family:'Raleway',sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <h1 class=\"v-text-align v-font-size\" style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-size: 20px; font-weight: 400;\"><strong>Sign Up Confirmation</strong></h1>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table id=\"u_content_divider_1\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 10px 60px;font-family:'Raleway',sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <table height=\"0px\" align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"38%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 2px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "    <tbody>\n"
                    + "      <tr style=\"vertical-align: top\">\n"
                    + "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "          <span>&#160;</span>\n"
                    + "        </td>\n"
                    + "      </tr>\n"
                    + "    </tbody>\n"
                    + "  </table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table id=\"u_content_text_2\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 60px 50px;font-family:'Raleway',sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div class=\"v-text-align v-font-size\" style=\"font-family: andale mono,times; font-size: 16px; line-height: 140%; text-align: justify; word-wrap: break-word;\">\n"
                    + "    <p style=\"line-height: 140%;\">Dear " + fullName + ",</p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">This is to confirm that you have successfully sign up in our website.</p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">Here is your new password: <strong>" + password +"</strong></p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">If you have any issues or concerns regarding your account, please do not hesitate to contact our customer support team for further assistance.</p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">Best regards,</p>\n"
                    + "<p style=\"line-height: 140%;\">Gaming Hub</p>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "  </tbody>\n"
                    + "  </table>",
                    "text/html; charset=UTF-8");

            //send the email message
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean sendForgetPass(String toEmail, String password, String fullName) {
        //provide sender's email ID
        String fromEmail = "ghub31291@gmail.com";
        String fromPassword = "wlwgwerbsfqipnan";

        //provide Mailtrap's host address
        String host = "smtp.gmail.com";
        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        //create the Session object
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, fromPassword);
            }
        });

        try {
            //create a MimeMessage object
            Message message = new MimeMessage(session);

            //set From email field
            message.setFrom(new InternetAddress(fromEmail));

            //set To email field
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            //set email subject field
            message.setSubject("Forget password request");

            //set the content of the email message
            message.setContent("    <style type=\"text/css\">\n"
                    + "      @media only screen and (min-width: 620px) {\n"
                    + "  .u-row {\n"
                    + "    width: 600px !important;\n"
                    + "  }\n"
                    + "  .u-row .u-col {\n"
                    + "    vertical-align: top;\n"
                    + "  }\n"
                    + "\n"
                    + "  .u-row .u-col-100 {\n"
                    + "    width: 600px !important;\n"
                    + "  }\n"
                    + "\n"
                    + "}\n"
                    + "\n"
                    + "@media (max-width: 620px) {\n"
                    + "  .u-row-container {\n"
                    + "    max-width: 100% !important;\n"
                    + "    padding-left: 0px !important;\n"
                    + "    padding-right: 0px !important;\n"
                    + "  }\n"
                    + "  .u-row .u-col {\n"
                    + "    min-width: 320px !important;\n"
                    + "    max-width: 100% !important;\n"
                    + "    display: block !important;\n"
                    + "  }\n"
                    + "  .u-row {\n"
                    + "    width: 100% !important;\n"
                    + "  }\n"
                    + "  .u-col {\n"
                    + "    width: 100% !important;\n"
                    + "  }\n"
                    + "  .u-col > div {\n"
                    + "    margin: 0 auto;\n"
                    + "  }\n"
                    + "}\n"
                    + "body {\n"
                    + "  margin: 0;\n"
                    + "  padding: 0;\n"
                    + "}\n"
                    + "\n"
                    + "table,\n"
                    + "tr,\n"
                    + "td {\n"
                    + "  vertical-align: top;\n"
                    + "  border-collapse: collapse;\n"
                    + "}\n"
                    + "\n"
                    + "p {\n"
                    + "  margin: 0;\n"
                    + "}\n"
                    + "\n"
                    + ".ie-container table,\n"
                    + ".mso-container table {\n"
                    + "  table-layout: fixed;\n"
                    + "}\n"
                    + "\n"
                    + "* {\n"
                    + "  line-height: inherit;\n"
                    + "}\n"
                    + "\n"
                    + "a[x-apple-data-detectors='true'] {\n"
                    + "  color: inherit !important;\n"
                    + "  text-decoration: none !important;\n"
                    + "}\n"
                    + "\n"
                    + "table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; } @media (max-width: 480px) { #u_content_image_1 .v-container-padding-padding { padding: 40px 0px 0px !important; } #u_content_image_1 .v-src-width { width: auto !important; } #u_content_image_1 .v-src-max-width { max-width: 55% !important; } #u_content_heading_3 .v-font-size { font-size: 18px !important; } #u_content_heading_2 .v-container-padding-padding { padding: 5px 10px 40px !important; } #u_content_heading_4 .v-container-padding-padding { padding: 40px 10px 0px !important; } #u_content_heading_4 .v-text-align { text-align: center !important; } #u_content_divider_1 .v-container-padding-padding { padding: 10px 10px 10px 125px !important; } #u_content_text_2 .v-container-padding-padding { padding: 10px 10px 40px !important; } #u_content_text_2 .v-text-align { text-align: center !important; } #u_content_button_1 .v-size-width { width: 60% !important; } #u_content_social_1 .v-container-padding-padding { padding: 30px 10px 10px !important; } #u_content_text_deprecated_1 .v-container-padding-padding { padding: 10px 10px 20px !important; } }\n"
                    + "    </style>"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n"
                    + "      \n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"background-color: #f0f5f6;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table id=\"u_content_heading_4\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:50px 60px 0px;font-family:'Raleway',sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <h1 class=\"v-text-align v-font-size\" style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-size: 20px; font-weight: 400;\"><strong>Request New Password</strong></h1>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table id=\"u_content_divider_1\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 10px 60px;font-family:'Raleway',sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <table height=\"0px\" align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"38%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 2px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "    <tbody>\n"
                    + "      <tr style=\"vertical-align: top\">\n"
                    + "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "          <span>&#160;</span>\n"
                    + "        </td>\n"
                    + "      </tr>\n"
                    + "    </tbody>\n"
                    + "  </table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table id=\"u_content_text_2\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 60px 50px;font-family:'Raleway',sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div class=\"v-text-align v-font-size\" style=\"font-family: andale mono,times; font-size: 16px; line-height: 140%; text-align: justify; word-wrap: break-word;\">\n"
                    + "    <p style=\"line-height: 140%;\">Dear " + fullName + ",</p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">This is to confirm that you have forget you password.</p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">Here is your new password: <strong>" + password +"</strong></p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">If you have any issues or concerns regarding your account, please do not hesitate to contact our customer support team for further assistance.</p>\n"
                    + "<p style=\"line-height: 140%;\"> </p>\n"
                    + "<p style=\"line-height: 140%;\">Best regards,</p>\n"
                    + "<p style=\"line-height: 140%;\">Gaming Hub</p>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "  </tbody>\n"
                    + "  </table>",
                    "text/html; charset=UTF-8");

            //send the email message
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
