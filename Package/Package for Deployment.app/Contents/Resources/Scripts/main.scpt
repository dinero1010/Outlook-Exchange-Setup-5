FasdUAS 1.101.10   ��   ��    k             l      ��  ��   --------------------------------------------Outlook Exchange Setup 5
� Copyright 2008-2016 William Smith
bill@officeformachelp.com

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/4.0/

This file accompanies four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.4.1.scpt
2. OutlookExchangeSetupLaunchAgent.sh
3. net.talkingmoose.OutlookExchangeSetupLaunchAgent.plist
4. com.microsoft.Outlook.plist for creating a configuraiton profile

These scripts and files may be freely modified for personal or commercial
purposes but may not be republished for profit without prior consent.

If you find these resources useful or have ideas for improving them,
please let me know. It is only compatible with Outlook 2016 for Mac.--------------------------------------------This script assists administrators with creating an Apple Installer
package for deploying the necessary files for Outlook Exchange Setup 5.

     � 	 	   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  O u t l o o k   E x c h a n g e   S e t u p   5 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 6   W i l l i a m   S m i t h 
 b i l l @ o f f i c e f o r m a c h e l p . c o m 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 T h i s   f i l e   a c c o m p a n i e s   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 4 . 1 . s c p t 
 2 .   O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . s h 
 3 .   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t 
 4 .   c o m . m i c r o s o f t . O u t l o o k . p l i s t   f o r   c r e a t i n g   a   c o n f i g u r a i t o n   p r o f i l e 
 
 T h e s e   s c r i p t s   a n d   f i l e s   m a y   b e   f r e e l y   m o d i f i e d   f o r   p e r s o n a l   o r   c o m m e r c i a l 
 p u r p o s e s   b u t   m a y   n o t   b e   r e p u b l i s h e d   f o r   p r o f i t   w i t h o u t   p r i o r   c o n s e n t . 
 
 I f   y o u   f i n d   t h e s e   r e s o u r c e s   u s e f u l   o r   h a v e   i d e a s   f o r   i m p r o v i n g   t h e m , 
 p l e a s e   l e t   m e   k n o w .   I t   i s   o n l y   c o m p a t i b l e   w i t h   O u t l o o k   2 0 1 6   f o r   M a c .   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   T h i s   s c r i p t   a s s i s t s   a d m i n i s t r a t o r s   w i t h   c r e a t i n g   a n   A p p l e   I n s t a l l e r 
 p a c k a g e   f o r   d e p l o y i n g   t h e   n e c e s s a r y   f i l e s   f o r   O u t l o o k   E x c h a n g e   S e t u p   5 .  
 
   
  
 l     ��������  ��  ��        l     ��  ��    !  prompt for package details     �   6   p r o m p t   f o r   p a c k a g e   d e t a i l s      l    + ����  r     +    n     '    1   # '��
