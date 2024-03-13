INSERT INTO dbo.QRLLanguage (LANGUAGE_ID, LanguageCode, LanguageName)
VALUES 
(1, 'en', 'English'),
(2, 'es', 'Spanish'),
(3, 'fr', 'French');

SELECT * FROM dbo.QRLLanguage

INSERT INTO dbo.QRLProductCategory (id, CATEGORY_ID, CATEGORY_NAME, CATEGORY_THUMBNAIL_URL)
VALUES 
(1, 101, 'PowerEdge', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/categories/dellPowerEdge.png'),
(2, 102, 'Optiplex Ultra', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Optiplex%20Ultra.jpg'),
(3, 103, 'Networking', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Networking.jpg'),
(4, 104, 'Precision', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Precision.jpg'),
(5, 105, 'Storage', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/categories/dellpowerStorage.png'),
(6, 106, 'HCI', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/HCI.jpg'),
(7, 107, 'Solutions', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Solutions.jpg'),
(8, 108, 'Edge Gateway & Embedded PC', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Edge%20Gateway%20&%20Embedded%20PC.jpg'),
(9, 109, 'PowerScale', 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/categories/dellemcPowerscale.png');
SELECT * FROM dbo.QRLProductCategory


INSERT INTO dbo.QRLProduct (ID, PRODUCT_ID, PRODUCT_DISPLAY_NAME, CATEGORY_ID, PRODUCT_THUMBNAIL_URL, BOOKMARK, HITS)
VALUES 
(1, 1011, 'Metro node mn-114', 101, 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/R640/landingpage/R640.png', NULL, NULL),
(2, 1012, 'Metro node mn-215', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/R750/R750.jpeg', NULL, NULL),
(3, 1013, 'PowerEdge C4130', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C4130/landingpage/C4130.png', NULL, NULL),
(4, 1014, 'PowerEdge C4140', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C4140/landingimage/C4041.JPG', NULL, NULL),
(5, 1015, 'PowerEdge C6220', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C6220/landingpage/20_powerEdgeC6220.png', NULL, NULL),
(6, 1016, 'PowerEdge C6300 Series', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C6320/landingimage/C6320.JPG', NULL, NULL),
(7, 1017, 'PowerEdge C6400', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C6420/landingpage/C6420.JPG', NULL, NULL),
(8, 1018, 'PowerEdge C6420', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C6420/landingpage/C6420.JPG', NULL, NULL),
(9, 1019, 'PowerEdge C6520', 101 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C6520/C6520.jpeg', NULL, NULL),
(10, 1021, '7070 Ultra', 102 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/7070Ultra/7070Ultra.jpg', NULL, NULL),
(11, 1031, 'Brocade G620', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/G620/landingpage/G620.JPG', NULL, NULL),
(12, 1032, 'Force10 MXL', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/MXL/landingpage/powerConnect_MXL.png', NULL, NULL),
(13, 1033, 'Force10 S4810', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/S4810/landingpage/Force10_S4810.png', NULL, NULL),
(14, 1034, 'Force10 S4820T', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/S4820T/landingpage/Force10_S4820T.png', NULL, NULL),
(15, 1035, 'Networking C9010', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/C9010/landingImage_C9010_C1048P.jpg', NULL, NULL),
(16, 1036, 'Networking H-Series', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/H-series/landingimage/H-Series.JPG', NULL, NULL),
(17, 1037, 'Networking N1100', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/N1100/landingpage/N1100.JPG', NULL, NULL),
(18, 1038, 'Networking N1500', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/N1500/landingpage/networking_N1500.png', NULL, NULL),
(19, 1039, 'Networking N2000', 103 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/N2000/landingpage/force10_N2000.png', NULL, NULL),
(20, 1041, 'Canvas', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/canvas/landingpage/canvas.JPG', NULL, NULL),
(21, 1042, 'Precision Rack 7910', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Workstations/R7910/landingpage/R7910.png', NULL, NULL),
(22, 1043, 'Precision Tower 5810', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Workstations/T5810/landingpage/T5810.png', NULL, NULL),
(23, 1044, 'Precision Tower 5820', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/5820/landingpage/5820.JPG', NULL, NULL),
(24, 1045, 'Precision Tower 7810', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Workstations/T7810/landingpage/T7810.png', NULL, NULL),
(25, 1046, 'Precision Tower 7820', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/7820/landingpage/7820.JPG', NULL, NULL),
(26, 1047, 'Precision Tower 7865', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/7865/Precision_7865.JPEG', NULL, NULL),
(27, 1048, 'Precision Tower 7910', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Workstations/T7910/landingpage/T7910.png', NULL, NULL),
(28, 1049, 'Precision Tower 7920', 104 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/7920/landingpage/7920.JPG', NULL, NULL),
(29, 1051, 'EqualLogic FS7600', 105 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/FS7600/LandingImage_FS7600.jpg', NULL, NULL),
(30, 1052, 'EqualLogic FS8600', 105 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/FS8600/LandingImage_FS8600.jpg', NULL, NULL),
(31, 1053, 'NX3240', 105 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/R740/landingpage/R740.JPG', NULL, NULL),
(32, 1054, 'NX3340', 105 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/R640/landingpage/R640.png', NULL, NULL),
(33, 1061, 'Azure Stack HCl', 106 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/R6525/R6525.png', NULL, NULL),
(34, 1062, 'XC XR2', 106 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/R440/landingpage/R440.JPG', NULL, NULL),
(35, 1063, 'XC430', 106 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/XC430/landingpage/xc430.png', NULL, NULL),
(36, 1064, 'XC430 Xpress', 106 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/XC430%20Xpress/landingpage/XC430_Xpress.png', NULL, NULL),
(37, 1065, 'XC630', 106 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/XC630/landingpage/XC630.png', NULL, NULL),
(38, 1071, 'Dell NativeEdge', 107 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/nativeedge/NativeEdge-Illustration-Original.PNG', NULL, NULL),
(39, 1072, 'S5000 Series', 107 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/S5000%20Series/S5000%20Series.png', NULL, NULL),
(40, 1073, 'ScaleIO Ready Node', 107 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/ScaleIO/landingimage/ScaleIO.png', NULL, NULL),
(41, 1081, 'Edge Gateway 5000 Series', 108 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Z5000/landingimage/Z5000.JPG', NULL, NULL),
(42, 1082, 'Edge Gateway 3000 Series', 108 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/Z3000/landingimage/Z3000.JPG', NULL, NULL),
(43, 1083, 'Embedded Box PC 3000 Series', 108 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/PC%203000/landingpage/3000.JPG', NULL, NULL),
(44, 1084, 'Embedded Box PC 5000 Series', 108 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/PC%205000/landingpage/5000.JPG', NULL, NULL),
(45, 1091, 'PowerScale F200', 109 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/F200/F200.jpeg', NULL, NULL),
(46, 1092, 'PowerScale F600', 109 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/F600/F600.jpeg', NULL, NULL),
(47, 1093, 'PowerScale F900', 109 , 'https://qrl.dell.com/qrlfiles/Files/en-us//Images/servers/F900/F900.JPG', NULL, NULL);
SELECT * FROM dbo.QRLProduct

UPDATE dbo.QRLProduct
SET BOOKMARK = NULL
WHERE BOOKMARK IS NOT NULL;




