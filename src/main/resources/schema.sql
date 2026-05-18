create sequence product_id_seq start with 100 increment by 50;

create table products
(
    id          bigint       not null default nextval('product_id_seq'),
    code        varchar(100)  not null unique,
    name        varchar(200) not null,
    image_url   varchar(500),
    description text,
    price       numeric      not null,
    primary key (id)
);

create sequence order_id_seq start with 100 increment by 50;

create table orders
(
    id               bigint       not null default nextval('order_id_seq'),
    order_number     uuid         not null unique,
    customer_name    varchar(200) not null,
    customer_email   varchar(200) not null,
    customer_phone   varchar(50)  not null,
    delivery_address varchar(200) not null,
    status           varchar(50)  not null,
    comments         text,
    created_at       timestamp    not null default now(),
    updated_at       timestamp,
    primary key (id)
);

create sequence order_item_id_seq start with 100 increment by 50;

create table order_items
(
    id            bigint       not null default nextval('order_item_id_seq'),
    order_id      bigint       not null references orders (id),
    product_code  varchar(20)  not null,
    product_name  varchar(200) not null,
    product_price numeric      not null,
    quantity      int          not null,
    primary key (id)
);

DELETE FROM products;

insert into products(code, name, description, image_url, price) values
('P100','The Hunger Games','Winning will make you famous. Losing means certain death...','https://images.gr-assets.com/books/1447303603l/2767052.jpg', 34.0),
('P101','To Kill a Mockingbird','The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it...','https://images.gr-assets.com/books/1361975680l/2657.jpg', 45.40),
('P102','The Chronicles of Narnia','Journeys to the end of the world, fantastic creatures, and epic battles between good and evil—what more could any reader ask for in one book?...','https://images.gr-assets.com/books/1449868701l/11127.jpg', 44.50),
('P103','Gone with the Wind', 'Gone with the Wind is a novel written by Margaret Mitchell, first published in 1936.', 'https://images.gr-assets.com/books/1328025229l/18405.jpg',44.50),
('P104','The Fault in Our Stars','Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis.','https://images.gr-assets.com/books/1360206420l/11870085.jpg',14.50),
('P105','The Giving Tree','Once there was a tree...and she loved a little boy.','https://images.gr-assets.com/books/1174210942l/370493.jpg',32.0),
('P106','The Da Vinci Code','An ingenious code hidden in the works of Leonardo da Vinci.A desperate race through the cathedrals and castles of Europe','https://images.gr-assets.com/books/1303252999l/968.jpg',14.50),
('P107','The Alchemist','Paulo Coelho''s masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure','https://images.gr-assets.com/books/1483412266l/865.jpg',12.0),
('P108','Charlotte''s Web','This beloved book by E. B. White, author of Stuart Little and The Trumpet of the Swan, is a classic of children''s literature','https://images.gr-assets.com/books/1439632243l/24178.jpg',14.0),
('P109','The Little Prince','Moral allegory and spiritual autobiography, The Little Prince is the most translated book in the French language.','https://images.gr-assets.com/books/1367545443l/157993.jpg',16.50),
('P110','A Thousand Splendid Suns','A Thousand Splendid Suns is a breathtaking story set against the volatile events of Afghanistan''s last thirty years—from the Soviet invasion to the reign of the Taliban to post-Taliban rebuilding—that puts the violence, fear, hope, and faith of this country in intimate, human terms.','https://images.gr-assets.com/books/1345958969l/128029.jpg',15.50),
('P111','A Game of Thrones','Here is the first volume in George R. R. Martin’s magnificent cycle of novels that includes A Clash of Kings and A Storm of Swords.','https://images.gr-assets.com/books/1436732693l/13496.jpg',32.0),
('P112','The Book Thief','Nazi Germany. The country is holding its breath. Death has never been busier, and will be busier still.By her brother''s graveside, Liesel''s life is changed when she picks up a single object, partially hidden in the snow.','https://images.gr-assets.com/books/1522157426l/19063.jpg',30.0),
('P113','One Flew Over the Cuckoo''s Nest','Tyrannical Nurse Ratched rules her ward in an Oregon State mental hospital with a strict and unbending routine, unopposed by her patients, who remain cowed by mind-numbing medication and the threat of electric shock therapy.','https://images.gr-assets.com/books/1516211014l/332613.jpg',23.0),
('P114','Fifty Shades of Grey','When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who is beautiful, brilliant, and intimidating.','https://images.gr-assets.com/books/1385207843l/10818853.jpg', 27.0)
;