�� 
ttxt  l    # ����  I    #��  
�� .sysodlogaskr        TEXT  m        �   , N a m e   y o u r   i n s t a l l e r . . .  ��  
�� 
dtxt  m       �     0 O u t l o o k   E x c h a n g e   S e t u p   5  �� ! "
�� 
disp ! 4    �� #
�� 
file # l    $���� $ b     % & % l    '���� ' I   �� ( )
�� .earsffdralis        afdr ( m    ��
�� afdrmacs ) �� *��
�� 
rtyp * m    	��
�� 
TEXT��  ��  ��   & m     + + � , , � L i b r a r y : C o r e S e r v i c e s : I n s t a l l e r . a p p : C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s��  ��   " �� - .
�� 
btns - J     / /  0 1 0 m     2 2 � 3 3  C a n c e l 1  4�� 4 m     5 5 � 6 6  N e x t��   . �� 7 8
�� 
dflt 7 J     9 9  :�� : m     ; ; � < <  N e x t��   8 �� =��
�� 
appr = m     > > � ? ? , P a c k a g e   f o r   D e p l o y m e n t��  ��  ��    o      ���� 0 packagename packageName��  ��     @ A @ l     ��������  ��  ��   A  B C B l  , o D���� D r   , o E F E n   , k G H G 1   g k��
�� 
ttxt H l  , g I���� I I  , g�� J K
�� .sysodlogaskr        TEXT J m   , / L L � M M X E n t e r   y o u r   i n s t a l l e r   p a c k a g e ' s   i d e n t i f i e r . . . K �� N O
�� 
dtxt N b   0 ? P Q P b   0 7 R S R m   0 3 T T � U U   n e t . t a l k i n g m o o s e S m   3 6 V V � W W  . Q l  7 > X���� X n   7 > Y Z Y 2   : >��
�� 
cwor Z o   7 :���� 0 packagename packageName��  ��   O �� [ \
�� 
disp [ 4   @ N�� ]
�� 
file ] l  B M ^���� ^ b   B M _ ` _ l  B I a���� a I  B I�� b c
�� .earsffdralis        afdr b m   B C��
�� afdrmacs c �� d��
�� 
rtyp d m   D E��
�� 
TEXT��  ��  ��   ` m   I L e e � f f � L i b r a r y : C o r e S e r v i c e s : I n s t a l l e r . a p p : C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s��  ��   \ �� g h
�� 
btns g J   O W i i  j k j m   O R l l � m m  C a n c e l k  n�� n m   R U o o � p p  N e x t��   h �� q r
�� 
dflt q J   X ] s s  t�� t m   X [ u u � v v  N e x t��   r �� w��
�� 
appr w m   ^ a x x � y y , P a c k a g e   f o r   D e p l o y m e n t��  ��  ��   F o      ���� &0 packageidentifier packageIdentifier��  ��   C  z { z l     ��������  ��  ��   {  | } | l  p � ~���� ~ r   p �  �  n   p � � � � 2   � ���
�� 
cwor � n   p � � � � 1   � ���
�� 
ttxt � l  p � ����� � I  p ��� � �
�� .sysodlogaskr        TEXT � m   p s � � � � � X E n t e r   a   v e r s i o n   n u m b e r   f o r   y o u r   i n s t a l l e r . . . � �� � �
�� 
dtxt � m   t w � � � � � 
 1 . 0 . 0 � �� � �
�� 
disp � 4   x ��� �
�� 
file � l  z � ����� � b   z � � � � l  z � ����� � I  z ��� � �
�� .earsffdralis        afdr � m   z {��
�� afdrmacs � �� ���
�� 
rtyp � m   | }��
�� 
TEXT��  ��  ��   � m   � � � � � � � � L i b r a r y : C o r e S e r v i c e s : I n s t a l l e r . a p p : C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s��  ��   � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � �  C a n c e l �  ��� � m   � � � � � � � 
 B u i l d��   � �� � �
�� 
dflt � J   � � � �  ��� � m   � � � � � � � 
 B u i l d��   � �� ���
�� 
appr � m   � � � � � � � , P a c k a g e   f o r   D e p l o y m e n t��  ��  ��   � o      ����  0 packageversion packageVersion��  ��   }  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   locate the ROOT folder    � � � � .   l o c a t e   t h e   R O O T   f o l d e r �  � � � l  � � ����� � r   � � � � � I  � ��� ���
�� .earsffdralis        afdr �  f   � ���   � o      ���� 0 
mylocation 
myLocation��  ��   �  � � � l     ��������  ��  ��   �  � � � l  � � ����� � O   � � � � � k   � � � �  � � � r   � � � � � b   � � � � � l  � � ����� � c   � � � � � n   � � � � � m   � ���
�� 
ctnr � o   � ����� 0 
mylocation 
myLocation � m   � ���
�� 
TEXT��  ��   � m   � � � � � � � 
 R O O T : � o      ���� 0 
rootfolder 
rootFolder �  ��� � Z   � � � ����� � =  � � � � � l  � � ����� � I  � ��� ���
�� .coredoexbool        obj  � 4   � ��� �
�� 
cfol � o   � ����� 0 
rootfolder 
rootFolder��  ��  ��   � m   � ���
�� boovfals � k   � � � �  � � � r   � � � � � I  � ����� �
�� .sysostflalis    ��� null��   � �� ���
�� 
prmp � m   � � � � � � � n S e l e c t   t h e   R O O T   f o l d e r   c o n t a i n i n g   f i l e s   f o r   d e p l o y m e n t .��   � o      ���� 0 
rootfolder 
rootFolder �  ��� � r   � � � � � c   � � � � � o   � ��� 0 
rootfolder 
rootFolder � m   � ��~
�~ 
TEXT � o      �}�} 0 
rootfolder 
rootFolder��  ��  ��  ��   � m   � � � ��                                                                                  MACS  alis    t  Macintosh HD               � �H+     )
Finder.app                                                      �D��Ř        ����  	                CoreServices    � _      ���       )   (   '  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  � � � l     �|�{�z�|  �{  �z   �  � � � l  �	 ��y�x � r   �	 � � � n   � � � � 1  �w
�w 
psxp � o   ��v�v 0 
rootfolder 
rootFolder � o      �u�u 0 rootpath rootPath�y  �x   �  � � � l 
" ��t�s � O  
" � � � r  ! � � � n   � � � 1  �r
�r 
psxp � l  ��q�p � c   � � � n   � � � m  �o
�o 
ctnr � o  �n�n 0 
mylocation 
myLocation � m  �m
�m 
TEXT�q  �p   � o      �l�l 0 myfolderpath myFolderPath � m  
 � ��                                                                                  MACS  alis    t  Macintosh HD               � �H+     )
