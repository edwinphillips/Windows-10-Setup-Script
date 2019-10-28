﻿Add-Type -AssemblyName "PresentationCore", "PresentationFramework", "WindowsBase"

[xml]$xamlMarkup = @'
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Name="Window" Title="Windows 10 Setup Script" MinHeight="745" MinWidth="1165" Height="745" Width="1165" 
        FontFamily="Calibri" FontSize="14" TextOptions.TextFormattingMode="Display" WindowStartupLocation="CenterScreen" 
        SnapsToDevicePixels="True" ResizeMode="CanResize" 
        ShowInTaskbar="True" Background="{DynamicResource {x:Static SystemColors.WindowBrushKey}}"
        Foreground="{DynamicResource {x:Static SystemColors.WindowTextBrushKey}}">
    <Window.Resources>

        <Style x:Key="HamburgerButton" TargetType="StackPanel">            
            <Setter Property="VerticalAlignment" Value="Center"/>
            <Setter Property="Orientation" Value="Horizontal"/>
            <Setter Property="Height" Value="50"/>
            <Setter Property="Width" Value="50"/>
            <Setter Property="Background" Value="#3F51B5"/>            
        </Style>

        <Style x:Key="PanelHamburgerMenu" TargetType="StackPanel">
            <Setter Property="Orientation" Value="Horizontal"/>
            <Setter Property="Height" Value="55"/>
            <Setter Property="Width" Value="{Binding ElementName=HamburgerMenu, Path=Width}"/>
            <Style.Triggers>
                <Trigger  Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="#2196F3"/>
                </Trigger>
                <Trigger  Property="IsMouseOver" Value="False">
                    <Setter Property="Background" Value="#3F51B5"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <Style x:Key="TextblockHamburgerMenu" TargetType="TextBlock">
            <Setter Property="VerticalAlignment" Value="Center"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
            <Setter Property="FontSize" Value="16"/>
            <Setter Property="Margin" Value="5 0 5 0"/>
            <Setter Property="Opacity" Value="0.5"/>
        </Style>

        <Style x:Key="ViewboxFooter" TargetType="{x:Type Viewbox}">
            <Setter Property="Width" Value="22"/>
            <Setter Property="Height" Value="22"/>
            <Setter Property="VerticalAlignment" Value="Center"/>
            <Setter Property="HorizontalAlignment" Value="Center"/>
            <Setter Property="Margin" Value="5 0 5 0"/>
        </Style>

        <Style x:Key="PanelFooterButtons" TargetType="StackPanel">
            <Setter Property="Orientation" Value="Horizontal"/>
            <Setter Property="VerticalAlignment" Value="Center"/>
            <Setter Property="HorizontalAlignment" Value="Center"/>
            <Style.Triggers>
                <EventTrigger RoutedEvent="MouseDown">
                    <EventTrigger.Actions>
                        <BeginStoryboard>
                            <Storyboard>
                                <ThicknessAnimation  Storyboard.TargetProperty="Margin" Duration="0:0:1" From="0 0 0 0" To="0 0 0 -5" SpeedRatio="5" AutoReverse="True" />
                            </Storyboard>
                        </BeginStoryboard>
                    </EventTrigger.Actions>
                </EventTrigger>
            </Style.Triggers>
        </Style>


    </Window.Resources>

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="50"/>
            <RowDefinition Height="*"/>            
        </Grid.RowDefinitions>

        <!--#region Title Panel-->
        <StackPanel Grid.Row="0" Background="#E4E4E4" Orientation="Horizontal">

            <!--#region Hamburger Button-->
            <StackPanel Name="ButtonHamburger" Style="{StaticResource HamburgerButton}">
                <Viewbox Width="28" Height="28" Margin="11">
                    <Canvas Width="24" Height="24">
                        <Path Data="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z" Fill="#FFFFFF" />
                    </Canvas>
                </Viewbox>
            </StackPanel>
            <!--#endregion Hamburger Button-->

            <!--#region Category Text-->
            <TextBlock Name="TextBlockCategory" Text="Privacy &amp; Telemetry" FontSize="18" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10 0 0 0" />
            <!--#endregion Category Text-->

        </StackPanel>
        <!--#endregion Title Panel-->

        <!--#region Body Panel-->
        <StackPanel Grid.Row="1" Orientation="Horizontal">

            <!--#region Hamburger Panel-->
            <Canvas Name="HamburgerMenu" Width="50" Background="#3F51B5">

                <!--#region Privacy & Telemetry Button-->
                <StackPanel Name="Button_Privacy" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="0">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Privacy" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />                                        
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Privacy" Orientation="Horizontal">
                    <Viewbox Name="Viewbox_Privacy" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                        <Canvas Width="24" Height="24">
                            <Path Data="M18,20V10H6V20H18M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6C4.89,22 4,21.1 4,20V10A2,2 0 0,1 6,8H15V6A3,3 0 0,0 12,3A3,3 0 0,0 9,6H7A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,17A2,2 0 0,1 10,15A2,2 0 0,1 12,13A2,2 0 0,1 14,15A2,2 0 0,1 12,17Z"
                                  Fill="#FFFFFF">
                                <Path.Style>
                                    <Style TargetType="Path">
                                        <Style.Triggers>
                                            <DataTrigger Binding="{Binding ElementName=Button_Privacy, Path=IsMouseOver}" Value="True">
                                                <Setter Property="Opacity" Value="1"/>
                                            </DataTrigger>
                                            <DataTrigger Binding="{Binding ElementName=Button_Privacy, Path=IsMouseOver}" Value="False">
                                                <Setter Property="Opacity" Value="0.5"/>
                                            </DataTrigger>
                                        </Style.Triggers>
                                    </Style>
                                </Path.Style>
                            </Path>
                        </Canvas>
                    </Viewbox>
                    <TextBlock Name="Textblock_Privacy" Text="Privacy &amp; Telemetry">
                        <TextBlock.Style>
                            <Style TargetType="TextBlock">
                                <Setter Property="VerticalAlignment" Value="Center"/>
                                <Setter Property="Foreground" Value="#FFFFFF"/>
                                <Setter Property="FontSize" Value="16"/>
                                <Setter Property="Margin" Value="5 0 5 0"/>
                                <Style.Triggers>
                                    <DataTrigger Binding="{Binding ElementName=Button_Privacy, Path=IsMouseOver}" Value="True">
                                        <Setter Property="Opacity" Value="1"/>
                                    </DataTrigger>
                                    <DataTrigger Binding="{Binding ElementName=Button_Privacy, Path=IsMouseOver}" Value="False">
                                        <Setter Property="Opacity" Value="0.5"/>
                                    </DataTrigger>
                                </Style.Triggers>
                            </Style>
                        </TextBlock.Style>
                    </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion Privacy & Telemetry Button-->

                <!--#region UI & Personalization Button-->
                <StackPanel Name="Button_Ui" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="55">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Ui" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />                                        
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Ui" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_Ui" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M4 4C2.89 4 2 4.89 2 6V18C2 19.11 2.9 20 4 20H12V18H4V8H20V12H22V8C22 6.89 21.1 6 20 6H12L10 4M18 14C17.87 14 17.76 14.09 17.74 14.21L17.55 15.53C17.25 15.66 16.96 15.82 16.7 16L15.46 15.5C15.35 15.5 15.22 15.5 15.15 15.63L14.15 17.36C14.09 17.47 14.11 17.6 14.21 17.68L15.27 18.5C15.25 18.67 15.24 18.83 15.24 19C15.24 19.17 15.25 19.33 15.27 19.5L14.21 20.32C14.12 20.4 14.09 20.53 14.15 20.64L15.15 22.37C15.21 22.5 15.34 22.5 15.46 22.5L16.7 22C16.96 22.18 17.24 22.35 17.55 22.47L17.74 23.79C17.76 23.91 17.86 24 18 24H20C20.11 24 20.22 23.91 20.24 23.79L20.43 22.47C20.73 22.34 21 22.18 21.27 22L22.5 22.5C22.63 22.5 22.76 22.5 22.83 22.37L23.83 20.64C23.89 20.53 23.86 20.4 23.77 20.32L22.7 19.5C22.72 19.33 22.74 19.17 22.74 19C22.74 18.83 22.73 18.67 22.7 18.5L23.76 17.68C23.85 17.6 23.88 17.47 23.82 17.36L22.82 15.63C22.76 15.5 22.63 15.5 22.5 15.5L21.27 16C21 15.82 20.73 15.65 20.42 15.53L20.23 14.21C20.22 14.09 20.11 14 20 14M19 17.5C19.83 17.5 20.5 18.17 20.5 19C20.5 19.83 19.83 20.5 19 20.5C18.16 20.5 17.5 19.83 17.5 19C17.5 18.17 18.17 17.5 19 17.5Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_Ui, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_Ui, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_Ui" Text="UI &amp; Personalization" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_Ui, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_Ui, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion UI & Personalization Button-->

                <!--#region OneDrive Button-->
                <StackPanel Name="Button_OneDrive" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="110">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_OneDrive" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_OneDrive" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_OneDrive" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M19,18H6A4,4 0 0,1 2,14A4,4 0 0,1 6,10H6.71C7.37,7.69 9.5,6 12,6A5.5,5.5 0 0,1 17.5,11.5V12H19A3,3 0 0,1 22,15A3,3 0 0,1 19,18M19.35,10.03C18.67,6.59 15.64,4 12,4C9.11,4 6.6,5.64 5.35,8.03C2.34,8.36 0,10.9 0,14A6,6 0 0,0 6,20H19A5,5 0 0,0 24,15C24,12.36 21.95,10.22 19.35,10.03Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_OneDrive, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_OneDrive, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_OneDrive" Text="OneDrive" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_OneDrive, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_OneDrive, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion OneDrive Button-->

                <!--#region System Button-->
                <StackPanel Name="Button_System" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="165">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_System" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_System" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_System" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M12,8A4,4 0 0,1 16,12A4,4 0 0,1 12,16A4,4 0 0,1 8,12A4,4 0 0,1 12,8M12,10A2,2 0 0,0 10,12A2,2 0 0,0 12,14A2,2 0 0,0 14,12A2,2 0 0,0 12,10M10,22C9.75,22 9.54,21.82 9.5,21.58L9.13,18.93C8.5,18.68 7.96,18.34 7.44,17.94L4.95,18.95C4.73,19.03 4.46,18.95 4.34,18.73L2.34,15.27C2.21,15.05 2.27,14.78 2.46,14.63L4.57,12.97L4.5,12L4.57,11L2.46,9.37C2.27,9.22 2.21,8.95 2.34,8.73L4.34,5.27C4.46,5.05 4.73,4.96 4.95,5.05L7.44,6.05C7.96,5.66 8.5,5.32 9.13,5.07L9.5,2.42C9.54,2.18 9.75,2 10,2H14C14.25,2 14.46,2.18 14.5,2.42L14.87,5.07C15.5,5.32 16.04,5.66 16.56,6.05L19.05,5.05C19.27,4.96 19.54,5.05 19.66,5.27L21.66,8.73C21.79,8.95 21.73,9.22 21.54,9.37L19.43,11L19.5,12L19.43,13L21.54,14.63C21.73,14.78 21.79,15.05 21.66,15.27L19.66,18.73C19.54,18.95 19.27,19.04 19.05,18.95L16.56,17.95C16.04,18.34 15.5,18.68 14.87,18.93L14.5,21.58C14.46,21.82 14.25,22 14,22H10M11.25,4L10.88,6.61C9.68,6.86 8.62,7.5 7.85,8.39L5.44,7.35L4.69,8.65L6.8,10.2C6.4,11.37 6.4,12.64 6.8,13.8L4.68,15.36L5.43,16.66L7.86,15.62C8.63,16.5 9.68,17.14 10.87,17.38L11.24,20H12.76L13.13,17.39C14.32,17.14 15.37,16.5 16.14,15.62L18.57,16.66L19.32,15.36L17.2,13.81C17.6,12.64 17.6,11.37 17.2,10.2L19.31,8.65L18.56,7.35L16.15,8.39C15.38,7.5 14.32,6.86 13.12,6.62L12.75,4H11.25Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_System, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_System, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_System" Text="System" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_System, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_System, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion System Button-->

                <!--#region Start Menu Button-->
                <StackPanel Name="Button_StartMenu" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="220">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_StartMenu" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_StartMenu" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_StartMenu" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M3,12V6.75L9,5.43V11.91L3,12M20,3V11.75L10,11.9V5.21L20,3M3,13L9,13.09V19.9L3,18.75V13M20,13.25V22L10,20.09V13.1L20,13.25Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_StartMenu, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_StartMenu, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_StartMenu" Text="Start Menu" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_StartMenu, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_StartMenu, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion Start Menu Button-->

                <!--#region Microsoft Edge Button-->
                <StackPanel Name="Button_Edge" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="275">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Edge" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Edge" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_Edge" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M2.74,10.81C3.83,-1.36 22.5,-1.36 21.2,13.56H8.61C8.61,17.85 14.42,19.21 19.54,16.31V20.53C13.25,23.88 5,21.43 5,14.09C5,8.58 9.97,6.81 9.97,6.81C9.97,6.81 8.58,8.58 8.54,10.05H15.7C15.7,2.93 5.9,5.57 2.74,10.81Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_Edge, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_Edge, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_Edge" Text="Microsoft Edge" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_Edge, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_Edge, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion Microsoft Edge Button-->

                <!--#region UWP Apps Button-->
                <StackPanel Name="Button_Uwp" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="330">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Uwp" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Uwp" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_Uwp" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M3,13A9,9 0 0,0 12,22A9,9 0 0,0 3,13M5.44,15.44C7.35,16.15 8.85,17.65 9.56,19.56C7.65,18.85 6.15,17.35 5.44,15.44M12,22A9,9 0 0,0 21,13A9,9 0 0,0 12,22M14.42,19.57C15.11,17.64 16.64,16.11 18.57,15.42C17.86,17.34 16.34,18.86 14.42,19.57M12,14A6,6 0 0,0 18,8V3C17.26,3 16.53,3.12 15.84,3.39C15.29,3.62 14.8,3.96 14.39,4.39L12,2L9.61,4.39C9.2,3.96 8.71,3.62 8.16,3.39C7.47,3.12 6.74,3 6,3V8A6,6 0 0,0 12,14M8,5.61L9.57,7.26L12,4.83L14.43,7.26L16,5.61V8A4,4 0 0,1 12,12A4,4 0 0,1 8,8V5.61Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_Uwp, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_Uwp, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_Uwp" Text="UWP Apps" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_Uwp, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_Uwp, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion UWP Apps Button-->

                <!--#region Windows Game Recording Button-->
                <StackPanel Name="Button_Game" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="385">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Game" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Game" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_Game" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M6.43,3.72C6.5,3.66 6.57,3.6 6.62,3.56C8.18,2.55 10,2 12,2C13.88,2 15.64,2.5 17.14,3.42C17.25,3.5 17.54,3.69 17.7,3.88C16.25,2.28 12,5.7 12,5.7C10.5,4.57 9.17,3.8 8.16,3.5C7.31,3.29 6.73,3.5 6.46,3.7M19.34,5.21C19.29,5.16 19.24,5.11 19.2,5.06C18.84,4.66 18.38,4.56 18,4.59C17.61,4.71 15.9,5.32 13.8,7.31C13.8,7.31 16.17,9.61 17.62,11.96C19.07,14.31 19.93,16.16 19.4,18.73C21,16.95 22,14.59 22,12C22,9.38 21,7 19.34,5.21M15.73,12.96C15.08,12.24 14.13,11.21 12.86,9.95C12.59,9.68 12.3,9.4 12,9.1C12,9.1 11.53,9.56 10.93,10.17C10.16,10.94 9.17,11.95 8.61,12.54C7.63,13.59 4.81,16.89 4.65,18.74C4.65,18.74 4,17.28 5.4,13.89C6.3,11.68 9,8.36 10.15,7.28C10.15,7.28 9.12,6.14 7.82,5.35L7.77,5.32C7.14,4.95 6.46,4.66 5.8,4.62C5.13,4.67 4.71,5.16 4.71,5.16C3.03,6.95 2,9.35 2,12A10,10 0 0,0 12,22C14.93,22 17.57,20.74 19.4,18.73C19.4,18.73 19.19,17.4 17.84,15.5C17.53,15.07 16.37,13.69 15.73,12.96Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_Game, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_Game, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_Game" Text="Windows Game Recording" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_Game, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_Game, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion Windows Game Recording Button-->

                <!--#region Scheduled Tasks Button-->
                <StackPanel Name="Button_Tasks" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="440">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Tasks" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Tasks" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_Tasks" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M19,19H5V8H19M19,3H18V1H16V3H8V1H6V3H5C3.89,3 3,3.9 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5A2,2 0 0,0 19,3M16.53,11.06L15.47,10L10.59,14.88L8.47,12.76L7.41,13.82L10.59,17L16.53,11.06Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_Tasks, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_Tasks, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_Tasks" Text="Scheduled Tasks" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_Tasks, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_Tasks, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion Scheduled Tasks Button-->

                <!--#region Microsoft Defender Button-->
                <StackPanel Name="Button_Defender" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="495">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_Defender" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_Defender" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_Defender" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M21,11C21,16.55 17.16,21.74 12,23C6.84,21.74 3,16.55 3,11V5L12,1L21,5V11M12,21C15.75,20 19,15.54 19,11.22V6.3L12,3.18V21Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_Defender, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_Defender, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_Defender" Text="Microsoft Defender" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_Defender, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_Defender, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion Microsoft Defender Button-->

                <!--#region Context Menu Button-->
                <StackPanel Name="Button_ContextMenu" Style="{StaticResource PanelHamburgerMenu}" Canvas.Top="550">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_ContextMenu" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_ContextMenu" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_ContextMenu" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M3,3H9V7H3V3M15,10H21V14H15V10M15,17H21V21H15V17M13,13H7V18H13V20H7L5,20V9H7V11H13V13Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_ContextMenu, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_ContextMenu, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_ContextMenu" Text="Context Menu" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_ContextMenu, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_ContextMenu, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion ContextMenu Button-->                

                <!--#region GitHub Button-->
                <StackPanel Name="Button_GitHub" Style="{StaticResource PanelHamburgerMenu}" Canvas.Bottom="0">
                    <StackPanel.Triggers>
                        <EventTrigger RoutedEvent="MouseDown">
                            <EventTrigger.Actions>
                                <BeginStoryboard>
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Container_GitHub" Storyboard.TargetProperty="Margin" Duration="0:0:0.5" From="0 0 0 0" To="0 5 0 0" SpeedRatio="5" AutoReverse="True" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger.Actions>
                        </EventTrigger>
                    </StackPanel.Triggers>
                    <StackPanel Name="Container_GitHub" Orientation="Horizontal">
                        <Viewbox Name="Viewbox_GitHub" Width="28" Height="28" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="10">
                            <Canvas Width="24" Height="24">
                                <Path Data="M12,2A10,10 0 0,0 2,12C2,16.42 4.87,20.17 8.84,21.5C9.34,21.58 9.5,21.27 9.5,21C9.5,20.77 9.5,20.14 9.5,19.31C6.73,19.91 6.14,17.97 6.14,17.97C5.68,16.81 5.03,16.5 5.03,16.5C4.12,15.88 5.1,15.9 5.1,15.9C6.1,15.97 6.63,16.93 6.63,16.93C7.5,18.45 8.97,18 9.54,17.76C9.63,17.11 9.89,16.67 10.17,16.42C7.95,16.17 5.62,15.31 5.62,11.5C5.62,10.39 6,9.5 6.65,8.79C6.55,8.54 6.2,7.5 6.75,6.15C6.75,6.15 7.59,5.88 9.5,7.17C10.29,6.95 11.15,6.84 12,6.84C12.85,6.84 13.71,6.95 14.5,7.17C16.41,5.88 17.25,6.15 17.25,6.15C17.8,7.5 17.45,8.54 17.35,8.79C18,9.5 18.38,10.39 18.38,11.5C18.38,15.32 16.04,16.16 13.81,16.41C14.17,16.72 14.5,17.33 14.5,18.26C14.5,19.6 14.5,20.68 14.5,21C14.5,21.27 14.66,21.59 15.17,21.5C19.14,20.16 22,16.42 22,12A10,10 0 0,0 12,2Z"
                                  Fill="#FFFFFF">
                                    <Path.Style>
                                        <Style TargetType="Path">
                                            <Style.Triggers>
                                                <DataTrigger Binding="{Binding ElementName=Button_GitHub, Path=IsMouseOver}" Value="True">
                                                    <Setter Property="Opacity" Value="1"/>
                                                </DataTrigger>
                                                <DataTrigger Binding="{Binding ElementName=Button_GitHub, Path=IsMouseOver}" Value="False">
                                                    <Setter Property="Opacity" Value="0.5"/>
                                                </DataTrigger>
                                            </Style.Triggers>
                                        </Style>
                                    </Path.Style>
                                </Path>
                            </Canvas>
                        </Viewbox>
                        <TextBlock Name="Textblock_GitHub" Text="Follow on GitHub" >
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="VerticalAlignment" Value="Center"/>
                                    <Setter Property="Foreground" Value="#FFFFFF"/>
                                    <Setter Property="FontSize" Value="16"/>
                                    <Setter Property="Margin" Value="5 0 5 0"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding ElementName=Button_GitHub, Path=IsMouseOver}" Value="True">
                                            <Setter Property="Opacity" Value="1"/>
                                        </DataTrigger>
                                        <DataTrigger Binding="{Binding ElementName=Button_GitHub, Path=IsMouseOver}" Value="False">
                                            <Setter Property="Opacity" Value="0.5"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                </StackPanel>
                <!--#endregion GitHub Button-->

            </Canvas>
            <!--#endregion Hamburger Panel-->
        </StackPanel>

        <!--#endregion Body Panel-->

        <!--#region Footer Panel-->

        <!--#endregion Footer Panel-->
    </Grid>

