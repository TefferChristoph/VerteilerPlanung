   M S B A M L   `   `   `  ����N  JVerteilerPlanungAPI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:VerteilerPlanungAPIVerteilerPlanungAPI  5   	   !    VerteilerPlanungAPI.AddRoom   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:VerteilerPlanungAPI     5   	     � Title$  AddRoom��5   	   $	��250��6   $	��450��6&   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $
��373* �6   �� 5      $	��53* �6   .+�5   
   �� -   5        $��tblRoom��5   N   $��23��6   $
��Left=�6    $��	50,60,0,0q�6;   $��	Raum Name��6^   $	��Top=�6o   $��67��6�   �� 5   
   -   5        $��tblFloor��5   O   $��23��6   $
��Left=�6    $��
50,105,0,0q�6;   $��	Stockwerk��6`   $	��Top=�6q   $��67��6�   �� 5   
   -   5        $��tbRoom��5   M   $��23��6   $
��Left=�6   $��
118,60,0,0q�69   $	��Top=�6[   $	��230��6s   �� 5   
   -   5        $��cbFloors��5      $��23��6   $
��Left=�6/   $��118,105,0,0q�6J   $	��Top=�6_   $	��230��6w   �� 5   
   -   5        $��
btnAddRoom��5      $��23��6   $��Raum hinzufügen��6/   $��118,150,0,0q�6I   $	��Top=�6^   6v   5      5      