   M S B A M L   `   `   `  ����N  JVerteilerPlanungAPI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:VerteilerPlanungAPIVerteilerPlanungAPI  5   	   %    VerteilerPlanungAPI.HouseDialog   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:VerteilerPlanungAPI     5   	     � Title$  HouseDialog��5   	   $	��320��6   $	��450��6*   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $
��373* �6   �� 5      $	��53* �6   .+�5   
   �� -   5        $��tblZip��5   N   $��23��6   $
��Left=�6    $��	50,60,0,0q�6;   $	��PLZ��6]   $	��Top=�6h   $��67��6�   �� 5   
   -   5        $��tblCity��5   O   $��23��6   $
��Left=�6    $��
50,105,0,0q�6;   $��Stadt��6^   $	��Top=�6k   $��77��6�   �� 5   
   -   5        $��
tblAddress��5   O   $��23��6   $
��Left=�6    $��
50,150,0,0q�6;   $��Addresse��6a   $	��Top=�6q   $��77��6�   �� 5   
   -   5        $��	tblFloors��5   O   $��23��6   $
��Left=�6    $��
50,195,0,0q�6;   $��
Stockwerke��6`   $	��Top=�6r   $��77��6�   �� 5   
   -   5        $��tbZip��5   M   $��23��6   $
��Left=�6   $��
118,60,0,0q�69   $	��Top=�6Z   $	��230��6r   �� 5   
   -   5        $��tbCity��5   N   $��23��6   $
��Left=�6   $��118,105,0,0q�69   $	��Top=�6\   $	��230��6t   �� 5   
   -   5        $��	tbAddress��5   N   $��23��6   $
��Left=�6   $��118,150,0,0q�69   $	��Top=�6_   $	��230��6w   �� 5   
   -   5        $��tbFloors��5   N   $��23��6   $
��Left=�6   $��118,195,0,0q�69   $	��Top=�6^   $��50��6v   �� 5   
   -	   5        $��btnAddHouse��5      $��23��6   $��Haus hinzufügen��60   $��118,240,0,0q�6J   $	��Top=�6_    �� 	IsDefault$
 True��6�   5      5      