</Window>
'@

$xamlGui = [System.Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xamlMarkup))
$xamlMarkup.SelectNodes('//*[@Name]') | ForEach-Object {
    New-Variable -Name $_.Name -Value $xamlGui.FindName($_.Name)

}

#region Script Functions
function Hide-Console {
    <#
    .SYNOPSIS
    Hide Powershell console before show WPF GUI.
    #>

    [CmdletBinding()]
    param ()

    Add-Type -Name Window -Namespace Console -MemberDefinition '
    [DllImport("Kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
    [Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)
}

function Use-HamburgerMenu {
    <#
    .SYNOPSIS
    Show or hide hamburger menu.
    #>

    [CmdletBinding()]
    param ()

    $minWidth = 50
    $maxWidth = 250
    $duration = New-Object System.Windows.Duration([timespan]::FromSeconds(1))
	$widthProperty = New-Object System.Windows.PropertyPath([System.Windows.Controls.Canvas]::WidthProperty)

    if ($HamburgerMenu.ActualWidth -eq $minWidth) {
        $animation = New-Object System.Windows.Media.Animation.DoubleAnimation($minWidth, $maxWidth, $duration)
    }

    else {
        $animation = New-Object System.Windows.Media.Animation.DoubleAnimation($maxWidth, $minWidth, $duration)
    }

    $animation.SpeedRatio ="3"
	$storyboard = New-Object System.Windows.Media.Animation.Storyboard
	[System.Windows.Media.Animation.Storyboard]::SetTargetProperty($animation, $widthProperty)
    $storyboard.Children.Add($animation)
    $storyboard.Begin($HamburgerMenu)	
}

#endregion

#region Controls Events

$ButtonHamburger.Add_MouseLeftButtonDown({
    Use-HamburgerMenu
})

$ButtonHamburger.Add_MouseEnter({

})

$ButtonHamburger.Add_MouseLeave({

})





#endregion

Hide-Console
$Window.ShowDialog() | Out-Null