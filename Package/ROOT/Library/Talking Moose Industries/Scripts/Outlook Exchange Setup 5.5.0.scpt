FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��

--------------------------------------------
Outlook Exchange Setup 5
� Copyright 2008-2017 William Smith
bill@officeformachelp.com

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/4.0/

This file is one of four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.5.0.scpt
2. OutlookExchangeSetupLaunchAgent.sh
3. net.talkingmoose.OutlookExchangeSetupLaunchAgent.plist
4. com.microsoft.Outlook.plist for creating a configuraiton profile

These scripts and files may be freely modified for personal or commercial
purposes but may not be republished for profit without prior consent.

If you find these resources useful or have ideas for improving them,
please let me know. It is only compatible with Outlook 2016 for Mac.

--------------------------------------------

This script assists a user with the setup of his Exchange account
information. Below are basic instructions for using the script.
Consult the Outlook Exchange Setup 5 Administrator's Guide
for complete details.

1.	Customize the "network and  server properties" below with information
	appropriate to your network.
	
2.	Deploy this script to a location on your Macs such as
	"/Library/CompanyName/Outlook Exchange Setup 5.5.0.scpt".

3. 	Deploy the recommended "Outlook preferences.mobileconfig"
	configuration profile to eliminate Outlook's startup windows.
	This assumes you're using the volume license edition
	of Office 2016 for Mac.
	
4.	Deploy the OutlookExchangeSetup5.plist file to
	/Library/LaunchAgents. Update the path to point to the
	OutlookExchangeSetup5.5.0.scpt script.
	  
This script assumes the user's full name is in the form of "Last, First",
but is easily modified if the full name is in the form of "First Last".
It works especially well if the Mac is bound to Active Directory where
the user's short name will match his login name. Optionally, you cans set dscl
to pull the user's mail from a directory service.

     � 	 	� 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 O u t l o o k   E x c h a n g e   S e t u p   5 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 7   W i l l i a m   S m i t h 
 b i l l @ o f f i c e f o r m a c h e l p . c o m 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 T h i s   f i l e   i s   o n e   o f   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 5 . 0 . s c p t 
 2 .   O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . s h 
 3 .   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t 
 4 .   c o m . m i c r o s o f t . O u t l o o k . p l i s t   f o r   c r e a t i n g   a   c o n f i g u r a i t o n   p r o f i l e 
 
 T h e s e   s c r i p t s   a n d   f i l e s   m a y   b e   f r e e l y   m o d i f i e d   f o r   p e r s o n a l   o r   c o m m e r c i a l 
 p u r p o s e s   b u t   m a y   n o t   b e   r e p u b l i s h e d   f o r   p r o f i t   w i t h o u t   p r i o r   c o n s e n t . 
 
 I f   y o u   f i n d   t h e s e   r e s o u r c e s   u s e f u l   o r   h a v e   i d e a s   f o r   i m p r o v i n g   t h e m , 
 p l e a s e   l e t   m e   k n o w .   I t   i s   o n l y   c o m p a t i b l e   w i t h   O u t l o o k   2 0 1 6   f o r   M a c . 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 T h i s   s c r i p t   a s s i s t s   a   u s e r   w i t h   t h e   s e t u p   o f   h i s   E x c h a n g e   a c c o u n t 
 i n f o r m a t i o n .   B e l o w   a r e   b a s i c   i n s t r u c t i o n s   f o r   u s i n g   t h e   s c r i p t . 
 C o n s u l t   t h e   O u t l o o k   E x c h a n g e   S e t u p   5   A d m i n i s t r a t o r ' s   G u i d e 
 f o r   c o m p l e t e   d e t a i l s . 
 
 1 . 	 C u s t o m i z e   t h e   " n e t w o r k   a n d     s e r v e r   p r o p e r t i e s "   b e l o w   w i t h   i n f o r m a t i o n 
 	 a p p r o p r i a t e   t o   y o u r   n e t w o r k . 
 	 
 2 . 	 D e p l o y   t h i s   s c r i p t   t o   a   l o c a t i o n   o n   y o u r   M a c s   s u c h   a s 
 	 " / L i b r a r y / C o m p a n y N a m e / O u t l o o k   E x c h a n g e   S e t u p   5 . 5 . 0 . s c p t " . 
 
 3 .   	 D e p l o y   t h e   r e c o m m e n d e d   " O u t l o o k   p r e f e r e n c e s . m o b i l e c o n f i g " 
 	 c o n f i g u r a t i o n   p r o f i l e   t o   e l i m i n a t e   O u t l o o k ' s   s t a r t u p   w i n d o w s . 
 	 T h i s   a s s u m e s   y o u ' r e   u s i n g   t h e   v o l u m e   l i c e n s e   e d i t i o n 
 	 o f   O f f i c e   2 0 1 6   f o r   M a c . 
 	 
 4 . 	 D e p l o y   t h e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   t o 
 	 / L i b r a r y / L a u n c h A g e n t s .   U p d a t e   t h e   p a t h   t o   p o i n t   t o   t h e 
 	 O u t l o o k E x c h a n g e S e t u p 5 . 5 . 0 . s c p t   s c r i p t . 
 	     
 T h i s   s c r i p t   a s s u m e s   t h e   u s e r ' s   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " L a s t ,   F i r s t " , 
 b u t   i s   e a s i l y   m o d i f i e d   i f   t h e   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " F i r s t   L a s t " . 
 I t   w o r k s   e s p e c i a l l y   w e l l   i f   t h e   M a c   i s   b o u n d   t o   A c t i v e   D i r e c t o r y   w h e r e 
 t h e   u s e r ' s   s h o r t   n a m e   w i l l   m a t c h   h i s   l o g i n   n a m e .   O p t i o n a l l y ,   y o u   c a n s   s e t   d s c l 
 t o   p u l l   t h e   u s e r ' s   m a i l   f r o m   a   d i r e c t o r y   s e r v i c e . 
 
   
  
 l     ��������  ��  ��        l     ��  ��      global logMesage     �   "   g l o b a l   l o g M e s a g e      l     ��������  ��  ��        l     ��  ��    0 *------------------------------------------     �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    , & Begin network, server and preferences     �   L   B e g i n   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s      l     ��   ��    0 *------------------------------------------      � ! ! T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   " # " l     ��������  ��  ��   #  $ % $ l     ��������  ��  ��   %  & ' & l     �� ( )��   ( C =------------- Exchange Server settings ----------------------    ) � * * z - - - - - - - - - - - - -   E x c h a n g e   S e r v e r   s e t t i n g s   - - - - - - - - - - - - - - - - - - - - - - '  + , + l     ��������  ��  ��   ,  - . - j     �� /�� 0 usekerberos useKerberos / m     ��
