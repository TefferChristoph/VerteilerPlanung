﻿#pragma checksum "..\..\..\AddRoom.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "BB00EABBAA730EB4F3C2B5B409C5876670EDB6AC"
//------------------------------------------------------------------------------
// <auto-generated>
//     Dieser Code wurde von einem Tool generiert.
//     Laufzeitversion:4.0.30319.42000
//
//     Änderungen an dieser Datei können falsches Verhalten verursachen und gehen verloren, wenn
//     der Code erneut generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using VerteilerPlanungAPI;


namespace VerteilerPlanungAPI {
    
    
    /// <summary>
    /// AddRoom
    /// </summary>
    public partial class AddRoom : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 14 "..\..\..\AddRoom.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tblRoom;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\..\AddRoom.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tblFloor;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\AddRoom.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbRoom;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\AddRoom.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbFloors;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\..\AddRoom.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnAddRoom;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.2.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/VerteilerPlanungAPI;component/addroom.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\AddRoom.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.2.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.tblRoom = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 2:
            this.tblFloor = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.tbRoom = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.cbFloors = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 5:
            this.btnAddRoom = ((System.Windows.Controls.Button)(target));
            
            #line 20 "..\..\..\AddRoom.xaml"
            this.btnAddRoom.Click += new System.Windows.RoutedEventHandler(this.btnAddRoom_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}
