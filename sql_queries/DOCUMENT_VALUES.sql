INSERT INTO dbo.QRLDocument (id, PRODUCT_ID, LANGUAGE_ID, DOC_TITLE, DOC_PATH, BOOKMARK, HITS)
VALUES 
(1, 1011, 1, 'A10 Sliding Rail Assembly Guide',  'https://dl.dell.com/manuals/all-products/esuprt_ser_stor_net/esuprt_poweredge/poweredge-r640_setup-guide2_en-us.pdf', NULL, NULL),
(2, 1011, 1, 'CMA Installation Guide', 'https://qrl.dell.com/#/product/overview/1/214/4595', NULL, NULL),
(3, 1011, 1, 'Event and Error Message Reference Guide',  'https://www.dell.com/support/manuals/en-us/poweredge-r640/eemi_pub/introduction?guid=guid-fc1be47d-9da9-4878-babd-02c075feca9a&lang=en-us', NULL, NULL),
(4, 1011, 1, 'Metro node mn-114 Solve Online',  'https://dl.dell.com/manuals/all-products/esuprt_ser_stor_net/esuprt_poweredge/poweredge-r640_setup-guide2_en-us.pdf', NULL, NULL),
(5, 1011, 1, 'PowerEdge R640 Installation and Service Manual', 'https://dl.dell.com/manuals/all-products/esuprt_ser_stor_net/esuprt_poweredge/poweredge-r640_setup-guide2_en-us.pdf', NULL, NULL),
(6, 1011, 1, 'Product End of Life Instructions', 'https://qrl.dell.com/#/product/overview/1/214/1443', NULL, NULL),
(7, 1012, 1, 'CMA Installation Guide', 'https://qrl.dell.com/#/product/overview/1/265/4600', NULL, NUll),
(8, 1012, 1, 'Product End of Life Instructions', 'https://qrl.dell.com/qrlfiles/Files/en-us/Html/common/Product%20End-of-life%20instruction_Power%20Edge%20Servers.pdf', NULL, NUll),
(9, 1012, 1, 'Rail Installation Guide', 'https://qrl.dell.com/#/product/overview/1/265/4601', NULL, NUll),
(10, 1013, 1, 'Best Practices: Keeping Server Firmware Up To Date', 'https://www.dell.com/support/kbdoc/en-us/000128194/updating-firmware-and-drivers-on-dell-emc-poweredge-servers', NULL, NUll),
(11, 1013, 1, 'Getting Started: Servers (PowerEdge 9-14 Generation)', 'https://www.dell.com/support/kbdoc/en-us/000123958/dell-poweredge-server-start-up-guide', NULL, NUll),
(12, 1013, 1, 'Product End of Life Instructions', 'https://qrl.dell.com/#/product/overview/1/70/480', NULL, NUll),
(13, 1014, 1, 'Integrated Dell Remote Access Controller Users Guide', 'https://www.dell.com/support/manuals/en-us/poweredge-c4140/idrac_3.21.21.21_ug/overview?guid=guid-a03c2558-4f39-40c8-88b8-38835d0e9003&lang=en-us', NULL, NUll),
(14, 1014, 1, 'Technical Specifications', 'https://qrl.dell.com/#/product/overview/1/169/1097', NULL, NUll),
(15, 1015, 1, 'Best Practices: Keeping Server Firmware Up To Date', 'https://www.dell.com/support/kbdoc/en-us/000128194/updating-firmware-and-drivers-on-dell-emc-poweredge-servers', NULL, NUll),
(16, 1016, 1, 'Getting Started: Servers (PowerEdge 9-14 Generation)', 'https://www.dell.com/support/kbdoc/en-us/000123958/dell-poweredge-server-start-up-guide', NULL, NUll),
(17, 1021, 1, 'Field Service Manual', 'https://qrl.dell.com/#/product/overview/3/203/1359', NULL, NUll),
(18, 1021, 1, 'Service Manual', 'https://qrl.dell.com/#/product/overview/3/203/1361', NULL, NUll),
(19, 1021, 1, 'Setup and Specifications', 'https://qrl.dell.com/#/product/overview/3/203/1360', NULL, NUll),
(20, 1021, 1, 'Technical Guidebook', 'https://qrl.dell.com/#/product/overview/3/203/1362', NULL, NUll);


select * from dbo.QRLDocument
delete from dbo.QRLDocument