DELETE FROM order_items;
DELETE FROM orders;

insert into orders(id, order_number, customer_name,customer_email,customer_phone, delivery_address, status, comments, created_at) values
(1, '16f69458-2f65-49ba-8779-bdaeafc7fa70', 'Siva','siva@gmail.com', '9911122233', 'Siva, Hyderabad, India','NEW',null, CURRENT_TIMESTAMP),
(2, '594943a8-d209-40b7-958c-e1efdf72877f', 'John','john@gmail.com', '9911122888', 'Prasad, Hyderabad, India','NEW',null, CURRENT_TIMESTAMP),
(3, '748de59b-a4e7-46f1-94aa-f2faba8bb8c3', 'James','james@gmail.com', '9911122244', 'Ramu, Hyderabad, India','NEW',null, CURRENT_TIMESTAMP),
(4, 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Alice','alice@gmail.com', '9922233344', 'Alice, Mumbai, India','DELIVERED',null, CURRENT_TIMESTAMP),
(5, 'b2c3d4e5-f6a7-8901-bcde-f12345678901', 'Bob','bob@gmail.com', '9933344455', 'Bob, Delhi, India','CANCELLED','Out of stock', CURRENT_TIMESTAMP),
(6, 'c3d4e5f6-a7b8-9012-cdef-123456789012', 'Carol','carol@gmail.com', '9944455566', 'Carol, Bangalore, India','NEW',null, CURRENT_TIMESTAMP),
(7, 'd4e5f6a7-b8c9-0123-defa-234567890123', 'David','david@gmail.com', '9955566677', 'David, Chennai, India','DELIVERED',null, CURRENT_TIMESTAMP),
(8, 'e5f6a7b8-c9d0-1234-efab-345678901234', 'Emma','emma@gmail.com', '9966677788', 'Emma, Pune, India','NEW',null, CURRENT_TIMESTAMP),
(9, 'f6a7b8c9-d0e1-2345-fabc-456789012345', 'Frank','frank@gmail.com', '9977788899', 'Frank, Kolkata, India','CANCELLED','Customer request', CURRENT_TIMESTAMP),
(10, 'a7b8c9d0-e1f2-3456-abcd-567890123456', 'Grace','grace@gmail.com', '9988899900', 'Grace, Ahmedabad, India','DELIVERED',null, CURRENT_TIMESTAMP),
(11, 'b8c9d0e1-f2a3-4567-bcde-678901234567', 'Henry','henry@gmail.com', '9900011122', 'Henry, Jaipur, India','NEW',null, CURRENT_TIMESTAMP),
(12, 'c9d0e1f2-a3b4-5678-cdef-789012345678', 'Irene','irene@gmail.com', '9911100011', 'Irene, Lucknow, India','DELIVERED',null, CURRENT_TIMESTAMP),
(13, 'd0e1f2a3-b4c5-6789-defa-890123456789', 'Jack','jack@gmail.com', '9922200022', 'Jack, Surat, India','NEW',null, CURRENT_TIMESTAMP),
(14, 'e1f2a3b4-c5d6-7890-efab-901234567890', 'Karen','karen@gmail.com', '9933300033', 'Karen, Nagpur, India','CANCELLED','Duplicate order', CURRENT_TIMESTAMP),
(15, 'f2a3b4c5-d6e7-8901-fabc-012345678901', 'Leo','leo@gmail.com', '9944400044', 'Leo, Patna, India','NEW',null, CURRENT_TIMESTAMP),
(16, 'a3b4c5d6-e7f8-9012-abcd-123456789012', 'Mia','mia@gmail.com', '9955500055', 'Mia, Indore, India','DELIVERED',null, CURRENT_TIMESTAMP),
(17, 'b4c5d6e7-f8a9-0123-bcde-234567890123', 'Noah','noah@gmail.com', '9966600066', 'Noah, Bhopal, India','NEW',null, CURRENT_TIMESTAMP),
(18, 'c5d6e7f8-a9b0-1234-cdef-345678901234', 'Olivia','olivia@gmail.com', '9977700077', 'Olivia, Visakhapatnam, India','DELIVERED',null, CURRENT_TIMESTAMP),
(19, 'd6e7f8a9-b0c1-2345-defa-456789012345', 'Paul','paul@gmail.com', '9988800088', 'Paul, Vadodara, India','NEW',null, CURRENT_TIMESTAMP),
(20, 'e7f8a9b0-c1d2-3456-efab-567890123456', 'Quinn','quinn@gmail.com', '9999900099', 'Quinn, Coimbatore, India','CANCELLED','Payment failed', CURRENT_TIMESTAMP),
(21, 'f8a9b0c1-d2e3-4567-fabc-678901234567', 'Rachel','rachel@gmail.com', '9900000100', 'Rachel, Kochi, India','DELIVERED',null, CURRENT_TIMESTAMP),
(22, 'a9b0c1d2-e3f4-5678-abcd-789012345678', 'Sam','sam@gmail.com', '9911100111', 'Sam, Chandigarh, India','NEW',null, CURRENT_TIMESTAMP),
(23, 'b0c1d2e3-f4a5-6789-bcde-890123456789', 'Tina','tina@gmail.com', '9922200222', 'Tina, Guwahati, India','DELIVERED',null, CURRENT_TIMESTAMP)
;

insert into order_items(id, order_id, product_code, product_name, product_price, quantity) values
(1, 1, 'P100', 'The Hunger Games', 34.0, 1),
(2, 2, 'P101', 'To Kill a Mockingbird', 45.40, 3),
(3, 3, 'P102', 'The Chronicles of Narnia', 44.50, 2),
(4, 4, 'P103', 'Harry Potter and the Sorcerer''s Stone', 29.99, 2),
(5, 4, 'P104', 'The Da Vinci Code', 19.99, 1),
(6, 5, 'P105', 'The Alchemist', 15.50, 4),
(7, 6, 'P106', '1984', 12.99, 1),
(8, 6, 'P107', 'Pride and Prejudice', 10.99, 2),
(9, 7, 'P108', 'The Great Gatsby', 14.50, 1),
(10, 8, 'P109', 'Brave New World', 13.75, 3),
(11, 9, 'P110', 'The Catcher in the Rye', 11.99, 2),
(12, 10, 'P111', 'One Hundred Years of Solitude', 18.99, 1),
(13, 10, 'P112', 'The Lord of the Rings', 39.99, 1),
(14, 11, 'P113', 'Animal Farm', 9.99, 5),
(15, 12, 'P114', 'Fahrenheit 451', 12.50, 2),
(16, 12, 'P115', 'The Hobbit', 22.99, 1),
(17, 13, 'P116', 'Dune', 24.99, 1),
(18, 14, 'P117', 'The Hitchhiker''s Guide to the Galaxy', 14.99, 3),
(19, 15, 'P118', 'Ender''s Game', 16.99, 2),
(20, 16, 'P119', 'The Name of the Wind', 17.99, 1),
(21, 16, 'P120', 'A Game of Thrones', 29.99, 2),
(22, 17, 'P121', 'The Way of Kings', 32.99, 1),
(23, 18, 'P122', 'Mistborn: The Final Empire', 19.99, 3),
(24, 19, 'P123', 'The Eye of the World', 21.99, 1),
(25, 19, 'P100', 'The Hunger Games', 34.0, 2),
(26, 20, 'P101', 'To Kill a Mockingbird', 45.40, 1),
(27, 21, 'P124', 'Sapiens: A Brief History of Humankind', 23.99, 2),
(28, 22, 'P125', 'Atomic Habits', 18.99, 1),
(29, 22, 'P126', 'The Pragmatic Programmer', 42.99, 1),
(30, 23, 'P127', 'Clean Code', 38.99, 1)
;