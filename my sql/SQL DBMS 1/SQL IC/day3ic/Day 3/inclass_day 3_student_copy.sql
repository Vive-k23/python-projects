# Pre-Requisites:
# Step 1 : Create table as below.
/*Product string size 15 ,
Quantity integer ,
Price real,
purchase_cost decimal with size 6,2,
Estimated_sale_price float,
Month integer*/
use bank;
create table Bank_Inventory_pricing
(Product varchar(15 ),
Quantity int ,
Price real,
purchase_cost decimal(6,2),
Estimated_sale_price float,
Month int
);
desc Bank_Inventory_pricing;
# Step2: 
# Insert records for above 
Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 4000.99 , NULL, 3500, 2) ; 
select * from Bank_Inventory_pricing;
# Create table
Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int,
  Estimated_profit Int,   
  month  Int);
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;
select * from Bank_branch_PL;


############################################ Questions ############################################
# Question 1:
# 1) Print sum of Purchase_cost and average of estimated_sale_price of table
# Bank_inventory_pricing  during 2nd month . 
select purchase_cost,Estimated_sale_price,sum(purchase_cost),avg(Estimated_sale_price) from Bank_Inventory_pricing
group by month having month=2;
# Question 2:
# 2) Print average of estimated_sale_price upto two decimals from bank_inventory_pricing table.
select round(avg(Estimated_sale_price),2) from Bank_Inventory_pricing;
# Question 3:
# 3) Print the Products which are appearing in bank_inventory_pricing more than once during the month : 1
select product,count(Product) from Bank_Inventory_pricing where month=1
group by product having count(product)>1;
# Question 4:
# 4) Print Products that are appearing more than once in bank_inventory_pricing and whose purchase_cost is
# greater than  estimated_sale_price , assuming estimated_sale_price is 0 when there is no value given
select Product, count(Product)as sum_of_product from Bank_Inventory_pricing where  purchase_cost > ifnull(Estimated_sale_price,0)
group by product having count(Product)>1;
# Question 5:
# 5) Print the sum of  purchase_cost of Bank_Inventory_pricing table with default value of 2000/-
# if there is no value given
select Purchase_cost, sum(ifnull(Purchase_cost,2000))sum_purchase_cost from Bank_Inventory_pricing;
# Question 6:
# 6) Print unique records of bank_inventory_pricing without displaying the month.
select distinct Product,Quantity,Price,Estimated_sale_price from Bank_Inventory_pricing;
# Question 7:
# 7) print the average of Purchase_cost from the table Bank_inventory_pricing.If the purchase_cost has  no value given
#   then it???s value is equal to estimated_sale_price.
select avg(coalesce(Purchase_cost,Estimated_sale_price))as avg_product_cost from Bank_Inventory_pricing;
# Question 8:
# 8) Print the count of unique Products used in  Bank_inventory_pricing
select distinct count(Product) from Bank_inventory_pricing;
# Question 9:
# 9) Print product and the difference of maximum and minimum purchase_cost of each product in Bank_Inventory_Pricing.
select product, max(Purchase_cost)max,min(Purchase_cost)min,max(Purchase_cost)-min(Purchase_cost)as max_min_diff from Bank_Inventory_Pricing
group by product;

# Question 10:
# 10) Print the sum of Purchase_cost of Bank_inventory_pricing during 1st and 2nd month
select sum(Purchase_cost) from Bank_inventory_pricing
group by month having month in(1,2);
# Question 11:
# 11) Print Products with an average value of Purchase_cost per product only when exceeding average of 6000.
select product,avg(Purchase_cost)avg_pcost from Bank_inventory_pricing
group by Product having avg_pcost>6000;
# Question 12:
# 12) Print  products whose average of purchase_cost is less than sum of purchase_cost of  Bank_inventory_pricing.
select product,avg(Purchase_cost)avg_pcost,sum(Purchase_cost)sum_pcost from Bank_inventory_pricing
group by Product having avg_pcost<sum_pcost;
# Question 13:
# 13) Print product and its average of Estimated_sale_price when  purchase_cost is not mentioned.
select product, avg(ifnull(purchase_cost,Estimated_sale_price)) from Bank_inventory_pricing group by product;
# Question 14:
# 14) Display maximum estimated_sale_price of each product  when the product total quantity is exceeding 4 
# and its purchase_cost has some value given.
select product,Quantity,max(Estimated_sale_price) from Bank_inventory_pricing group by product having Quantity>4;
# Question 15:
# 15) Print products whose average of purchase_cost per product is less than 200
#  from the table Bank_inventory_pricing
select Product, avg(purchase_cost)avg_cost from Bank_inventory_pricing group by Product having avg_cost<200;
# Question 16:
# 16) Print each Product with its highest estimated_sale_price in bank_inventory_pricing
 select product, max(Estimated_sale_price)max_price from Bank_inventory_pricing group by product;
# Question 17:
# 17) Print product with an increase in  average of estimated_sale_price  by 15% when average product_cost is more than average 
# estimated_sale_price
select product,avg(Estimated_sale_price)avg_price,avg(Purchase_cost)avg_cost,avg(Estimated_sale_price)*1.15 from Bank_inventory_pricing
group by product having avg_cost>avg_price;
# Question 18:
# 18) For product = ???BusiCard???,  print average of purchase_cost on condition that when purchase_cost  
# is not given, choose any of the higher value between price  and estimated_sale_price
select product, avg(ifnull(Purchase_cost,if(price>Estimated_sale_price,price,Estimated_sale_price))) from Bank_inventory_pricing 
where Product='BusiCard';
# Question 19:
# 19) Calculate average estimated_sale_price for each product .
# For any null estimated_sale_price, replace the value with purchase_cost
select product, avg(ifnull(Estimated_sale_price,purchase_cost))avg_price from Bank_inventory_pricing
group by product;
# Question 20:
# 20) Print products and their avg price on condition that products appeared in at least three different months.
select product,avg(Price)avg_p,count(distinct Month)mon from Bank_inventory_pricing group by product having Mon>2;