Finder.app                                                      �D��Ř        ����  	                CoreServices    � _      ���       )   (   '  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �t  �s   �  � � � l     �k�j�i�k  �j  �i   �    l     �h�h     delete any hidden files    � 0   d e l e t e   a n y   h i d d e n   f i l e s  l #4�g�f r  #4	 c  #0

 b  #. b  #* m  #& �  f i n d   ' o  &)�e�e 0 rootpath rootPath m  *- � 2 '   - n a m e   . D S _ S t o r e   - d e l e t e m  ./�d
�d 
TEXT	 o      �c�c  0 removedsstores removeDSStores�g  �f    l 5<�b�a I 5<�`�_
�` .sysoexecTEXT���     TEXT o  58�^�^  0 removedsstores removeDSStores�_  �b  �a    l     �]�\�[�]  �\  �[    l     �Z�Z     build the package    � $   b u i l d   t h e   p a c k a g e   l =r!�Y�X! r  =r"#" c  =n$%$ b  =l&'& b  =h()( b  =d*+* b  =`,-, b  =\./. b  =X010 b  =T232 b  =P454 b  =L676 b  =H898 b  =D:;: m  =@<< �== . p k g b u i l d   - - i d e n t i f i e r   '; o  @C�W�W &0 packageidentifier packageIdentifier9 m  DG>> �??  '   - - v e r s i o n   '7 o  HK�V�V  0 packageversion packageVersion5 m  LO@@ �AA  '   - - s c r i p t s   '3 o  PS�U�U 0 myfolderpath myFolderPath1 m  TWBB �CC " S c r i p t s '   - - r o o t   '/ o  X[�T�T 0 rootpath rootPath- m  \_DD �EE  '   '+ o  `c�S�S 0 myfolderpath myFolderPath) o  dg�R�R 0 packagename packageName' m  hkFF �GG 
 . p k g '% m  lm�Q
�Q 
TEXT# o      �P�P 0 buildpackage buildPackage�Y  �X    HIH l     �O�N�M�O  �N  �M  I J�LJ l s�K�K�JK Q  s�LMNL k  v�OO PQP r  v�RSR I v}�IT�H
�I .sysoexecTEXT���     TEXTT o  vy�G�G 0 buildpackage buildPackage�H  S o      �F�F 0 theinstaller theInstallerQ UVU I ���EWX
�E .sysodlogaskr        TEXTW m  ��YY �ZZ 0 P a c k a g e   b u i l d   s u c c e e d e d .X �D[\
�D 
disp[ 4  ���C]
�C 
file] l ��^�B�A^ b  ��_`_ l ��a�@�?a I ���>bc
�> .earsffdralis        afdrb m  ���=
�= afdrmacsc �<d�;
�< 
rtypd m  ���:
�: 
TEXT�;  �@  �?  ` m  ��ee �ff � L i b r a r y : C o r e S e r v i c e s : I n s t a l l e r . a p p : C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s�B  �A  \ �9gh
�9 
apprg m  ��ii �jj , P a c k a g e   f o r   D e p l o y m e n th �8kl
�8 
btnsk J  ��mm n�7n m  ��oo �pp  S h o w   P a c k a g e�7  l �6q�5
�6 
dfltq J  ��rr s�4s m  ��tt �uu  S h o w   P a c k a g e�4  �5  V vwv r  ��xyx 4  ���3z
�3 
psxfz l ��{�2�1{ b  ��|}| b  ��~~ o  ���0�0 0 myfolderpath myFolderPath o  ���/�/ 0 packagename packageName} m  ���� ���  . p k g�2  �1  y o      �.�. 0 
thepackage 
thePackagew ��-� O  ����� k  ���� ��� I ���,�+�*
�, .miscactvnull��� ��� obj �+  �*  � ��)� I ���(��'
�( .miscslctnull���    obj � o  ���&�& 0 
thepackage 
thePackage�'  �)  � m  �����                                                                                  MACS  alis    t  Macintosh HD               � �H+     )
Finder.app                                                      �D��Ř        ����  	                CoreServices    � _      ���       )   (   '  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �-  M R      �%�$�#
�% .ascrerr ****      � ****�$  �#  N I ���"��
�" .sysodlogaskr        TEXT� m  ���� ��� � P a c k a g e   b u i l d   f a i l e d .   V e r i f y   R O O T   a n d   S c r i p t s   f o l d e r s   a r e   i n   t h e   s a m e   f o l d e r   a s   t h i s   P a c k a g e   f o r   D e p l o y m e n t   a p p .� �!��
�! 
disp� m  ��� 
�  stic    � ���
� 
appr� m  ���� ��� , P a c k a g e   f o r   D e p l o y m e n t� ���
� 
btns� J  ���� ��� m  ���� ���  O K�  � ���
� 
dflt� J  ���� ��� m  ���� ���  O K�  �  �K  �J  �L       ����  � �
� .aevtoappnull  �   � ****� �������
� .aevtoappnull  �   � ****� k    ���  ��  B��  |��  ���  ���  ���  ��� �� �� �� J��  �  �  �  � R � ������ +� 2 5�
 ;�	 >���� L T V� e l o u x� � � � � � � ��� ��  ��������� �������������<>@BDF����Yeiot���������������������
� 
dtxt
� 
disp
� 
file
� afdrmacs
� 
rtyp
� 
TEXT
� .earsffdralis        afdr
� 
btns
�
 
dflt
�	 
appr� 

� .sysodlogaskr        TEXT
� 
ttxt� 0 packagename packageName
� 
cwor� &0 packageidentifier packageIdentifier�  0 packageversion packageVersion� 0 
mylocation 
myLocation
�  
ctnr�� 0 
rootfolder 
rootFolder
�� 
cfol
�� .coredoexbool        obj 
�� 
prmp
�� .sysostflalis    ��� null
�� 
psxp�� 0 rootpath rootPath�� 0 myfolderpath myFolderPath��  0 removedsstores removeDSStores
�� .sysoexecTEXT���     TEXT�� 0 buildpackage buildPackage�� 0 theinstaller theInstaller�� 
�� 
psxf�� 0 
thepackage 
thePackage
�� .miscactvnull��� ��� obj 
�� .miscslctnull���    obj ��  ��  
�� stic    ������*����l �%/���lv��kv�a a  a ,E` Oa �a a %_ a -%�*����l a %/�a a lv�a kv�a a  a ,E` Oa �a  �*����l a !%/�a "a #lv�a $kv�a %a  a ,a -E` &O)j E` 'Oa ( B_ 'a ),�&a *%E` +O*a ,_ +/j -f  *a .a /l 0E` +O_ +�&E` +Y hUO_ +a 1,E` 2Oa ( _ 'a ),�&a 1,E` 3UOa 4_ 2%a 5%�&E` 6O_ 6j 7Oa 8_ %a 9%_ &%a :%_ 3%a ;%_ 2%a <%_ 3%_ %a =%�&E` >O c_ >j 7E` ?Oa @�*����l a A%/�a B�a Ckv�a Dkva E O*a F_ 3_ %a G%/E` HOa ( *j IO_ Hj JUW $X K La M�a N�a O�a Pkv�a Qkva E  ascr  ��ޭ