�� boovtrue .  0 1 0 l     �� 2 3��   2 B < Set this to true only if Macs in your environment are bound    3 � 4 4 x   S e t   t h i s   t o   t r u e   o n l y   i f   M a c s   i n   y o u r   e n v i r o n m e n t   a r e   b o u n d 1  5 6 5 l     �� 7 8��   7 C = to Active Directory and your network is properly configured.    8 � 9 9 z   t o   A c t i v e   D i r e c t o r y   a n d   y o u r   n e t w o r k   i s   p r o p e r l y   c o n f i g u r e d . 6  : ; : l     ��������  ��  ��   ;  < = < j    �� >��  0 exchangeserver ExchangeServer > m     ? ? � @ @ ( e x c h a n g e . e x a m p l e . c o m =  A B A l     �� C D��   C 6 0 Address of your organization's Exchange server.    D � E E `   A d d r e s s   o f   y o u r   o r g a n i z a t i o n ' s   E x c h a n g e   s e r v e r . B  F G F l     ��������  ��  ��   G  H I H j    �� J�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL J m    ��
�� boovtrue I  K L K l     �� M N��   M   True for most servers.    N � O O .   T r u e   f o r   m o s t   s e r v e r s . L  P Q P l     ��������  ��  ��   Q  R S R j   	 �� T�� .0 exchangeserversslport ExchangeServerSSLPort T m   	 
����� S  U V U l     �� W X��   W @ : If ExchangeServerRequiresSSL is true set the port to 443.    X � Y Y t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . V  Z [ Z l     �� \ ]��   \ @ : If ExchangeServerRequiresSSL is false set the port to 80.    ] � ^ ^ t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . [  _ ` _ l     �� a b��   a L F Use a different port number only if your administrator instructs you.    b � c c �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   a d m i n i s t r a t o r   i n s t r u c t s   y o u . `  d e d l     ��������  ��  ��   e  f g f j    �� h�� "0 directoryserver DirectoryServer h m     i i � j j  g c . e x a m p l e . c o m g  k l k l     �� m n��   m Z T Address of an internal Global Catalog server (a type of Windows domain controller).    n � o o �   A d d r e s s   o f   a n   i n t e r n a l   G l o b a l   C a t a l o g   s e r v e r   ( a   t y p e   o f   W i n d o w s   d o m a i n   c o n t r o l l e r ) . l  p q p l     �� r s��   r L F The LDAP server in a Windows network will be a Global Catalog server,    s � t t �   T h e   L D A P   s e r v e r   i n   a   W i n d o w s   n e t w o r k   w i l l   b e   a   G l o b a l   C a t a l o g   s e r v e r , q  u v u l     �� w x��   w 2 , which is separate from the Exchange Server.    x � y y X   w h i c h   i s   s e p a r a t e   f r o m   t h e   E x c h a n g e   S e r v e r . v  z { z l     ��������  ��  ��   {  | } | j    �� ~�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication ~ m    ��
�� boovtrue }   �  l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 80 directoryserverrequiresssl DirectoryServerRequiresSSL � m    ��
�� boovtrue �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 00 directoryserversslport DirectoryServerSSLPort � m    ����� �  � � � l     �� � ���   � B < If DirectoryServerRequiresSSL is true set the port to 3269.    � � � � x   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   3 2 6 9 . �  � � � l     �� � ���   � C = If DirectoryServerRequiresSSL is false set the port to 3268.    � � � � z   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   3 2 6 8 . �  � � � l     �� � ���   � U O Use a different port number only if your Exchange administrator instructs you.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   E x c h a n g e   a d m i n i s t r a t o r   i n s t r u c t s   y o u . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� >0 directoryservermaximumresults DirectoryServerMaximumResults � m    ����� �  � � � l     �� � ���   � G A When searching the Global Catalog server, this number determines    � � � � �   W h e n   s e a r c h i n g   t h e   G l o b a l   C a t a l o g   s e r v e r ,   t h i s   n u m b e r   d e t e r m i n e s �  � � � l     �� � ���   � 0 * the maximum number of entries to display.    � � � � T   t h e   m a x i m u m   n u m b e r   o f   e n t r i e s   t o   d i s p l a y . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 60 directoryserversearchbase DirectoryServerSearchBase � m     � � � � �   �  � � � l     �� � ���   � + % example: "cn=users,dc=domain,dc=com"    � � � � J   e x a m p l e :   " c n = u s e r s , d c = d o m a i n , d c = c o m " �  � � � l     �� � ���   �   Usually, this is empty.    � � � � 0   U s u a l l y ,   t h i s   i s   e m p t y . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � D >------------- For Active Directory users ---------------------    � � � � | - - - - - - - - - - - - -   F o r   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j     �� ��� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory � m    ��
�� boovtrue �  � � � l     �� � ���   � N H If Macs are bound to Active Directory via dsconfigad/Directory Utility,    � � � � �   I f   M a c s   a r e   b o u n d   t o   A c t i v e   D i r e c t o r y   v i a   d s c o n f i g a d / D i r e c t o r y   U t i l i t y , �  � � � l     �� � ���   � ^ X they can use dscl to return the current user's email address, phone number, title, etc.    � � � � �   t h e y   c a n   u s e   d s c l   t o   r e t u r n   t h e   c u r r e n t   u s e r ' s   e m a i l   a d d r e s s ,   p h o n e   n u m b e r ,   t i t l e ,   e t c . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � > 8------------- For Office 365 users ---------------------    � � � � p - - - - - - - - - - - - -   F o r   O f f i c e   3 6 5   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j   ! #�� ��� *0 useemailforusername useEmailForUsername � m   ! "��
�� boovfals �  � � � l     �� � ���   � S M Office 365 and similar mail services may require the username to be the same    � � � � �   O f f i c e   3 6 5   a n d   s i m i l a r   m a i l   s e r v i c e s   m a y   r e q u i r e   t h e   u s e r n a m e   t o   b e   t h e   s a m e �  � � � l     �� � ���   � P J as the email address. Set this to true if the username is the same as the    � � � � �   a s   t h e   e m a i l   a d d r e s s .   S e t   t h i s   t o   t r u e   i f   t h e   u s e r n a m e   i s   t h e   s a m e   a s   t h e �  � � � l     �� � ���   �   email address.    � � � �    e m a i l   a d d r e s s . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � B <------------- For non Active Directory users ---------------    � � � � x - - - - - - - - - - - - -   F o r   n o n   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - �    l     ��������  ��  ��    j   $ (���� 0 
domainname 
domainName m   $ ' �  e x a m p l e . c o m  l     ��	
��  	 P J Complete this only if not using Active Directory to get user information.   
 � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     ����   L F The part of your organization's email address following the @ symbol.    � �   T h e   p a r t   o f   y o u r   o r g a n i z a t i o n ' s   e m a i l   a d d r e s s   f o l l o w i n g   t h e   @   s y m b o l .  l     ����~��  �  �~    j   ) +�}�} 0 emailformat emailFormat m   ) *�|�|   l     �{�{   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     �z�z   P J When Active Directory is unavailable to determine a user's email address,    � �   W h e n   A c t i v e   D i r e c t o r y   i s   u n a v a i l a b l e   t o   d e t e r m i n e   a   u s e r ' s   e m a i l   a d d r e s s ,  !  l     �y"#�y  " V P this script will attempt to parse it from the display name of the user's login.   # �$$ �   t h i s   s c r i p t   w i l l   a t t e m p t   t o   p a r s e   i t   f r o m   t h e   d i s p l a y   n a m e   o f   t h e   u s e r ' s   l o g i n .! %&% l     �x�w�v�x  �w  �v  & '(' l     �u)*�u  ) 1 + Describe your organization's email format:   * �++ V   D e s c r i b e   y o u r   o r g a n i z a t i o n ' s   e m a i l   f o r m a t :( ,-, l     �t./�t  . / ) 1: Email format is first.last@domain.com   / �00 R   1 :   E m a i l   f o r m a t   i s   f i r s t . l a s t @ d o m a i n . c o m- 121 l     �s34�s  3 * $ 2: Email format is first@domain.com   4 �55 H   2 :   E m a i l   f o r m a t   i s   f i r s t @ d o m a i n . c o m2 676 l     �r89�r  8 N H 3: Email format is flast@domain.com (first name initial plus last name)   9 �:: �   3 :   E m a i l   f o r m a t   i s   f l a s t @ d o m a i n . c o m   ( f i r s t   n a m e   i n i t i a l   p l u s   l a s t   n a m e )7 ;<; l     �q=>�q  = . ( 4: Email format is shortName@domain.com   > �?? P   4 :   E m a i l   f o r m a t   i s   s h o r t N a m e @ d o m a i n . c o m< @A@ l     �p�o�n�p  �o  �n  A BCB j   , .�mD�m 0 displayname displayNameD m   , -�l�l C EFE l     �kGH�k  G P J Complete this only if not using Active Directory to get user information.   H �II �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .F JKJ l     �jLM�j  L M G Describe how the user's display name appears at the bottom of the menu   M �NN �   D e s c r i b e   h o w   t h e   u s e r ' s   d i s p l a y   n a m e   a p p e a r s   a t   t h e   b o t t o m   o f   t h e   m e n uK OPO l     �iQR�i  Q R L when clicking the Apple menu (Log Out Joe Cool... or Log Out Cool, Joe...).   R �SS �   w h e n   c l i c k i n g   t h e   A p p l e   m e n u   ( L o g   O u t   J o e   C o o l . . .   o r   L o g   O u t   C o o l ,   J o e . . . ) .P TUT l     �hVW�h  V / ) 1: Display name appears as "Last, First"   W �XX R   1 :   D i s p l a y   n a m e   a p p e a r s   a s   " L a s t ,   F i r s t "U YZY l     �g[\�g  [ . ( 2: Display name appears as "First Last"   \ �]] P   2 :   D i s p l a y   n a m e   a p p e a r s   a s   " F i r s t   L a s t "Z ^_^ l     �f�e�d�f  �e  �d  _ `a` j   / 3�cb�c 0 domainprefix domainPrefixb m   / 2cc �dd  a efe l     �bgh�b  g Y S Optionally append a NetBIOS domain name to the beginning of the user's short name.   h �ii �   O p t i o n a l l y   a p p e n d   a   N e t B I O S   d o m a i n   n a m e   t o   t h e   b e g i n n i n g   o f   t h e   u s e r ' s   s h o r t   n a m e .f jkj l     �alm�a  l 9 3 Be sure to use two backslashes when adding a name.   m �nn f   B e   s u r e   t o   u s e   t w o   b a c k s l a s h e s   w h e n   a d d i n g   a   n a m e .k opo l     �`qr�`  q N H Example: Use "TALKINGMOOSE\\" to set user name "TALKINGMOOSE\username".   r �ss �   E x a m p l e :   U s e   " T A L K I N G M O O S E \ \ "   t o   s e t   u s e r   n a m e   " T A L K I N G M O O S E \ u s e r n a m e " .p tut l     �_�^�]�_  �^  �]  u vwv l     �\�[�Z�\  �[  �Z  w xyx l     �Yz{�Y  z C =------------- User Experience -------------------------------   { �|| z - - - - - - - - - - - - -   U s e r   E x p e r i e n c e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -y }~} l     �X�W�V�X  �W  �V  ~ � j   4 8�U��U (0 verifyemailaddress verifyEMailAddress� m   4 5�T
�T boovfals� ��� l     �S���S  � M G If set to "true", a dialog asks the user to confirm his email address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   e m a i l   a d d r e s s .� ��� l     �R�Q�P�R  �Q  �P  � ��� j   9 =�O��O *0 verifyserveraddress verifyServerAddress� m   9 :�N
�N boovfals� ��� l     �M���M  � W Q If set to "true", a dialog asks the user to confirm his Exchange server address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �L�K�J�L  �K  �J  � ��� j   > B�I��I *0 displaydomainprefix displayDomainPrefix� m   > ?�H
�H boovfals� ��� l     �G���G  � C = If set to "true", the username appears as "DOMAIN\username".   � ��� z   I f   s e t   t o   " t r u e " ,   t h e   u s e r n a m e   a p p e a r s   a s   " D O M A I N \ u s e r n a m e " .� ��� l     �F���F  � 5 / Otherwise, the username appears as "username".   � ��� ^   O t h e r w i s e ,   t h e   u s e r n a m e   a p p e a r s   a s   " u s e r n a m e " .� ��� l     �E�D�C�E  �D  �C  � ��� j   C G�B��B *0 downloadheadersonly downloadHeadersOnly� m   C D�A
�A boovfals� ��� l     �@���@  � H B If set to "true", only email headers are downloaded into Outlook.   � ��� �   I f   s e t   t o   " t r u e " ,   o n l y   e m a i l   h e a d e r s   a r e   d o w n l o a d e d   i n t o   O u t l o o k .� ��� l     �?���?  � B < This takes much less time to sync but a user must be online   � ��� x   T h i s   t a k e s   m u c h   l e s s   t i m e   t o   s y n c   b u t   a   u s e r   m u s t   b e   o n l i n e� ��� l     �>���>  � %  to download and view messages.   � ��� >   t o   d o w n l o a d   a n d   v i e w   m e s s a g e s .� ��� l     �=�<�;�=  �<  �;  � ��� j   H L�:��: 20 hideonmycomputerfolders hideOnMyComputerFolders� m   H I�9
�9 boovfals� ��� l     �8���8  � - ' If set to "true", hides local folders.   � ��� N   I f   s e t   t o   " t r u e " ,   h i d e s   l o c a l   f o l d e r s .� ��� l     �7���7  � ; 5 A single Exchange account should do this by default.   � ��� j   A   s i n g l e   E x c h a n g e   a c c o u n t   s h o u l d   d o   t h i s   b y   d e f a u l t .� ��� l     �6�5�4�6  �5  �4  � ��� j   M Q�3��3 0 unifiedinbox unifiedInbox� m   M N�2
�2 boovfals� ��� l     �1���1  � C = If set to "true", turns on the Group Similar Folders feature   � ��� z   I f   s e t   t o   " t r u e " ,   t u r n s   o n   t h e   G r o u p   S i m i l a r   F o l d e r s   f e a t u r e� ��� l     �0���0  � / ) in Outlook menu > Preferences > General.   � ��� R   i n   O u t l o o k   m e n u   >   P r e f e r e n c e s   >   G e n e r a l .� ��� l     �/�.�-�/  �.  �-  � ��� j   R V�,��, (0 enableautodiscover enableAutodiscover� m   R S�+
�+ boovtrue� ��� l     �*���*  � < 6 If set to "true", disables Autodiscover functionality   � ��� l   I f   s e t   t o   " t r u e " ,   d i s a b l e s   A u t o d i s c o v e r   f u n c t i o n a l i t y� ��� l     �)���)  � C = for the Exchange account. Not recommended for mobile devices   � ��� z   f o r   t h e   E x c h a n g e   a c c o u n t .   N o t   r e c o m m e n d e d   f o r   m o b i l e   d e v i c e s� ��� l     �(���(  � B < that may connect to an internal Exchange server address and   � ��� x   t h a t   m a y   c o n n e c t   t o   a n   i n t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s   a n d� ��� l     �'���'  � ? 9 connect to a different external Exchange server address.   � ��� r   c o n n e c t   t o   a   d i f f e r e n t   e x t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �&�%�$�&  �%  �$  � ��� j   W ]�#��# 0 errormessage errorMessage� m   W Z�� ��� � O u t l o o k ' s   s e t u p   f o r   y o u r   E x c h a n g e   a c c o u n t   f a i l e d .   P l e a s e   c o n t a c t   t h e   H e l p   D e s k   f o r   a s s i s t a n c e .� ��� l     �"���"  � T N Customize this error message for your users in case their account setup fails   � ��� �   C u s t o m i z e   t h i s   e r r o r   m e s s a g e   f o r   y o u r   u s e r s   i n   c a s e   t h e i r   a c c o u n t   s e t u p   f a i l s� ��� l     �!� ��!  �   �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     � �    * $ End network, server and preferences    � H   E n d   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s�  l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 	 l     ����  �  �  	 

 l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ��     Begin log file setup    � *   B e g i n   l o g   f i l e   s e t u p  l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����  �  �    l     ��   < 6 create the log file in the current user's Logs folder    � l   c r e a t e   t h e   l o g   f i l e   i n   t h e   c u r r e n t   u s e r ' s   L o g s   f o l d e r  !  l     ����  �  �  ! "#" l    $��$ I     �%�� 0 writelog writeLog% &�
& m    '' �(( D S t a r t i n g   E x c h a n g e   a c c o u n t   s e t u p . . .�
  �  �  �  # )*) l   +�	�+ I    �,�� 0 writelog writeLog, -�- b    ./. m    	00 �11  S c r i p t :  / n   	 232 1   
 �
� 
pnam3  f   	 
�  �  �	  �  * 454 l   6��6 I    �7� � 0 writelog writeLog7 8��8 o    ��
�� 
ret ��  �   �  �  5 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  = 0 *------------------------------------------   > �?? T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -< @A@ l     ��BC��  B   End log file setup    C �DD (   E n d   l o g   f i l e   s e t u p  A EFE l     ��GH��  G 0 *------------------------------------------   H �II T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -F JKJ l     ��������  ��  ��  K LML l     ��NO��  N 0 *------------------------------------------   O �PP T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -M QRQ l     ��ST��  S &   Begin logging script properties   T �UU @   B e g i n   l o g g i n g   s c r i p t   p r o p e r t i e sR VWV l     ��XY��  X 0 *------------------------------------------   Y �ZZ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -W [\[ l     ��������  ��  ��  \ ]^] l   _����_ I    ��`���� 0 writelog writeLog` a��a m    bb �cc & S e t u p   p r o p e r t i e s . . .��  ��  ��  ��  ^ ded l    ,f����f I     ,��g���� 0 writelog writeLogg h��h b   ! (iji m   ! "kk �ll  U s e   K e r b e r o s :  j o   " '���� 0 usekerberos useKerberos��  ��  ��  ��  e mnm l  - 9o����o I   - 9��p���� 0 writelog writeLogp q��q b   . 5rsr m   . /tt �uu " E x c h a n g e   S e r v e r :  s o   / 4����  0 exchangeserver ExchangeServer��  ��  ��  ��  n vwv l  : Fx����x I   : F��y���� 0 writelog writeLogy z��z b   ; B{|{ m   ; <}} �~~ < E x c h a n g e   S e r v e r   R e q u i r e s   S S L :  | o   < A���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL��  ��  ��  ��  w � l  G S������ I   G S������� 0 writelog writeLog� ���� b   H O��� m   H I�� ��� , E x c h a n g e   S e r v e r   P o r t :  � o   I N���� .0 exchangeserversslport ExchangeServerSSLPort��  ��  ��  ��  � ��� l  T `������ I   T `������� 0 writelog writeLog� ���� b   U \��� m   U V�� ��� $ D i r e c t o r y   S e r v e r :  � o   V [���� "0 directoryserver DirectoryServer��  ��  ��  ��  � ��� l  a m������ I   a m������� 0 writelog writeLog� ���� b   b i��� m   b c�� ��� T D i r e c t o r y   S e r v e r   R e q u i r e s   A u t h e n t i c a t i o n :  � o   c h���� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication��  ��  ��  ��  � ��� l  n z������ I   n z������� 0 writelog writeLog� ���� b   o v��� m   o p�� ��� > D i r e c t o r y   S e r v e r   R e q u i r e s   S S L :  � o   p u���� 80 directoryserverrequiresssl DirectoryServerRequiresSSL��  ��  ��  ��  � ��� l  { ������� I   { �������� 0 writelog writeLog� ���� b   | ���� m   | }�� ��� 6 D i r e c t o r y   S e r v e r   S S L   P o r t :  � o   } ����� 00 directoryserversslport DirectoryServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� D D i r e c t o r y   S e r v e r   M a x i m u m   R e s u l t s :  � o   � ����� >0 directoryservermaximumresults DirectoryServerMaximumResults��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� < D i r e c t o r y   S e r v e r   S e a r c h   B a s e :  � o   � ����� 60 directoryserversearchbase DirectoryServerSearchBase��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :  � o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :  � o   � ����� @0 getuserinformationfromcentrify getUserInformationFromCentrify��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :  � o   � ����� R0 'getuserinformationfromenterpriseconnect 'getUserInformationFromEnterpriseConnect��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� o   � ���
�� 
ret ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l  �:������ Z   �:������� F   � ���� F   � ���� l  � ������� =  � ���� o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory� m   � ���
�� boovfals��  ��  � l  � ������� =  � ���� o   � ����� @0 getuserinformationfromcentrify getUserInformationFromCentrify� m   � ���
�� boovfals��  ��  � l  � ������� =  � ���� o   � ����� R0 'getuserinformationfromenterpriseconnect 'getUserInformationFromEnterpriseConnect� m   � ���
�� boovfals��  ��  � k   �6�� ��� I   �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D o m a i n   N a m e :  � o   � ��� 0 
domainname 
domainName��  ��  � ��� I  �~��}�~ 0 writelog writeLog� ��|� b  � � m   �  E m a i l   f o r m a t :    o  �{�{ 0 emailformat emailFormat�|  �}  �  I   �z�y�z 0 writelog writeLog �x b   m  		 �

  D i s p l a y   N a m e :   o  �w�w 0 displayname displayName�x  �y    I  !/�v�u�v 0 writelog writeLog �t b  "+ m  "% �  D o m a i n   P r e f i x :   o  %*�s�s 0 domainprefix domainPrefix�t  �u   �r I  06�q�p�q 0 writelog writeLog �o o  12�n
�n 
ret �o  �p  �r  ��  ��  ��  ��  �  l     �m�l�k�m  �l  �k    l ;I�j�i I  ;I�h�g�h 0 writelog writeLog �f b  <E m  <? �   , V e r i f y   E m a i l   A d d r e s s :   o  ?D�e�e (0 verifyemailaddress verifyEMailAddress�f  �g  �j  �i   !"! l JX#�d�c# I  JX�b$�a�b 0 writelog writeLog$ %�`% b  KT&'& m  KN(( �)) . V e r i f y   S e r v e r   A d d r e s s :  ' o  NS�_�_ *0 verifyserveraddress verifyServerAddress�`  �a  �d  �c  " *+* l Yg,�^�], I  Yg�\-�[�\ 0 writelog writeLog- .�Z. b  Zc/0/ m  Z]11 �22 . D i s p l a y   D o m a i n   P r e f i x :  0 o  ]b�Y�Y *0 displaydomainprefix displayDomainPrefix�Z  �[  �^  �]  + 343 l hv5�X�W5 I  hv�V6�U�V 0 writelog writeLog6 7�T7 b  ir898 m  il:: �;; . D o w n l o a d   H e a d e r s   O n l y :  9 o  lq�S�S *0 downloadheadersonly downloadHeadersOnly�T  �U  �X  �W  4 <=< l w�>�R�Q> I  w��P?�O�P 0 writelog writeLog? @�N@ b  x�ABA m  x{CC �DD : H i d e   O n   M y   C o m p u t e r   F o l d e r s :  B o  {��M�M 20 hideonmycomputerfolders hideOnMyComputerFolders�N  �O  �R  �Q  = EFE l ��G�L�KG I  ���JH�I�J 0 writelog writeLogH I�HI b  ��JKJ m  ��LL �MM  U n i f i e d   I n b o x :  K o  ���G�G 0 unifiedinbox unifiedInbox�H  �I  �L  �K  F NON l ��P�F�EP I  ���DQ�C�D 0 writelog writeLogQ R�BR b  ��STS m  ��UU �VV , D i s a b l e   A u t o d i s c o v e r :  T o  ���A�A (0 enableautodiscover enableAutodiscover�B  �C  �F  �E  O WXW l ��Y�@�?Y I  ���>Z�=�> 0 writelog writeLogZ [�<[ b  ��\]\ m  ��^^ �__ ( E r r o r   M e s s a g e   t e x t :  ] o  ���;�; 0 errormessage errorMessage�<  �=  �@  �?  X `a` l ��b�:�9b I  ���8c�7�8 0 writelog writeLogc d�6d o  ���5
�5 
ret �6  �7  �:  �9  a efe l     �4�3�2�4  �3  �2  f ghg l     �1ij�1  i 0 *------------------------------------------   j �kk T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -h lml l     �0no�0  n %  End logging script properties    o �pp >   E n d   l o g g i n g   s c r i p t   p r o p e r t i e s  m qrq l     �/st�/  s 0 *------------------------------------------   t �uu T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -r vwv l     �.�-�,�.  �-  �,  w xyx l     �+z{�+  z 0 *------------------------------------------   { �|| T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -y }~} l     �*��*   ( " Begin collecting user information   � ��� D   B e g i n   c o l l e c t i n g   u s e r   i n f o r m a t i o n~ ��� l     �)���)  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �(�'�&�(  �'  �&  � ��� l     �%���%  � R L attempt to read information from Active Directory for the Me Contact record   � ��� �   a t t e m p t   t o   r e a d   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y   f o r   t h e   M e   C o n t a c t   r e c o r d� ��� l     �$�#�"�$  �#  �"  � ��� l ����!� � r  ����� m  ���� ���  � o      �� 0 userfirstname userFirstName�!  �   � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userlastname userLastName�  �  � ��� l ������ r  ����� m  ���� ���  � o      ��  0 userdepartment userDepartment�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 
useroffice 
userOffice�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 usercompany userCompany�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userworkphone userWorkPhone�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 
usermobile 
userMobile�  �  � ��� l ������ r  ����� m  ���� ���  � o      �
�
 0 userfax userFax�  �  � ��� l ���	�� r  ���� m  ���� ���  � o      �� 0 	usertitle 	userTitle�	  �  � ��� l 	���� r  	��� m  �� ���  � o      �� 0 
userstreet 
userStreet�  �  � ��� l 
���� r  
��� m  
�� ���  � o      �� 0 usercity userCity�  �  � ��� l �� ��� r  ��� m  �� ���  � o      ���� 0 	userstate 	userState�   ��  � ��� l !������ r  !��� m  �� ���  � o      ����  0 userpostalcode userPostalCode��  ��  � ��� l ")������ r  ")��� m  "%�� ���  � o      ���� 0 usercountry userCountry��  ��  � ��� l *1������ r  *1��� m  *-�� ���  � o      ���� 0 userwebpage userWebPage��  ��  � ��� l     ��������  ��  ��  � ��� l 2������ Z  2�� � = 29 o  27���� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory m  78��
�� boovtrue� k  <
�  l <<��������  ��  ��    l <<��	
��  	 7 1 Read full user information from Active Directory   
 � b   R e a d   f u l l   u s e r   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y  l <<��������  ��  ��    Q  <� k  ?X  r  ?L J  ?D �� m  ?B �  :  ��   n      1  GK��
�� 
txdl 1  DG��
�� 
ascr �� r  MX  I MT��!��
�� .sysoexecTEXT���     TEXT! m  MP"" �##� / u s r / b i n / d s c l   / S e a r c h   - r e a d   " / U s e r s / $ U S E R "   A u t h e n t i c a t i o n A u t h o r i t y   C i t y   c o   c o m p a n y   d e p a r t m e n t   p h y s i c a l D e l i v e r y O f f i c e N a m e   s A M A c c o u n t N a m e   w W W H o m e P a g e   m a i l   F A X N u m b e r   F i r s t N a m e   J o b T i t l e   L a s t N a m e   M o b i l e N u m b e r   P h o n e N u m b e r   P o s t a l C o d e   R e a l N a m e   S t a t e   S t r e e t��    o      ���� "0 userinformation userInformation��   R      ������
�� .ascrerr ****      � ****��  ��   k  `�$$ %&% l ``��������  ��  ��  & '(' l ``��)*��  )   something went wrong   * �++ *   s o m e t h i n g   w e n t   w r o n g( ,-, l ``��������  ��  ��  - ./. I `���01
�� .sysodlogaskr        TEXT0 b  `m232 b  `i454 b  `g676 o  `e���� 0 errormessage errorMessage7 o  ef��
�� 
ret 5 o  gh��
�� 
ret 3 m  il88 �99 n U n a b l e   t o   r e a d   u s e r   i n f o r m a t i o n   f r o m   n e t w o r k   d i r e c t o r y .1 ��:;
�� 
disp: m  ps��
�� stic    ; ��<=
�� 
btns< J  v{>> ?��? m  vy@@ �AA  O K��  = ��BC
�� 
dfltB J  ~�DD E��E m  ~�FF �GG  O K��  C ��H��
�� 
apprH m  ��II �JJ , O u t l o o k   E x c h a n g e   S e t u p��  / K��K R  ������L
�� .ascrerr ****      � ****��  L ��M��
�� 
errnM m  ����������  ��   NON l ����������  ��  ��  O PQP Y  �
R��ST��R k  �
UU VWV l ����������  ��  ��  W XYX r  ��Z[Z J  ��\\ ]��] m  ��^^ �__  :  ��  [ n     `a` 1  ����
�� 
txdla 1  ����
�� 
ascrY bcb Z  �de����d C ��fgf n  ��hih 4  ����j
�� 
cparj o  ������ 0 i  i o  ������ "0 userinformation userInformationg m  ��kk �ll 
 m a i l :e Q  �mnom r  ��pqp n  ��rsr 4  ����t
�� 
citmt m  ������ s n  ��uvu 4  ����w
�� 
cparw o  ������ 0 i  v o  ������ "0 userinformation userInformationq o      ���� 0 emailaddress emailAddressn R      ������
�� .ascrerr ****      � ****��  ��  o k  �xx yzy r  ��{|{ J  ��}} ~��~ m  �� ���  ��  | n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascrz ���� r  ���� c  ���� n  ���� 7 ����
�� 
cha � m  ���� �  ;  	
� n  � ��� 4  � ���
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  ��
�� 
TEXT� o      ���� 0 emailaddress emailAddress��  ��  ��  c ��� l ��������  ��  ��  � ��� r  %��� J  �� ���� m  �� ���  :  ��  � n     ��� 1   $��
�� 
txdl� 1   ��
�� 
ascr� ��� Z  &�������� C &2��� n  &.��� 4  ).���
�� 
cpar� o  ,-���� 0 i  � o  &)���� "0 userinformation userInformation� m  .1�� ��� ( d s A t t r T y p e N a t i v e : c o :� Q  5|���� r  8I��� n  8E��� 4  @E���
�� 
citm� m  CD���� � n  8@��� 4  ;@���
�� 
cpar� o  >?���� 0 i  � o  8;���� "0 userinformation userInformation� o      ���� 0 usercountry userCountry� R      ������
�� .ascrerr ****      � ****��  ��  � k  Q|�� ��� r  Q^��� J  QV�� ���� m  QT�� ���  ��  � n     ��� 1  Y]��
�� 
txdl� 1  VY��
�� 
ascr� ���� r  _|��� c  _x��� n  _t��� 7it����
�� 
cha � m  oq���� �  ;  rs� n  _i��� 4  bi���
�� 
cpar� l eh������ [  eh��� o  ef�� 0 i  � m  fg�~�~ ��  ��  � o  _b�}�} "0 userinformation userInformation� m  tw�|
�| 
TEXT� o      �{�{ 0 usercountry userCountry��  ��  ��  � ��� l ���z�y�x�z  �y  �x  � ��� r  ����� J  ���� ��w� m  ���� ���  :  �w  � n     ��� 1  ���v
�v 
txdl� 1  ���u
�u 
ascr� ��� Z  �����t�s� C ����� n  ����� 4  ���r�
�r 
cpar� o  ���q�q 0 i  � o  ���p�p "0 userinformation userInformation� m  ���� ��� 2 d s A t t r T y p e N a t i v e : c o m p a n y :� Q  ������ r  ����� n  ����� 4  ���o�
�o 
citm� m  ���n�n � n  ����� 4  ���m�
�m 
cpar� o  ���l�l 0 i  � o  ���k�k "0 userinformation userInformation� o      �j�j 0 usercompany userCompany� R      �i�h�g
�i .ascrerr ****      � ****�h  �g  � k  ���� ��� r  ����� J  ���� ��f� m  ���� ���  �f  � n     ��� 1  ���e
�e 
txdl� 1  ���d
�d 
ascr� ��c� r  ����� c  ����� n  ��   7���b
�b 
cha  m  ���a�a   ;  �� n  �� 4  ���`
�` 
cpar l ���_�^ [  ��	 o  ���]�] 0 i  	 m  ���\�\ �_  �^   o  ���[�[ "0 userinformation userInformation� m  ���Z
�Z 
TEXT� o      �Y�Y 0 usercompany userCompany�c  �t  �s  � 

 l ���X�W�V�X  �W  �V    r  �� J  �� �U m  �� �  :  �U   n      1  ���T
�T 
txdl 1  ���S
�S 
ascr  Z  �R�R�Q C � n  �  4  � �P
�P 
cpar o  ���O�O 0 i   o  ���N�N "0 userinformation userInformation m    �   8 d s A t t r T y p e N a t i v e : d e p a r t m e n t : Q  N!"#! r  
$%$ n  
&'& 4  �M(
�M 
citm( m  �L�L ' n  
)*) 4  �K+
�K 
cpar+ o  �J�J 0 i  * o  
�I�I "0 userinformation userInformation% o      �H�H  0 userdepartment userDepartment" R      �G�F�E
�G .ascrerr ****      � ****�F  �E  # k  #N,, -.- r  #0/0/ J  #(11 2�D2 m  #&33 �44  �D  0 n     565 1  +/�C
�C 
txdl6 1  (+�B
�B 
ascr. 7�A7 r  1N898 c  1J:;: n  1F<=< 7;F�@>?
�@ 
cha > m  AC�?�? ?  ;  DE= n  1;@A@ 4  4;�>B
�> 
cparB l 7:C�=�<C [  7:DED o  78�;�; 0 i  E m  89�:�: �=  �<  A o  14�9�9 "0 userinformation userInformation; m  FI�8
�8 
TEXT9 o      �7�7  0 userdepartment userDepartment�A  �R  �Q   FGF l SS�6�5�4�6  �5  �4  G HIH r  S`JKJ J  SXLL M�3M m  SVNN �OO  :  �3  K n     PQP 1  [_�2
�2 
txdlQ 1  X[�1
�1 
ascrI RSR Z  a�TU�0�/T C amVWV n  aiXYX 4  di�.Z
�. 
cparZ o  gh�-�- 0 i  Y o  ad�,�, "0 userinformation userInformationW m  il[[ �\\ X d s A t t r T y p e N a t i v e : p h y s i c a l D e l i v e r y O f f i c e N a m e :U Q  p�]^_] r  s�`a` n  s�bcb 4  {��+d
�+ 
citmd m  ~�*�* c n  s{efe 4  v{�)g
�) 
cparg o  yz�(�( 0 i  f o  sv�'�' "0 userinformation userInformationa o      �&�& 0 
useroffice 
userOffice^ R      �%�$�#
�% .ascrerr ****      � ****�$  �#  _ k  ��hh iji r  ��klk J  ��mm n�"n m  ��oo �pp  �"  l n     qrq 1  ���!
�! 
txdlr 1  ��� 
�  
ascrj s�s r  ��tut c  ��vwv n  ��xyx 7���z{
� 
cha z m  ���� {  ;  ��y n  ��|}| 4  ���~
� 
cpar~ l ���� [  ����� o  ���� 0 i  � m  ���� �  �  } o  ���� "0 userinformation userInformationw m  ���
� 
TEXTu o      �� 0 
useroffice 
userOffice�  �0  �/  S ��� l ������  �  �  � ��� r  ����� J  ���� ��� m  ���� ���  :  �  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� Z  �$����� C ����� n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���
�
 "0 userinformation userInformation� m  ���� ��� @ d s A t t r T y p e N a t i v e : s A M A c c o u n t N a m e :� Q  � ���� r  ����� n  ����� 4  ���	�
�	 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      �� 0 usershortname userShortName� R      ���
� .ascrerr ****      � ****�  �  � k  � �� ��� r  ���� J  ���� �� � m  ���� ���  �   � n     ��� 1  ���
�� 
txdl� 1  ����
�� 
ascr� ���� r   ��� c  ��� n  ��� 7����
�� 
cha � m  ���� �  ;  � n  ��� 4  ���
�� 
cpar� l 	������ [  	��� o  	
���� 0 i  � m  
���� ��  ��  � o  ���� "0 userinformation userInformation� m  ��
�� 
TEXT� o      ���� 0 usershortname userShortName��  �  �  � ��� l %%��������  ��  ��  � ��� r  %2��� J  %*�� ���� m  %(�� ���  :  ��  � n     ��� 1  -1��
�� 
txdl� 1  *-��
�� 
ascr� ��� Z  3�������� C 3?��� n  3;��� 4  6;���
�� 
cpar� o  9:���� 0 i  � o  36���� "0 userinformation userInformation� m  ;>�� ��� : d s A t t r T y p e N a t i v e : w W W H o m e P a g e :� Q  B����� r  EV��� n  ER��� 4  MR���
�� 
citm� m  PQ���� � n  EM��� 4  HM���
�� 
cpar� o  KL���� 0 i  � o  EH���� "0 userinformation userInformation� o      ���� 0 userwebpage userWebPage� R      ������
�� .ascrerr ****      � ****��  ��  � k  ^��� ��� r  ^k��� J  ^c�� ���� m  ^a�� ���  ��  � n     ��� 1  fj��
�� 
txdl� 1  cf��
�� 
ascr� ���� r  l���� c  l���� n  l���� 7v�����
�� 
cha � m  |~���� �  ;  �� n  lv��� 4  ov���
�� 
cpar� l ru������ [  ru��� o  rs���� 0 i  � m  st���� ��  ��  � o  lo���� "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 userwebpage userWebPage��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� J  ��   �� m  �� �  :  ��  � n      1  ����
�� 
txdl 1  ����
�� 
ascr�  Z  ��	���� C ��

 n  �� 4  ����
�� 
cpar o  ������ 0 i   o  ������ "0 userinformation userInformation m  �� � 
 C i t y :	 Q  �� r  �� n  �� 4  ����
�� 
citm m  ������  n  �� 4  ����
�� 
cpar o  ������ 0 i   o  ������ "0 userinformation userInformation o      ���� 0 usercity userCity R      ������
�� .ascrerr ****      � ****��  ��   k  ��  r  ��  J  ��!! "��" m  ��## �$$  ��    n     %&% 1  ����
�� 
txdl& 1  ����
�� 
ascr '��' r  ��()( c  ��*+* n  ��,-, 7����./
�� 
cha . m  ������ /  ;  ��- n  ��010 4  ����2
�� 
cpar2 l ��3����3 [  ��454 o  ������ 0 i  5 m  ������ ��  ��  1 o  ������ "0 userinformation userInformation+ m  ����
�� 
TEXT) o      ���� 0 usercity userCity��  ��  ��   676 l ����������  ��  ��  7 898 r  �:;: J  ��<< =��= m  ��>> �??  :  ��  ; n     @A@ 1  ���
�� 
txdlA 1  ����
�� 
ascr9 BCB Z  _DE����D C FGF n  HIH 4  ��J
�� 
cparJ o  ���� 0 i  I o  ���� "0 userinformation userInformationG m  KK �LL  F A X N u m b e r :E Q  [MNOM r  (PQP n  $RSR 4  $��T
�� 
citmT m  "#���� S n  UVU 4  ��W
�� 
cparW o  ���� 0 i  V o  ���� "0 userinformation userInformationQ o      ���� 0 userfax userFaxN R      ������
�� .ascrerr ****      � ****��  ��  O k  0[XX YZY r  0=[\[ J  05]] ^��^ m  03__ �``  ��  \ n     aba 1  8<��
�� 
txdlb 1  58��
�� 
ascrZ c��c r  >[ded c  >Wfgf n  >Shih 7HS��jk
�� 
cha j m  NP���� k  ;  QRi n  >Hlml 4  AH��n
�� 
cparn l DGo����o [  DGpqp o  DE���� 0 i  q m  EF���� ��  ��  m o  >A���� "0 userinformation userInformationg m  SV��
�� 
TEXTe o      ���� 0 userfax userFax��  ��  ��  C rsr l ``��������  ��  ��  s tut r  `mvwv J  `exx y��y m  `czz �{{  :  ��  w n     |}| 1  hl��
�� 
txdl} 1  eh��
�� 
ascru ~~ Z  n�������� C nz��� n  nv��� 4  qv���
�� 
cpar� o  tu���� 0 i  � o  nq���� "0 userinformation userInformation� m  vy�� ���  F i r s t N a m e :� Q  }����� r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  ����
� 
cpar� o  ���~�~ 0 i  � o  ���}�} "0 userinformation userInformation� o      �|�| 0 userfirstname userFirstName� R      �{�z�y
�{ .ascrerr ****      � ****�z  �y  � k  ���� ��� r  ����� J  ���� ��x� m  ���� ���  �x  � n     ��� 1  ���w
�w 
txdl� 1  ���v
�v 
ascr� ��u� r  ����� c  ����� n  ����� 7���t��
�t 
cha � m  ���s�s �  ;  ��� n  ����� 4  ���r�
�r 
cpar� l ����q�p� [  ����� o  ���o�o 0 i  � m  ���n�n �q  �p  � o  ���m�m "0 userinformation userInformation� m  ���l
�l 
TEXT� o      �k�k 0 userfirstname userFirstName�u  ��  ��   ��� l ���j�i�h�j  �i  �h  � ��� r  ����� J  ���� ��g� m  ���� ���  :  �g  � n     ��� 1  ���f
�f 
txdl� 1  ���e
�e 
ascr� ��� Z  �1���d�c� C ����� n  ����� 4  ���b�
�b 
cpar� o  ���a�a 0 i  � o  ���`�` "0 userinformation userInformation� m  ���� ���  J o b T i t l e :� Q  �-���� r  ����� n  ����� 4  ���_�
�_ 
citm� m  ���^�^ � n  ����� 4  ���]�
�] 
cpar� o  ���\�\ 0 i  � o  ���[�[ "0 userinformation userInformation� o      �Z�Z 0 	usertitle 	userTitle� R      �Y�X�W
�Y .ascrerr ****      � ****�X  �W  � k  -�� ��� r  ��� J  �� ��V� m  �� ���  �V  � n     ��� 1  
�U
�U 
txdl� 1  
�T
�T 
ascr� ��S� r  -��� c  )��� n  %��� 7%�R��
�R 
cha � m   "�Q�Q �  ;  #$� n  ��� 4  �P�
�P 
cpar� l ��O�N� [  ��� o  �M�M 0 i  � m  �L�L �O  �N  � o  �K�K "0 userinformation userInformation� m  %(�J
�J 
TEXT� o      �I�I 0 	usertitle 	userTitle�S  �d  �c  � ��� l 22�H�G�F�H  �G  �F  � ��� r  2?��� J  27�� ��E� m  25�� ���  :  �E  � n     ��� 1  :>�D
�D 
txdl� 1  7:�C
�C 
ascr� ��� Z  @����B�A� C @L��� n  @H��� 4  CH�@�
�@ 
cpar� o  FG�?�? 0 i  � o  @C�>�> "0 userinformation userInformation� m  HK�� �    L a s t N a m e :� Q  O� r  Rc n  R_ 4  Z_�=
�= 
citm m  ]^�<�<  n  RZ	
	 4  UZ�;
�; 
cpar o  XY�:�: 0 i  
 o  RU�9�9 "0 userinformation userInformation o      �8�8 0 userlastname userLastName R      �7�6�5
�7 .ascrerr ****      � ****�6  �5   k  k�  r  kx J  kp �4 m  kn �  �4   n      1  sw�3
�3 
txdl 1  ps�2
�2 
ascr �1 r  y� c  y� n  y� 7���0
�0 
cha  m  ���/�/   ;  �� n  y� !  4  |��."
�. 
cpar" l �#�-�,# [  �$%$ o  ��+�+ 0 i  % m  ���*�* �-  �,  ! o  y|�)�) "0 userinformation userInformation m  ���(
�( 
TEXT o      �'�' 0 userlastname userLastName�1  �B  �A  � &'& l ���&�%�$�&  �%  �$  ' ()( r  ��*+* J  ��,, -�#- m  ��.. �//  :  �#  + n     010 1  ���"
�" 
txdl1 1  ���!
�! 
ascr) 232 Z  �45� �4 C ��676 n  ��898 4  ���:
� 
cpar: o  ���� 0 i  9 o  ���� "0 userinformation userInformation7 m  ��;; �<<  M o b i l e N u m b e r :5 Q  ��=>?= r  ��@A@ n  ��BCB 4  ���D
� 
citmD m  ���� C n  ��EFE 4  ���G
� 
cparG o  ���� 0 i  F o  ���� "0 userinformation userInformationA o      �� 0 
usermobile 
userMobile> R      ���
� .ascrerr ****      � ****�  �  ? k  ��HH IJI r  ��KLK J  ��MM N�N m  ��OO �PP  �  L n     QRQ 1  ���
� 
txdlR 1  ���
� 
ascrJ S�S r  ��TUT c  ��VWV n  ��XYX 7���Z[
� 
cha Z m  ���� [  ;  ��Y n  ��\]\ 4  ���^
� 
cpar^ l ��_��
_ [  ��`a` o  ���	�	 0 i  a m  ���� �  �
  ] o  ���� "0 userinformation userInformationW m  ���
� 
TEXTU o      �� 0 
usermobile 
userMobile�  �   �  3 bcb l ����  �  �  c ded r  fgf J  	hh i�i m  jj �kk  :  �  g n     lml 1  � 
�  
txdlm 1  	��
�� 
ascre non Z  lpq����p C rsr n  tut 4  ��v
�� 
cparv o  ���� 0 i  u o  ���� "0 userinformation userInformations m  ww �xx  P h o n e N u m b e r :q Q  !hyz{y r  $5|}| n  $1~~ 4  ,1���
�� 
citm� m  /0����  n  $,��� 4  ',���
�� 
cpar� o  *+���� 0 i  � o  $'���� "0 userinformation userInformation} o      ���� 0 userworkphone userWorkPhonez R      ������
�� .ascrerr ****      � ****��  ��  { k  =h�� ��� r  =J��� J  =B�� ���� m  =@�� ���  ��  � n     ��� 1  EI��
�� 
txdl� 1  BE��
�� 
ascr� ���� r  Kh��� c  Kd��� n  K`��� 7U`����
�� 
cha � m  []���� �  ;  ^_� n  KU��� 4  NU���
�� 
cpar� l QT������ [  QT��� o  QR���� 0 i  � m  RS���� ��  ��  � o  KN���� "0 userinformation userInformation� m  `c��
�� 
TEXT� o      ���� 0 userworkphone userWorkPhone��  ��  ��  o ��� l mm��������  ��  ��  � ��� r  mz��� J  mr�� ���� m  mp�� ���  :  ��  � n     ��� 1  uy��
�� 
txdl� 1  ru��
�� 
ascr� ��� Z  {�������� C {���� n  {���� 4  ~����
�� 
cpar� o  ������ 0 i  � o  {~���� "0 userinformation userInformation� m  ���� ���  P o s t a l C o d e :� Q  ������ r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ����  0 userpostalcode userPostalCode� R      ������
�� .ascrerr ****      � ****��  ��  � k  ���� ��� r  ����� J  ���� ���� m  ���� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  ����� c  ����� n  ����� 7������
�� 
cha � m  ������ �  ;  ��� n  ����� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  ����
�� 
TEXT� o      ����  0 userpostalcode userPostalCode��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �	>������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ���  R e a l N a m e :� Q  �	:���� r  �	��� n  �	��� 4  �	���
�� 
citm� m  		���� � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ���� 0 userfullname userFullName� R      ������
�� .ascrerr ****      � ****��  ��  � k  		:�� ��� r  		� � J  		 �� m  		 �  ��    n      1  		��
�� 
txdl 1  		��
�� 
ascr� �� r  		:	 c  		6

 n  		2 7	'	2��
�� 
cha  m  	-	/����   ;  	0	1 n  		' 4  	 	'��
�� 
cpar l 	#	&���� [  	#	& o  	#	$���� 0 i   m  	$	%���� ��  ��   o  		 ���� "0 userinformation userInformation m  	2	5��
�� 
TEXT	 o      ���� 0 userfullname userFullName��  ��  ��  �  l 	?	?��������  ��  ��    r  	?	L J  	?	D �� m  	?	B �  :  ��   n      !  1  	G	K��
�� 
txdl! 1  	D	G��
�� 
ascr "#" Z  	M	�$%����$ C 	M	Y&'& n  	M	U()( 4  	P	U��*
�� 
cpar* o  	S	T���� 0 i  ) o  	M	P���� "0 userinformation userInformation' m  	U	X++ �,,  S t a t e :% Q  	\	�-./- r  	_	p010 n  	_	l232 4  	g	l��4
�� 
citm4 m  	j	k���� 3 n  	_	g565 4  	b	g��7
�� 
cpar7 o  	e	f���� 0 i  6 o  	_	b���� "0 userinformation userInformation1 o      ���� 0 	userstate 	userState. R      ������
�� .ascrerr ****      � ****��  ��  / k  	x	�88 9:9 r  	x	�;<; J  	x	}== >��> m  	x	{?? �@@  ��  < n     ABA 1  	�	���
�� 
txdlB 1  	}	���
�� 
ascr: C��C r  	�	�DED c  	�	�FGF n  	�	�HIH 7	�	���JK
�� 
cha J m  	�	����� K  ;  	�	�I n  	�	�LML 4  	�	���N
�� 
cparN l 	�	�O����O [  	�	�PQP o  	�	����� 0 i  Q m  	�	����� ��  ��  M o  	�	��� "0 userinformation userInformationG m  	�	��~
�~ 
TEXTE o      �}�} 0 	userstate 	userState��  ��  ��  # RSR l 	�	��|�{�z�|  �{  �z  S TUT r  	�	�VWV J  	�	�XX Y�yY m  	�	�ZZ �[[  :  �y  W n     \]\ 1  	�	��x
�x 
txdl] 1  	�	��w
�w 
ascrU ^_^ Z  	�
`a�v�u` C 	�	�bcb n  	�	�ded 4  	�	��tf
�t 
cparf o  	�	��s�s 0 i  e o  	�	��r�r "0 userinformation userInformationc m  	�	�gg �hh  S t r e e t :a Q  	�
ijki r  	�	�lml n  	�	�non 4  	�	��qp
�q 
citmp m  	�	��p�p o n  	�	�qrq 4  	�	��os
�o 
cpars o  	�	��n�n 0 i  r o  	�	��m�m "0 userinformation userInformationm o      �l�l 0 
userstreet 
userStreetj R      �k�j�i
�k .ascrerr ****      � ****�j  �i  k k  	�
tt uvu r  	�	�wxw J  	�	�yy z�hz m  	�	�{{ �||  �h  x n     }~} 1  	�	��g
�g 
txdl~ 1  	�	��f
�f 
ascrv �e r  	�
��� c  	�
��� n  	�
��� 7	�
�d��
�d 
cha � m  	�
�c�c �  ;  

� n  	�	���� 4  	�	��b�
�b 
cpar� l 	�	���a�`� [  	�	���� o  	�	��_�_ 0 i  � m  	�	��^�^ �a  �`  � o  	�	��]�] "0 userinformation userInformation� m  

�\
�\ 
TEXT� o      �[�[ 0 
userstreet 
userStreet�e  �v  �u  _ ��Z� l 

�Y�X�W�Y  �X  �W  �Z  �� 0 i  S m  ���V�V T I ���U��T
�U .corecnte****       ****� n ����� 2 ���S
�S 
cpar� o  ���R�R "0 userinformation userInformation�T  ��  Q ��� l 

�Q�P�O�Q  �P  �O  � ��� r  

(��� J  

 �� ��� m  

�� ���  ; K e r b e r o s v 5 ; ;� ��N� m  

�� ���  ;�N  � n     ��� 1  
#
'�M
�M 
txdl� 1  
 
#�L
�L 
ascr� ��� l 
)
)�K�J�I�K  �J  �I  � ��� Q  
)
A���H� r  
,
8��� n  
,
4��� 4  
/
4�G�
�G 
citm� m  
2
3�F�F � o  
,
/�E�E "0 userinformation userInformation� o      �D�D &0 userkerberosrealm userKerberosRealm� R      �C�B�A
�C .ascrerr ****      � ****�B  �A  �H  � ��� l 
B
B�@�?�>�@  �?  �>  � ��� r  
B
O��� J  
B
G�� ��=� m  
B
E�� ���  �=  � n     ��� 1  
J
N�<
�< 
txdl� 1  
G
J�;
�; 
ascr� ��� l 
P
P�:�9�8�:  �9  �8  � ��� Z  
P
����7�6� = 
P
W��� o  
P
S�5�5 0 emailaddress emailAddress� m  
S
V�� ���  � k  
Z
��� ��� l 
Z
Z�4�3�2�4  �3  �2  � ��� l 
Z
Z�1���1  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l 
Z
Z�0�/�.�0  �/  �.  � ��� I 
Z
��-��
�- .sysodlogaskr        TEXT� b  
Z
g��� b  
Z
c��� b  
Z
a��� o  
Z
_�,�, 0 errormessage errorMessage� o  
_
`�+
�+ 
ret � o  
a
b�*
�* 
ret � m  
c
f�� ��� h U n a b l e   t o   r e a d   e m a i l   a d d r e s s   f r o m   n e t w o r k   d i r e c t o r y .� �)��
�) 
disp� m  
j
m�(
�( stic    � �'��
�' 
btns� J  
p
u�� ��&� m  
p
s�� ���  O K�&  � �%��
�% 
dflt� J  
x
}�� ��$� m  
x
{�� ���  O K�$  � �#��"
�# 
appr� m  
�
��� ��� , O u t l o o k   E x c h a n g e   S e t u p�"  � ��!� R  
�
�� ��
�  .ascrerr ****      � ****�  � ���
� 
errn� m  
�
������  �!  �7  �6  � ��� l 
�
�����  �  �  �    ��� = 
�
���� o  
�
��� R0 'getuserinformationfromenterpriseconnect 'getUserInformationFromEnterpriseConnect� m  
�
��
� boovtrue� ��� k  
�
��� ��� l 
�
�����  �  �  � ��� l 
�
�����  �   to come   � ���    t o   c o m e� ��� l 
�
�����  �  �  �  � ��� F  
�
��	 � = 
�
�			 o  
�
��� 0 emailformat emailFormat	 m  
�
��� 	  = 
�
�			 o  
�
��� 0 displayname displayName	 m  
�
��
�
 � 			 k  
�/		 				 l 
�
��	���	  �  �  		 	
		
 l 
�
��		�  	 P J Pull user information from the account settings of the local user account   	 �		 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	 			 l 
�
�����  �  �  	 			 r  
�
�			 n  
�
�			 1  
�
��
� 
sisn	 l 
�
�	�� 	 I 
�
�������
�� .sysosigtsirr   ��� null��  ��  �  �   	 o      ���� 0 usershortname userShortName	 			 r  
�
�			 n  
�
�			 1  
�
���
�� 
siln	 l 
�
�	����	 I 
�
�������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	 o      ���� 0 userfullname userFullName	 		 	 l 
�
���������  ��  ��  	  	!	"	! l 
�
���	#	$��  	# D > first.last@domain.com and full name displays as "Last, First"   	$ �	%	% |   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	" 	&	'	& l 
�
���������  ��  ��  	' 	(	)	( r  
�
�	*	+	* m  
�
�	,	, �	-	-  ,  	+ n     	.	/	. 1  
�
���
�� 
txdl	/ 1  
�
���
�� 
ascr	) 	0	1	0 r  
�
�	2	3	2 n  
�
�	4	5	4 4 
�
���	6
�� 
citm	6 m  
�
�������	5 o  
�
����� 0 userfullname userFullName	3 o      ���� 0 userfirstname userFirstName	1 	7	8	7 r  
�	9	:	9 n  
�	;	<	; 4  
���	=
�� 
cwor	= m  ���� 	< n  
�
�	>	?	> 4  
�
���	@
�� 
citm	@ m  
�
����� 	? o  
�
����� 0 userfullname userFullName	: o      ���� 0 userlastname userLastName	8 	A	B	A r  	C	D	C m  	E	E �	F	F  	D n     	G	H	G 1  ��
�� 
txdl	H 1  ��
�� 
ascr	B 	I	J	I r  -	K	L	K b  )	M	N	M b  #	O	P	O b  	Q	R	Q b  	S	T	S o  ���� 0 userfirstname userFirstName	T m  	U	U �	V	V  .	R o  ���� 0 userlastname userLastName	P m  "	W	W �	X	X  @	N o  #(���� 0 
domainname 
domainName	L o      ���� 0 emailaddress emailAddress	J 	Y��	Y l ..��������  ��  ��  ��  	 	Z	[	Z F  2G	\	]	\ = 29	^	_	^ o  27���� 0 emailformat emailFormat	_ m  78���� 	] = <C	`	a	` o  <A���� 0 displayname displayName	a m  AB���� 	[ 	b	c	b k  J�	d	d 	e	f	e l JJ��������  ��  ��  	f 	g	h	g l JJ��	i	j��  	i P J Pull user information from the account settings of the local user account   	j �	k	k �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	h 	l	m	l l JJ��������  ��  ��  	m 	n	o	n r  JW	p	q	p n  JS	r	s	r 1  OS��
�� 
sisn	s l JO	t����	t I JO������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	q o      ���� 0 usershortname userShortName	o 	u	v	u r  Xe	w	x	w n  Xa	y	z	y 1  ]a��
�� 
siln	z l X]	{����	{ I X]������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	x o      ���� 0 userfullname userFullName	v 	|	}	| l ff��������  ��  ��  	} 	~		~ l ff��	�	���  	� C = first.last@domain.com and full name displays as "First Last"   	� �	�	� z   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "	 	�	�	� l ff��������  ��  ��  	� 	�	�	� r  fq	�	�	� m  fi	�	� �	�	�   	� n     	�	�	� 1  lp��
�� 
txdl	� 1  il��
�� 
ascr	� 	�	�	� r  r�	�	�	� n  r	�	�	� 4  z��	�
�� 
cwor	� m  }~���� 	� n  rz	�	�	� 4  uz��	�
�� 
citm	� m  xy���� 	� o  ru���� 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4 ����	�
�� 
citm	� m  ��������	� o  ������ 0 userfullname userFullName	� o      ���� 0 userlastname userLastName	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� b  ��	�	�	� b  ��	�	�	� b  ��	�	�	� b  ��	�	�	� o  ������ 0 userfirstname userFirstName	� m  ��	�	� �	�	�  .	� o  ������ 0 userlastname userLastName	� m  ��	�	� �	�	�  @	� o  ������ 0 
domainname 
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ����������  ��  ��  ��  	c 	�	�	� F  ��	�	�	� = ��	�	�	� o  ������ 0 emailformat emailFormat	� m  ������ 	� = ��	�	�	� o  ������ 0 displayname displayName	� m  ������ 	� 	�	�	� k  �9	�	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
sisn	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
siln	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� ? 9 first@domain.com and full name displays as "Last, First"   	� �	�	� r   f i r s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  ,  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  �	�	�	� n  �	�	�	� 4 ��	�
� 
citm	� m  �~�~��	� o  ���}�} 0 userfullname userFullName	� o      �|�| 0 userfirstname userFirstName	� 	�	�	� r  	�	�	� n  	�	�	� 4  �{	�
�{ 
cwor	� m  �z�z 	� n  	�	�	� 4  �y	�
�y 
citm	� m  �x�x 	� o  �w�w 0 userfullname userFullName	� o      �v�v 0 userlastname userLastName	� 	�	�	� r  %	�	�	� m  	�	� �
 
   	� n     


 1   $�u
�u 
txdl
 1   �t
�t 
ascr	� 


 r  &7


 b  &3


 b  &-
	


	 o  &)�s�s 0 userfirstname userFirstName

 m  ),

 �

  @
 o  -2�r�r 0 
domainname 
domainName
 o      �q�q 0 emailaddress emailAddress
 
�p
 l 88�o�n�m�o  �n  �m  �p  	� 


 F  <Q


 = <C


 o  <A�l�l 0 emailformat emailFormat
 m  AB�k�k 
 = FM


 o  FK�j�j 0 displayname displayName
 m  KL�i�i 
 


 k  T�

 


 l TT�h�g�f�h  �g  �f  
 


 l TT�e

�e  
 P J Pull user information from the account settings of the local user account   
 �

 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
 
 
!
  l TT�d�c�b�d  �c  �b  
! 
"
#
" r  Ta
$
%
$ n  T]
&
'
& 1  Y]�a
�a 
sisn
' l TY
(�`�_
( I TY�^�]�\
�^ .sysosigtsirr   ��� null�]  �\  �`  �_  
% o      �[�[ 0 usershortname userShortName
# 
)
*
) r  bo
+
,
+ n  bk
-
.
- 1  gk�Z
�Z 
siln
. l bg
/�Y�X
/ I bg�W�V�U
�W .sysosigtsirr   ��� null�V  �U  �Y  �X  
, o      �T�T 0 userfullname userFullName
* 
0
1
0 l pp�S�R�Q�S  �R  �Q  
1 
2
3
2 l pp�P
4
5�P  
4 = 7 first@domain.com if full name displays as "First Last"   
5 �
6
6 n   f i r s t @ d o m a i n . c o m   i f   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
3 
7
8
7 l pp�O�N�M�O  �N  �M  
8 
9
:
9 r  p{
;
<
; m  ps
=
= �
>
>   
< n     
?
@
? 1  vz�L
�L 
txdl
@ 1  sv�K
�K 
ascr
: 
A
B
A r  |�
C
D
C n  |�
E
F
E 4  ���J
G
�J 
cwor
G m  ���I�I 
F n  |�
H
I
H 4  ��H
J
�H 
citm
J m  ���G�G 
I o  |�F�F 0 userfullname userFullName
D o      �E�E 0 userfirstname userFirstName
B 
K
L
K r  ��
M
N
M n  ��
O
P
O 4 ���D
Q
�D 
citm
Q m  ���C�C��
P o  ���B�B 0 userfullname userFullName
N o      �A�A 0 userlastname userLastName
L 
R
S
R r  ��
T
U
T m  ��
V
V �
W
W  
U n     
X
Y
X 1  ���@
�@ 
txdl
Y 1  ���?
�? 
ascr
S 
Z
[
Z r  ��
\
]
\ b  ��
^
_
^ b  ��
`
a
` o  ���>�> 0 userfirstname userFirstName
a m  ��
b
b �
c
c  @
_ o  ���=�= 0 
domainname 
domainName
] o      �<�< 0 emailaddress emailAddress
[ 
d�;
d l ���:�9�8�:  �9  �8  �;  
 
e
f
e F  ��
g
h
g = ��
i
j
i o  ���7�7 0 emailformat emailFormat
j m  ���6�6 
h = ��
k
l
k o  ���5�5 0 displayname displayName
l m  ���4�4 
f 
m
n
m k  �D
o
o 
p
q
p l ���3�2�1�3  �2  �1  
q 
r
s
r l ���0
t
u�0  
t P J Pull user information from the account settings of the local user account   
u �
v
v �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
s 
w
x
w l ���/�.�-�/  �.  �-  
x 
y
z
y r  ��
{
|
{ n  ��
}
~
} 1  ���,
�, 
sisn
~ l ��
�+�*
 I ���)�(�'
�) .sysosigtsirr   ��� null�(  �'  �+  �*  
| o      �&�& 0 usershortname userShortName
z 
�
�
� r  ��
�
�
� n  ��
�
�
� 1  ���%
�% 
siln
� l ��
��$�#
� I ���"�!� 
�" .sysosigtsirr   ��� null�!  �   �$  �#  
� o      �� 0 userfullname userFullName
� 
�
�
� l ������  �  �  
� 
�
�
� l ���
�
��  
� ? 9 flast@domain.com and full name displays as "Last, First"   
� �
�
� r   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
� 
�
�
� l ������  �  �  
� 
�
�
� r  ��
�
�
� m  ��
�
� �
�
�  ,  
� n     
�
�
� 1  ���
� 
txdl
� 1  ���
� 
ascr
� 
�
�
� r  �	
�
�
� n  �
�
�
� 4  �
�
� 
citm
� m  ����
� o  � �� 0 userfullname userFullName
� o      �� 0 userfirstname userFirstName
� 
�
�
� r  

�
�
� n  

�
�
� 4  �
�
� 
cwor
� m  �� 
� n  

�
�
� 4  �
�
� 
citm
� m  �� 
� o  
�� 0 userfullname userFullName
� o      �� 0 userlastname userLastName
� 
�
�
� r  '
�
�
� m  
�
� �
�
�  
� n     
�
�
� 1  "&�
� 
txdl
� 1  "�

�
 
ascr
� 
�
�
� r  (B
�
�
� b  (>
�
�
� b  (8
�
�
� b  (4
�
�
� l (0
��	�
� n  (0
�
�
� 4  +0�
�
� 
cha 
� m  ./�� 
� o  (+�� 0 userfirstname userFirstName�	  �  
� o  03�� 0 userlastname userLastName
� m  47
�
� �
�
�  @
� o  8=�� 0 
domainname 
domainName
� o      �� 0 emailaddress emailAddress
� 
��
� l CC� �����   ��  ��  �  
n 
�
�
� F  G\
�
�
� = GN
�
�
� o  GL���� 0 emailformat emailFormat
� m  LM���� 
� = QX
�
�
� o  QV���� 0 displayname displayName
� m  VW���� 
� 
�
�
� k  _�
�
� 
�
�
� l __��������  ��  ��  
� 
�
�
� l __��
�
���  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l __��������  ��  ��  
� 
�
�
� r  _l
�
�
� n  _h
�
�
� 1  dh��
�� 
sisn
� l _d
�����
� I _d������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
� o      ���� 0 usershortname userShortName
� 
�
�
� r  mz
�
�
� n  mv
�
�
� 1  rv��
�� 
siln
� l mr
�����
� I mr������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
� o      ���� 0 userfullname userFullName
� 
�
�
� l {{��������  ��  ��  
� 
�
�
� l {{��
�
���  
� > 8 flast@domain.com and full name displays as "First Last"   
� �
�
� p   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
� 
�
�
� l {{��������  ��  ��  
� 
�
�
� r  {�
�
�
� m  {~
�
� �
�
�   
� n     
�
�
� 1  ����
�� 
txdl
� 1  ~���
�� 
ascr
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 4  ����
�
�� 
cwor
� m  ������ 
� n  ��
�
�
� 4  ����
�
�� 
citm
� m  ������ 
� o  ������ 0 userfullname userFullName
� o      ���� 0 userfirstname userFirstName
� 
� 
� r  �� n  �� 4 ����
�� 
citm m  �������� o  ������ 0 userfullname userFullName o      ���� 0 userlastname userLastName   r  ��	 m  ��

 �  	 n      1  ����
�� 
txdl 1  ����
�� 
ascr  r  �� l ������ b  �� b  �� b  �� n  �� 4  ����
�� 
cha  m  ������  o  ������ 0 userfirstname userFirstName o  ������ 0 userlastname userLastName m  �� �  @ o  ������ 0 
domainname 
domainName��  ��   o      ���� 0 emailaddress emailAddress �� l ����������  ��  ��  ��  
�   F  ��!"! = ��#$# o  ������ 0 emailformat emailFormat$ m  ������ " = ��%&% o  ������ 0 displayname displayName& m  ������   '(' k  �Q)) *+* l ����������  ��  ��  + ,-, l ����./��  . P J Pull user information from the account settings of the local user account   / �00 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t- 121 l ����������  ��  ��  2 343 r  ��565 n  ��787 1  ����
�� 
sisn8 l ��9����9 I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  6 o      ���� 0 usershortname userShortName4 :;: r  �<=< n  �>?> 1  ���
�� 
siln? l ��@����@ I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  = o      ���� 0 userfullname userFullName; ABA l ��������  ��  ��  B CDC l ��EF��  E C = shortName@domain.com and full name displays as "Last, First"   F �GG z   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "D HIH l ��������  ��  ��  I JKJ r  LML m  
NN �OO  ,  M n     PQP 1  ��
�� 
txdlQ 1  
��
�� 
ascrK RSR r  TUT n  VWV 4 ��X
�� 
citmX m  ������W o  ���� 0 userfullname userFullNameU o      ���� 0 userfirstname userFirstNameS YZY r   1[\[ n   -]^] 4  (-��_
�� 
cwor_ m  +,���� ^ n   (`a` 4  #(��b
�� 
citmb m  &'���� a o   #���� 0 userfullname userFullName\ o      ���� 0 userlastname userLastNameZ cdc r  2=efe m  25gg �hh  f n     iji 1  8<��
�� 
txdlj 1  58��
�� 
ascrd klk r  >Omnm b  >Kopo b  >Eqrq o  >A���� 0 usershortname userShortNamer m  ADss �tt  @p o  EJ���� 0 
domainname 
domainNamen o      ���� 0 emailaddress emailAddressl u��u l PP��������  ��  ��  ��  ( vwv F  Tkxyx = T]z{z o  TY���� 0 emailformat emailFormat{ m  Y\���� y = `g|}| o  `e���� 0 displayname displayName} m  ef���� w ~��~ k  n� ��� l nn��������  ��  ��  � ��� l nn������  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l nn��������  ��  ��  � ��� r  n{��� n  nw��� 1  sw��
�� 
sisn� l ns������ I ns��~�}
� .sysosigtsirr   ��� null�~  �}  ��  ��  � o      �|�| 0 usershortname userShortName� ��� r  |���� n  |���� 1  ���{
�{ 
siln� l |���z�y� I |��x�w�v
�x .sysosigtsirr   ��� null�w  �v  �z  �y  � o      �u�u 0 userfullname userFullName� ��� l ���t�s�r�t  �s  �r  � ��� l ���q���q  � B < shortName@domain.com and full name displays as "First Last"   � ��� x   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "� ��� l ���p�o�n�p  �o  �n  � ��� r  ����� m  ���� ���   � n     ��� 1  ���m
�m 
txdl� 1  ���l
�l 
ascr� ��� r  ����� n  ����� 4  ���k�
�k 
cwor� m  ���j�j � n  ����� 4  ���i�
�i 
citm� m  ���h�h � o  ���g�g 0 userfullname userFullName� o      �f�f 0 userfirstname userFirstName� ��� r  ����� n  ����� 4 ���e�
�e 
citm� m  ���d�d��� o  ���c�c 0 userfullname userFullName� o      �b�b 0 userlastname userLastName� ��� r  ����� m  ���� ���  � n     ��� 1  ���a
�a 
txdl� 1  ���`
�` 
ascr� ��� r  ����� b  ����� b  ����� o  ���_�_ 0 usershortname userShortName� m  ���� ���  @� o  ���^�^ 0 
domainname 
domainName� o      �]�] 0 emailaddress emailAddress� ��\� l ���[�Z�Y�[  �Z  �Y  �\  ��   k  ��� ��� l ���X�W�V�X  �W  �V  � ��� l ���U���U  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l ���T�S�R�T  �S  �R  � ��� I ��Q��
�Q .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� o  ���P�P 0 errormessage errorMessage� o  ���O
�O 
ret � o  ���N
�N 
ret � m  ���� ��� x U n a b l e   t o   p a r s e   a c c o u n t   i n f o r m a t i o n   f r o m   l o c a l   O S   X   a c c o u n t .� �M��
�M 
disp� m  ���L
�L stic    � �K��
�K 
btns� J  ���� ��J� m  ���� ���  O K�J  � �I��
�I 
dflt� J  ���� ��H� m  ���� ���  O K�H  � �G��F
�G 
appr� m  � �� ��� , O u t l o o k   E x c h a n g e   S e t u p�F  � ��� R  �E�D�
�E .ascrerr ****      � ****�D  � �C��B
�C 
errn� m  �A�A���B  � ��@� l �?�>�=�?  �>  �=  �@  ��  ��  � ��� l     �<�;�:�<  �;  �:  � ��� l     �9���9  � P J Substitute email address for username for mail systems such as Office 365   � ��� �   S u b s t i t u t e   e m a i l   a d d r e s s   f o r   u s e r n a m e   f o r   m a i l   s y s t e m s   s u c h   a s   O f f i c e   3 6 5� � � l     �8�7�6�8  �7  �6     l )�5�4 Z  )�3�2 =  o  �1�1 *0 useemailforusername useEmailForUsername m  �0
�0 boovtrue r  %	 o  !�/�/ 0 emailaddress emailAddress	 o      �.�. 0 usershortname userShortName�3  �2  �5  �4   

 l     �-�,�+�-  �,  �+    l     �*�*   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �)�)   &   End collecting user information    � @   E n d   c o l l e c t i n g   u s e r   i n f o r m a t i o n  l     �(�(   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �'�&�%�'  �&  �%    l     �$ �$   0 *------------------------------------------     �!! T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "#" l     �#$%�#  $ %  Begin logging user information   % �&& >   B e g i n   l o g g i n g   u s e r   i n f o r m a t i o n# '(' l     �")*�"  ) 0 *------------------------------------------   * �++ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -( ,-, l     �!� ��!  �   �  - ./. l *20��0 I  *2�1�� 0 writelog writeLog1 2�2 m  +.33 �44 & U s e r   i n f o r m a t i o n . . .�  �  �  �  / 565 l 3?7��7 I  3?�8�� 0 writelog writeLog8 9�9 b  4;:;: m  47<< �==  F i r s t   N a m e :  ; o  7:�� 0 userfirstname userFirstName�  �  �  �  6 >?> l @L@��@ I  @L�A�� 0 writelog writeLogA B�B b  AHCDC m  ADEE �FF  L a s t   N a m e :  D o  DG�� 0 userlastname userLastName�  �  �  �  ? GHG l MYI��I I  MY�J�
� 0 writelog writeLogJ K�	K b  NULML m  NQNN �OO  E m a i l   A d d r e s s :  M o  QT�� 0 emailaddress emailAddress�	  �
  �  �  H PQP l ZfR��R I  Zf�S�� 0 writelog writeLogS T�T b  [bUVU m  [^WW �XX  D e p a r t m e n t :  V o  ^a��  0 userdepartment userDepartment�  �  �  �  Q YZY l gs[�� [ I  gs��\���� 0 writelog writeLog\ ]��] b  ho^_^ m  hk`` �aa  O f f i c e :  _ o  kn���� 0 
useroffice 
userOffice��  ��  �  �   Z bcb l t�d����d I  t���e���� 0 writelog writeLoge f��f b  u|ghg m  uxii �jj  C o m p a n y :  h o  x{���� 0 usercompany userCompany��  ��  ��  ��  c klk l ��m����m I  ����n���� 0 writelog writeLogn o��o b  ��pqp m  ��rr �ss  W o r k   P h o n e :  q o  ������ 0 userworkphone userWorkPhone��  ��  ��  ��  l tut l ��v����v I  ����w���� 0 writelog writeLogw x��x b  ��yzy m  ��{{ �||  M o b i l e   P h o n e :  z o  ������ 0 
usermobile 
userMobile��  ��  ��  ��  u }~} l ������ I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ��� 
 F A X :  � o  ������ 0 userfax userFax��  ��  ��  ��  ~ ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  T i t l e :  � o  ������ 0 	usertitle 	userTitle��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  S t r e e t :  � o  ������ 0 
userstreet 
userStreet��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  C i t y :  � o  ������ 0 usercity userCity��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  S t a t e :  � o  ������ 0 	userstate 	userState��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  P o s t a l   C o d e :  � o  ������  0 userpostalcode userPostalCode��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  C o u n t r y :  � o  ������ 0 usercountry userCountry��  ��  ��  ��  � ��� l ������� I  �������� 0 writelog writeLog� ���� b  ����� m  ���� ���  W e b   P a g e :  � o  ������ 0 userwebpage userWebPage��  ��  ��  ��  � ��� l 	������ I  	������� 0 writelog writeLog� ���� o  ��
�� 
ret ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � #  End logging user information   � ��� :   E n d   l o g g i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin account setup   � ��� (   B e g i n   a c c o u n t   s e t u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l 
������ O  
��� k  �� ��� I ������
�� .miscactvnull��� ��� null��  ��  � ��� l ��������  ��  ��  � ��� r  ��� m  ��
�� boovtrue� 1  ��
�� 
wkOf� ��� l ��������  ��  ��  � ��� Q  Y   k  !?  r  !, o  !&���� 0 unifiedinbox unifiedInbox 1  &+��
�� 
GrpF �� n -?	
	 I  .?������ 0 writelog writeLog �� b  .; b  .7 m  .1 � : S e t   G r o u p   S i m i l a r   F o l d e r s   t o   o  16���� 0 unifiedinbox unifiedInbox m  7: �  :   S u c c e s s f u l .��  ��  
  f  -.��   R      ������
�� .ascrerr ****      � ****��  ��   n GY I  HY������ 0 writelog writeLog �� b  HU b  HQ m  HK � : S e t   G r o u p   S i m i l a r   F o l d e r s   t o   o  KP���� 0 unifiedinbox unifiedInbox m  QT �    :   F a i l e d .��  ��    f  GH� !"! l ZZ��������  ��  ��  " #$# Q  Z�%&'% k  ]{(( )*) r  ]h+,+ o  ]b���� 20 hideonmycomputerfolders hideOnMyComputerFolders, 1  bg��
�� 
hOMC* -��- n i{./. I  j{��0���� 0 writelog writeLog0 1��1 b  jw232 b  js454 m  jm66 �77 F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  5 o  mr���� 20 hideonmycomputerfolders hideOnMyComputerFolders3 m  sv88 �99  :   S u c c e s s f u l .��  ��  /  f  ij��  & R      ��~�}
� .ascrerr ****      � ****�~  �}  ' n ��:;: I  ���|<�{�| 0 writelog writeLog< =�z= b  ��>?> b  ��@A@ m  ��BB �CC F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  A o  ���y�y 20 hideonmycomputerfolders hideOnMyComputerFolders? m  ��DD �EE  :   F a i l e d .�z  �{  ;  f  ��$ FGF l ���x�w�v�x  �w  �v  G HIH Z  ��JK�u�tJ = ��LML o  ���s�s (0 verifyemailaddress verifyEMailAddressM m  ���r
�r boovtrueK k  ��NN OPO r  ��QRQ I ���qST
�q .sysodlogaskr        TEXTS m  ��UU �VV X P l e a s e   v e r i f y   y o u r   e m a i l   a d d r e s s   i s   c o r r e c t .T �pWX
�p 
dtxtW o  ���o�o 0 emailaddress emailAddressX �nYZ
�n 
dispY m  ���m�m Z �l[\
�l 
appr[ m  ��]] �^^ , O u t l o o k   E x c h a n g e   S e t u p\ �k_`
�k 
btns_ J  ��aa bcb m  ��dd �ee  C a n c e lc f�jf m  ��gg �hh  V e r i f y�j  ` �ii�h
�i 
dflti J  ��jj k�gk m  ��ll �mm  V e r i f y�g  �h  R o      �f�f 0 verifyemail verifyEmailP non r  ��pqp n  ��rsr 1  ���e
�e 
ttxts o  ���d�d 0 verifyemail verifyEmailq o      �c�c 0 emailaddress emailAddresso t�bt n ��uvu I  ���aw�`�a 0 writelog writeLogw x�_x b  ��yzy b  ��{|{ m  ��}} �~~ > U s e r   v e r i f i e d   e m a i l   a d d r e s s   a s  | o  ���^�^ 0 emailaddress emailAddressz m  �� ���  .�_  �`  v  f  ���b  �u  �t  I ��� l ���]�\�[�]  �\  �[  � ��� Z  �S���Z�Y� = ����� o  ���X�X *0 verifyserveraddress verifyServerAddress� m  ���W
�W boovtrue� k  �O�� ��� r  �.��� I �*�V��
�V .sysodlogaskr        TEXT� m  ���� ��� f P l e a s e   v e r i f y   y o u r   E x c h a n g e   S e r v e r   n a m e   i s   c o r r e c t .� �U��
�U 
dtxt� o  �T�T  0 exchangeserver ExchangeServer� �S��
�S 
disp� m  
�R�R � �Q��
�Q 
appr� m  �� ��� , O u t l o o k   E x c h a n g e   S e t u p� �P��
�P 
btns� J  �� ��� m  �� ���  C a n c e l� ��O� m  �� ���  V e r i f y�O  � �N��M
�N 
dflt� J  $�� ��L� m  "�� ���  V e r i f y�L  �M  � o      �K�K 0 verifyserver verifyServer� ��� r  /<��� n  /6��� 1  26�J
�J 
ttxt� o  /2�I�I 0 verifyserver verifyServer� o      �H�H  0 exchangeserver ExchangeServer� ��G� n =O��� I  >O�F��E�F 0 writelog writeLog� ��D� b  >K��� b  >G��� m  >A�� ��� @ U s e r   v e r i f i e d   s e r v e r   a d d r e s s   a s  � o  AF�C�C  0 exchangeserver ExchangeServer� m  GJ�� ���  .�D  �E  �  f  =>�G  �Z  �Y  � ��� l TT�B�A�@�B  �A  �@  � ��� l TT�?���?  � "  create the Exchange account   � ��� 8   c r e a t e   t h e   E x c h a n g e   a c c o u n t� ��� l TT�>�=�<�>  �=  �<  � ��� Q  T=���� k  W��� ��� r  W���� I W��;�:�
�; .corecrel****      � null�:  � �9��
�9 
kocl� m  [^�8
�8 
Eact� �7��6
�7 
prdt� l 	a���5�4� K  a��� �3��
�3 
pnam� b  bi��� m  be�� ���  M a i l b o x   -  � o  eh�2�2 0 userfullname userFullName� �1��
�1 
unme� b  lu��� o  lq�0�0 0 domainprefix domainPrefix� o  qt�/�/ 0 usershortname userShortName� �.��
�. 
fnam� o  x{�-�- 0 userfullname userFullName� �,��
�, 
emad� o  ~��+�+ 0 emailaddress emailAddress� �*��
�* 
host� o  ���)�)  0 exchangeserver ExchangeServer� �(��
�( 
usss� o  ���'�' 60 exchangeserverrequiresssl ExchangeServerRequiresSSL� �&��
�& 
port� o  ���%�% .0 exchangeserversslport ExchangeServerSSLPort� �$��
�$ 
ExLS� o  ���#�# "0 directoryserver DirectoryServer� �"��
�" 
LDAu� o  ���!�! N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication� � ��
�  
LDSL� o  ���� 80 directoryserverrequiresssl DirectoryServerRequiresSSL� ���
� 
ExLP� o  ���� 00 directoryserversslport DirectoryServerSSLPort� ���
� 
LDMX� o  ���� >0 directoryservermaximumresults DirectoryServerMaximumResults� ���
� 
LDSB� o  ���� 60 directoryserversearchbase DirectoryServerSearchBase� ���
� 
ExPm� o  ���� *0 downloadheadersonly downloadHeadersOnly� ���
� 
pBAD� o  ���� (0 enableautodiscover enableAutodiscover�  �5  �4  �6  � o      �� (0 newexchangeaccount newExchangeAccount� ��� n ����� I  ������ 0 writelog writeLog� ��� m  ���� ��� H C r e a t e   E x c h a n g e   a c c o u n t :   S u c c e s s f u l .�  �  �  f  ���  � R      ���
� .ascrerr ****      � ****�  �  � k  �=��    l ����
�	�  �
  �	    l ����     something went wrong    � *   s o m e t h i n g   w e n t   w r o n g  l ������  �  �   	
	 n �  I  � ��� 0 writelog writeLog � m  �� � @ C r e a t e   E x c h a n g e   a c c o u n t :   F a i l e d .�  �    f  ��
  l �� ���  �   ��    I 0��
�� .sysodlogaskr        TEXT b   b  
 b   o  ���� 0 errormessage errorMessage o  ��
�� 
ret  o  	��
�� 
ret  m  
 � D U n a b l e   t o   c r e a t e   E x c h a n g e   a c c o u n t . �� 
�� 
disp m  ��
�� stic      ��!"
�� 
btns! J  ## $��$ m  %% �&&  O K��  " ��'(
�� 
dflt' J  $)) *��* m  "++ �,,  O K��  ( ��-��
�� 
appr- m  '*.. �// , O u t l o o k   E x c h a n g e   S e t u p��   010 R  1;����2
�� .ascrerr ****      � ****��  2 ��3��
�� 
errn3 m  58��������  1 4��4 l <<��������  ��  ��  ��  � 565 l >>��������  ��  ��  6 787 l >>��9:��  9 e _ The following lines enable Kerberos support if the userKerberos property above is set to true.   : �;; �   T h e   f o l l o w i n g   l i n e s   e n a b l e   K e r b e r o s   s u p p o r t   i f   t h e   u s e r K e r b e r o s   p r o p e r t y   a b o v e   i s   s e t   t o   t r u e .8 <=< l >>��������  ��  ��  = >?> Z  >�@A����@ = >EBCB o  >C���� 0 usekerberos useKerberosC m  CD��
�� boovtrueA Q  H�DEFD k  KmGG HIH r  KXJKJ o  KP���� 0 usekerberos useKerberosK n      LML 1  SW��
�� 
KerbM o  PS���� (0 newexchangeaccount newExchangeAccountI NON r  YdPQP o  Y\���� &0 userkerberosrealm userKerberosRealmQ n      RSR 1  _c��
�� 
ExGIS o  \_���� (0 newexchangeaccount newExchangeAccountO T��T n emUVU I  fm��W���� 0 writelog writeLogW X��X m  fiYY �ZZ P S e t   K e r b e r o s   a u t h e n t i c a t i o n :   S u c c e s s f u l .��  ��  V  f  ef��  E R      ������
�� .ascrerr ****      � ****��  ��  F k  u�[[ \]\ l uu��������  ��  ��  ] ^_^ l uu��`a��  `   something went wrong   a �bb *   s o m e t h i n g   w e n t   w r o n g_ cdc l uu��������  ��  ��  d efe n u}ghg I  v}��i���� 0 writelog writeLogi j��j m  vykk �ll H S e t   K e r b e r o s   a u t h e n t i c a t i o n :   F a i l e d .��  ��  h  f  uvf mnm l ~~��������  ��  ��  n opo I ~���qr
�� .sysodlogaskr        TEXTq b  ~�sts b  ~�uvu b  ~�wxw o  ~����� 0 errormessage errorMessagex o  ����
�� 
ret v o  ����
�� 
ret t m  ��yy �zz ^ U n a b l e   t o   s e t   E x c h a n g e   a c c o u n t   t o   u s e   K e r b e r o s .r ��{|
�� 
disp{ m  ����
�� stic    | ��}~
�� 
btns} J  �� ���� m  ���� ���  O K��  ~ ����
�� 
dflt� J  ���� ���� m  ���� ���  O K��  � �����
�� 
appr� m  ���� ��� , O u t l o o k   E x c h a n g e   S e t u p��  p ��� R  �������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  ����������  � ���� l ����������  ��  ��  ��  ��  ��  ? ��� l ����������  ��  ��  � ��� Q  ������ k  ���� ��� l ��������  � M G The Me Contact record is automatically created with the first account.   � ��� �   T h e   M e   C o n t a c t   r e c o r d   i s   a u t o m a t i c a l l y   c r e a t e d   w i t h   t h e   f i r s t   a c c o u n t .� ��� l ��������  � a [ Set the first name, last name, email address and other information using Active Directory.   � ��� �   S e t   t h e   f i r s t   n a m e ,   l a s t   n a m e ,   e m a i l   a d d r e s s   a n d   o t h e r   i n f o r m a t i o n   u s i n g   A c t i v e   D i r e c t o r y .� ��� l ����������  ��  ��  � ��� r  ����� o  ������ 0 userfirstname userFirstName� n      ��� 1  ����
�� 
pFrN� 1  ����
�� 
meCn� ��� r  ����� o  ������ 0 userlastname userLastName� n      ��� 1  ����
�� 
pLsN� 1  ����
�� 
meCn� ��� r  ����� K  ���� ����
�� 
radd� o  ������ 0 emailaddress emailAddress� �����
�� 
type� m  ����
�� EATyeWrk��  � n      ��� 1  ����
�� 
EmAd� 1  ����
�� 
meCn� ��� r  ���� o  ������  0 userdepartment userDepartment� n      ��� 1  ��
�� 
Dptm� 1  ���
�� 
meCn� ��� r  ��� o  
���� 0 
useroffice 
userOffice� n      ��� 1  ��
�� 
Ofic� 1  
��
�� 
meCn� ��� r  "��� o  ���� 0 usercompany userCompany� n      ��� 1  !��
�� 
Cmpy� 1  ��
�� 
meCn� ��� r  #0��� o  #&���� 0 userworkphone userWorkPhone� n      ��� 1  +/��
�� 
bsNm� 1  &+��
�� 
meCn� ��� r  1>��� o  14���� 0 
usermobile 
userMobile� n      ��� 1  9=��
�� 
mbNm� 1  49��
�� 
meCn� ��� r  ?L��� o  ?B���� 0 userfax userFax� n      ��� 1  GK��
�� 
bFax� 1  BG��
�� 
meCn� ��� r  MZ��� o  MP���� 0 	usertitle 	userTitle� n      ��� 1  UY��
�� 
pTtl� 1  PU��
�� 
meCn� ��� r  [h��� o  [^���� 0 
userstreet 
userStreet� n      ��� 1  cg��
�� 
bStA� 1  ^c��
�� 
meCn� ��� r  iv��� o  il���� 0 usercity userCity� n      ��� 1  qu��
�� 
bCty� 1  lq��
�� 
meCn� ��� r  w���� o  wz�� 0 	userstate 	userState� n      ��� 1  ��~
�~ 
bSta� 1  z�}
�} 
meCn� ��� r  ����� o  ���|�|  0 userpostalcode userPostalCode� n      ��� 1  ���{
�{ 
bZip� 1  ���z
�z 
meCn� ��� r  ��� � o  ���y�y 0 usercountry userCountry  n       1  ���x
�x 
bCou 1  ���w
�w 
meCn�  r  �� o  ���v�v 0 userwebpage userWebPage n       1  ���u
�u 
bsWP 1  ���t
�t 
meCn 	�s	 n ��

 I  ���r�q�r 0 writelog writeLog �p m  �� � X P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   S u c c e s s f u l .�p  �q    f  ���s  � R      �o�n�m
�o .ascrerr ****      � ****�n  �m  � n �� I  ���l�k�l 0 writelog writeLog �j m  �� � P P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   F a i l e d .�j  �k    f  ���  l ���i�h�g�i  �h  �g    l ���f�f   0 * Set Outlook to be the default application    � T   S e t   O u t l o o k   t o   b e   t h e   d e f a u l t   a p p l i c a t i o n  l ���e �e   ( " for mail, calendars and contacts.     �!! D   f o r   m a i l ,   c a l e n d a r s   a n d   c o n t a c t s . "#" l ���d�c�b�d  �c  �b  # $%$ Q  ��&'(& k  ��)) *+* r  ��,-, m  ���a
�a boovtrue- 1  ���`
�` 
pMSD+ ./. r  ��010 m  ���_
�_ boovtrue1 1  ���^
�^ 
pCSD/ 232 r  ��454 m  ���]
�] boovtrue5 1  ���\
�\ 
pABD3 6�[6 n ��787 I  ���Z9�Y�Z 0 writelog writeLog9 :�X: m  ��;; �<< � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   S u c c e s s f u l .�X  �Y  8  f  ���[  ' R      �W�V�U
�W .ascrerr ****      � ****�V  �U  ( n ��=>= I  ���T?�S�T 0 writelog writeLog? @�R@ m  ��AA �BB � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   F a i l e d .�R  �S  >  f  ��% CDC l ���Q�P�O�Q  �P  �O  D EFE I ��NG�M
�N .sysodelanull��� ��� nmbrG m  ���L�L �M  F HIH r  JKJ m  �K
�K boovfalsK 1  
�J
�J 
wkOfI LML l �I�H�G�I  �H  �G  M NON l �FPQ�F  P   We're done.   Q �RR    W e ' r e   d o n e .O S�ES l �D�C�B�D  �C  �B  �E  � m  
TT�                                                                                  OPIM  alis    x  Macintosh HD               � �H+  uO�Microsoft Outlook.app                                           ���Ӆ�        ����  	                Applications    � _      Ӆ[�    uO�  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  ��  ��  � UVU l     �A�@�?�A  �@  �?  V WXW l     �>YZ�>  Y 0 *------------------------------------------   Z �[[ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -X \]\ l     �=^_�=  ^   End account setup   _ �`` $   E n d   a c c o u n t   s e t u p] aba l     �<cd�<  c 0 *------------------------------------------   d �ee T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -b fgf l     �;�:�9�;  �:  �9  g hih l     �8jk�8  j 0 *------------------------------------------   k �ll T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -i mnm l     �7op�7  o   Begin script cleanup   p �qq *   B e g i n   s c r i p t   c l e a n u pn rsr l     �6tu�6  t 0 *------------------------------------------   u �vv T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -s wxw l     �5�4�3�5  �4  �3  x yzy l     �2�1�0�2  �1  �0  z {|{ l 2}�/�.} Q  2~�~ k  "�� ��� I �-��,
�- .sysoexecTEXT���     TEXT� m  �� ��� � / b i n / r m   $ H O M E / L i b r a r y / L a u n c h A g e n t s / n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5 . p l i s t�,  � ��+� I  "�*��)�* 0 writelog writeLog� ��(� m  �� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   S u c c e s s f u l .�(  �)  �+   R      �'�&�%
�' .ascrerr ****      � ****�&  �%  � I  *2�$��#�$ 0 writelog writeLog� ��"� m  +.�� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   F a i l e d .�"  �#  �/  �.  | ��� l     �!� ��!  �   �  � ��� l 3V���� Q  3V���� k  6F�� ��� I 6=���
� .sysoexecTEXT���     TEXT� m  69�� ��� x / b i n / l a u n c h c t l   r e m o v e   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5�  � ��� I  >F���� 0 writelog writeLog� ��� m  ?B�� ��� x U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   S u c c e s s f u l .�  �  �  � R      ���
� .ascrerr ****      � ****�  �  � I  NV���� 0 writelog writeLog� ��� m  OR�� ��� p U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   F a i l e d .�  �  �  �  � ��� l     ����  �  �  � ��� l W]���� I  W]���
� 0 writelog writeLog� ��	� o  XY�
� 
ret �	  �
  �  �  � ��� l ^d���� I  ^d���� 0 writelog writeLog� ��� o  _`�
� 
ret �  �  �  �  � ��� l ek��� � I  ek������� 0 writelog writeLog� ���� o  fg��
�� 
ret ��  ��  �  �   � ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   End script cleanup   � ��� &   E n d   s c r i p t   c l e a n u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin script handlers   � ��� ,   B e g i n   s c r i p t   h a n d l e r s� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� i   ^ a��� I      ������� 0 writelog writeLog� ���� o      ���� 0 
logmessage 
logMessage��  ��  � k     Y�� ��� r     ��� b     	��� l    ������ I    ����
�� .earsffdralis        afdr� m     ��
�� afdrcusr� �����
�� 
rtyp� m    ��
�� 
TEXT��  ��  ��  � m    �� ��� L L i b r a r y : L o g s : O u t l o o k E x c h a n g e S e t u p 5 . l o g� o      ���� 0 logfile logFile� ��� r    !��� b    ��� b    ��� b    ��� n    ��� 1    ��
�� 
shdt� l   ������ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � m    �� ���   � n    ��� 1    ��
�� 
tstr� l    ����  I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � 1    ��
�� 
tab � o      ���� 0 rightnow rightNow�  Z   " 5�� =  " % o   " #���� 0 
logmessage 
logMessage o   # $��
�� 
ret  r   ( +	 o   ( )��
�� 
ret 	 o      ���� 0 loginfo logInfo��   r   . 5

 b   . 3 b   . 1 o   . /���� 0 rightnow rightNow o   / 0���� 0 
logmessage 
logMessage o   1 2��
�� 
ret  o      ���� 0 loginfo logInfo  r   6 B I  6 @��
�� .rdwropenshor       file 4   6 :��
�� 
file o   8 9���� 0 logfile logFile ����
�� 
perm m   ; <��
�� boovtrue��   o      ���� 0 openlogfile openLogFile  I  C P��
�� .rdwrwritnull���     **** o   C D���� 0 loginfo logInfo ��
�� 
refn o   E F���� 0 openlogfile openLogFile ����
�� 
wrat m   G J��
�� rdwreof ��   �� I  Q Y�� ��
�� .rdwrclosnull���     ****  4   Q U��!
�� 
file! o   S T���� 0 logfile logFile��  ��  � "#" l     ��������  ��  ��  # $%$ l     ��&'��  & 0 *------------------------------------------   ' �(( T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -% )*) l     ��+,��  +   End script handlers   , �-- (   E n d   s c r i p t   h a n d l e r s* .��. l     ��/0��  / 0 *------------------------------------------   0 �11 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -��       ��2�� ?���� i�������� ���������c���������������34��  2 ������������������������������������������������������ 0 usekerberos useKerberos��  0 exchangeserver ExchangeServer�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL�� .0 exchangeserversslport ExchangeServerSSLPort�� "0 directoryserver DirectoryServer�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication�� 80 directoryserverrequiresssl DirectoryServerRequiresSSL�� 00 directoryserversslport DirectoryServerSSLPort�� >0 directoryservermaximumresults DirectoryServerMaximumResults�� 60 directoryserversearchbase DirectoryServerSearchBase�� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�� *0 useemailforusername useEmailForUsername�� 0 
domainname 
domainName�� 0 emailformat emailFormat�� 0 displayname displayName�� 0 domainprefix domainPrefix�� (0 verifyemailaddress verifyEMailAddress�� *0 verifyserveraddress verifyServerAddress�� *0 displaydomainprefix displayDomainPrefix�� *0 downloadheadersonly downloadHeadersOnly�� 20 hideonmycomputerfolders hideOnMyComputerFolders�� 0 unifiedinbox unifiedInbox�� (0 enableautodiscover enableAutodiscover�� 0 errormessage errorMessage�� 0 writelog writeLog
�� .aevtoappnull  �   � ****
�� boovtrue
�� boovtrue���
�� boovtrue
�� boovtrue������
�� boovtrue
�� boovfals�� �� 
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovtrue3 �������56��� 0 writelog writeLog�� �~7�~ 7  �}�} 0 
logmessage 
logMessage��  5 �|�{�z�y�x�| 0 
logmessage 
logMessage�{ 0 logfile logFile�z 0 rightnow rightNow�y 0 loginfo logInfo�x 0 openlogfile openLogFile6 �w�v�u�t��s�r��q�p�o�n�m�l�k�j�i�h�g�f
�w afdrcusr
�v 
rtyp
�u 
TEXT
�t .earsffdralis        afdr
�s .misccurdldt    ��� null
�r 
shdt
�q 
tstr
�p 
tab 
�o 
ret 
�n 
file
�m 
perm
�l .rdwropenshor       file
�k 
refn
�j 
wrat
�i rdwreof �h 
�g .rdwrwritnull���     ****
�f .rdwrclosnull���     ****� Z���l �%E�O*j �,�%*j �,%�%E�O��  �E�Y 	��%�%E�O*�/�el E�O���a a  O*�/j 4 �e8�d�c9:�b
�e .aevtoappnull  �   � ****8 k    k;; "<< )== 4>> ]?? d@@ mAA vBB CC �DD �EE �FF �GG �HH �II �JJ �KK �LL �MM �NN OO !PP *QQ 3RR <SS ETT NUU WVV `WW �XX �YY �ZZ �[[ �\\ �]] �^^ �__ �`` �aa �bb �cc �dd �ee �ff �gg hh .ii 5jj >kk Gll Pmm Ynn boo kpp tqq }rr �ss �tt �uu �vv �ww �xx �yy �zz �{{ {|| �}} �~~ � ��a�a  �d  �c  9 �`�` 0 i  :6'�_0�^�]bkt}����������\��[�Z�	(1:CLU^��Y��X��W��V��U��T��S��R��Q��P��O��N��M��L��K�J�I"�H�G�F�E8�D�C�B@�AF�@I�?�>�=�<�;�:^k�9�8�7�6������3N[o���5����#>K_z�������.;Ojw�������4+?Zg{���3�������2�1�0	,�/	E	U	W	�	�	�	�	�	�

=
V
b
�
�
�
�
�.Ngs�������3<ENW`ir{��������T�-�,�+�*68BDU�)]dgl�(�'�&}������%���$�#�"��!� ����������������%+.��Yky��������
�	��������� ����������������;A�����������_ 0 writelog writeLog
�^ 
pnam
�] 
ret �\ @0 getuserinformationfromcentrify getUserInformationFromCentrify�[ R0 'getuserinformationfromenterpriseconnect 'getUserInformationFromEnterpriseConnect
�Z 
bool�Y 0 userfirstname userFirstName�X 0 userlastname userLastName�W  0 userdepartment userDepartment�V 0 
useroffice 
userOffice�U 0 usercompany userCompany�T 0 userworkphone userWorkPhone�S 0 
usermobile 
userMobile�R 0 userfax userFax�Q 0 	usertitle 	userTitle�P 0 
userstreet 
userStreet�O 0 usercity userCity�N 0 	userstate 	userState�M  0 userpostalcode userPostalCode�L 0 usercountry userCountry�K 0 userwebpage userWebPage
�J 
ascr
�I 
txdl
�H .sysoexecTEXT���     TEXT�G "0 userinformation userInformation�F  �E  
�D 
disp
�C stic    
�B 
btns
�A 
dflt
�@ 
appr�? 
�> .sysodlogaskr        TEXT
�= 
errn�<��
�; 
cpar
�: .corecnte****       ****
�9 
citm�8 0 emailaddress emailAddress
�7 
cha 
�6 
TEXT�5 0 usershortname userShortName�4 0 userfullname userFullName�3 &0 userkerberosrealm userKerberosRealm
�2 .sysosigtsirr   ��� null
�1 
sisn
�0 
siln
�/ 
cwor�. 
�- .miscactvnull��� ��� null
�, 
wkOf
�+ 
GrpF
�* 
hOMC
�) 
dtxt�( 
�' 0 verifyemail verifyEmail
�& 
ttxt�% 0 verifyserver verifyServer
�$ 
kocl
�# 
Eact
�" 
prdt
�! 
unme
�  
fnam
� 
emad
� 
host
� 
usss
� 
port
� 
ExLS
� 
LDAu
� 
LDSL
� 
ExLP
� 
LDMX
� 
LDSB
� 
ExPm
� 
pBAD� 
� .corecrel****      � null� (0 newexchangeaccount newExchangeAccount
� 
Kerb
� 
ExGI
� 
meCn
� 
pFrN
� 
pLsN
� 
radd
�
 
type
�	 EATyeWrk
� 
EmAd
� 
Dptm
� 
Ofic
� 
Cmpy
� 
bsNm
� 
mbNm
� 
bFax
� 
pTtl
�  
bStA
�� 
bCty
�� 
bSta
�� 
bZip
�� 
bCou
�� 
bsWP
�� 
pMSD
�� 
pCSD
�� 
pABD�� 
�� .sysodelanull��� ��� nmbr�bl*�k+ O*�)�,%k+ O*�k+ O*�k+ O*�b   %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  	%k+ O*a b  
%k+ O*a _ %k+ O*a _ %k+ O*�k+ Ob  
f 	 _ f a &	 _ f a & G*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*�k+ Y hO*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a  b  %k+ O*a !b  %k+ O*�k+ Oa "E` #Oa $E` %Oa &E` 'Oa (E` )Oa *E` +Oa ,E` -Oa .E` /Oa 0E` 1Oa 2E` 3Oa 4E` 5Oa 6E` 7Oa 8E` 9Oa :E` ;Oa <E` =Oa >E` ?Ob  
e c a @kv_ Aa B,FOa Cj DE` EW AX F Gb  �%�%a H%a Ia Ja Ka Lkva Ma Nkva Oa Pa Q RO)a Sa TlhO{k_ Ea U-j Vkh  a Wkv_ Aa B,FO_ Ea U�/a X L _ Ea U�/a Yl/E` ZW 2X F Ga [kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` ZY hOa ^kv_ Aa B,FO_ Ea U�/a _ L _ Ea U�/a Yl/E` =W 2X F Ga `kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` =Y hOa akv_ Aa B,FO_ Ea U�/a b L _ Ea U�/a Yl/E` +W 2X F Ga ckv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` +Y hOa dkv_ Aa B,FO_ Ea U�/a e L _ Ea U�/a Yl/E` 'W 2X F Ga fkv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` 'Y hOa gkv_ Aa B,FO_ Ea U�/a h L _ Ea U�/a Yl/E` )W 2X F Ga ikv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` )Y hOa jkv_ Aa B,FO_ Ea U�/a k L _ Ea U�/a Yl/E` lW 2X F Ga mkv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` lY hOa nkv_ Aa B,FO_ Ea U�/a o L _ Ea U�/a Yl/E` ?W 2X F Ga pkv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` ?Y hOa qkv_ Aa B,FO_ Ea U�/a r L _ Ea U�/a Yl/E` 7W 2X F Ga skv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` 7Y hOa tkv_ Aa B,FO_ Ea U�/a u L _ Ea U�/a Yl/E` 1W 2X F Ga vkv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` 1Y hOa wkv_ Aa B,FO_ Ea U�/a x L _ Ea U�/a Yl/E` #W 2X F Ga ykv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` #Y hOa zkv_ Aa B,FO_ Ea U�/a { L _ Ea U�/a Yl/E` 3W 2X F Ga |kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` 3Y hOa }kv_ Aa B,FO_ Ea U�/a ~ L _ Ea U�/a Yl/E` %W 2X F Ga kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` %Y hOa �kv_ Aa B,FO_ Ea U�/a � L _ Ea U�/a Yl/E` /W 2X F Ga �kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` /Y hOa �kv_ Aa B,FO_ Ea U�/a � L _ Ea U�/a Yl/E` -W 2X F Ga �kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` -Y hOa �kv_ Aa B,FO_ Ea U�/a � L _ Ea U�/a Yl/E` ;W 2X F Ga �kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` ;Y hOa �kv_ Aa B,FO_ Ea U�/a � L _ Ea U�/a Yl/E` �W 2X F Ga �kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` �Y hOa �kv_ Aa B,FO_ Ea U�/a � L _ Ea U�/a Yl/E` 9W 2X F Ga �kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` 9Y hOa �kv_ Aa B,FO_ Ea U�/a � L _ Ea U�/a Yl/E` 5W 2X F Ga �kv_ Aa B,FO_ Ea U�k/[a \\[Zl\62a ]&E` 5Y hOP[OY��Oa �a �lv_ Aa B,FO _ Ea Yl/E` �W X F GhOa �kv_ Aa B,FO_ Za �  ?b  �%�%a �%a Ia Ja Ka �kva Ma �kva Oa �a Q RO)a Sa TlhY hOPYx_ e  hYlb  k 	 b  k a & s*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yi/E` #O_ �a Yk/a �k/E` %Oa �_ Aa B,FO_ #a �%_ %%a �%b  %E` ZOPY�b  k 	 b  l a & s*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yk/a �k/E` #O_ �a Yi/E` %Oa �_ Aa B,FO_ #a �%_ %%a �%b  %E` ZOPYZb  l 	 b  k a & k*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yi/E` #O_ �a Yk/a �k/E` %Oa �_ Aa B,FO_ #a �%b  %E` ZOPY�b  l 	 b  l a & k*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yk/a �k/E` #O_ �a Yi/E` %Oa �_ Aa B,FO_ #a �%b  %E` ZOPYXb  m 	 b  k a & t*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yi/E` #O_ �a Yk/a �k/E` %Oa �_ Aa B,FO_ #a \k/_ %%a �%b  %E` ZOPY�b  m 	 b  l a & t*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yk/a �k/E` #O_ �a Yi/E` %Oa �_ Aa B,FO_ #a \k/_ %%a �%b  %E` ZOPYDb  a � 	 b  k a & k*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yi/E` #O_ �a Yk/a �k/E` %Oa �_ Aa B,FO_ la �%b  %E` ZOPY �b  a � 	 b  l a & k*j �a �,E` lO*j �a �,E` �Oa �_ Aa B,FO_ �a Yk/a �k/E` #O_ �a Yi/E` %Oa �_ Aa B,FO_ la �%b  %E` ZOPY >b  �%�%a �%a Ia Ja Ka �kva Ma �kva Oa �a Q RO)a Sa TlhOPOb  e  _ ZE` lY hO*a �k+ O*a �_ #%k+ O*a �_ %%k+ O*a �_ Z%k+ O*a �_ '%k+ O*a �_ )%k+ O*a �_ +%k+ O*a �_ -%k+ O*a �_ /%k+ O*a �_ 1%k+ O*a �_ 3%k+ O*a �_ 5%k+ O*a �_ 7%k+ O*a �_ 9%k+ O*a �_ ;%k+ O*a �_ =%k+ O*a �_ ?%k+ O*�k+ Oa ��*j �Oe*a �,FO #b  *a �,FO)a �b  %a �%k+ W X F G)a �b  %a �%k+ O #b  *a �,FO)a �b  %a �%k+ W X F G)a �b  %a �%k+ Ob  e  Ra �a �_ Za Ika Oa �a Ka �a �lva Ma �kva � RE` �O_ �a �,E` ZO)a �_ Z%a �%k+ Y hOb  e  Xa �a �b  a Ika Oa �a Ka �a �lva Ma �kva � RE` �O_ �a �,Ec  O)a �b  %a �%k+ Y hO �*a �a �a ��a �_ �%a �b  _ l%a �_ �a �_ Za �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  	a b  ab  aa �E`O)ak+ W LX F G)ak+ Ob  �%�%a%a Ia Ja Kakva Ma	kva Oa
a Q RO)a Sa TlhOPOb   e  w 'b   _a,FO_ �_a,FO)ak+ W LX F G)ak+ Ob  �%�%a%a Ia Ja Kakva Makva Oaa Q RO)a Sa TlhOPY hO �_ #*a,a,FO_ %*a,a,FOa_ Zaaa �*a,a,FO_ '*a,a,FO_ )*a,a,FO_ +*a,a,FO_ -*a,a,FO_ /*a,a,FO_ 1*a,a,FO_ 3*a,a ,FO_ 5*a,a!,FO_ 7*a,a",FO_ 9*a,a#,FO_ ;*a,a$,FO_ =*a,a%,FO_ ?*a,a&,FO)a'k+ W X F G)a(k+ O %e*a),FOe*a*,FOe*a+,FO)a,k+ W X F G)a-k+ Oa.j/Of*a �,FOPUO a0j DO*a1k+ W X F G*a2k+ O a3j DO*a4k+ W X F G*a5k+ O*�k+ O*�k+ O*�k+  ascr  ��ޭ