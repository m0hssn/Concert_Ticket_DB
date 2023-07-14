## Database Design

This database consists of 8 tables, each serving a specific purpose. The table structures are as follows:

### Artists Table
The Artists Table allows customers to search for their preferred artist. It has the following attributes:
- `id` - a unique ID for each artist (Primary Key)
- `artist_name` - the name of the artist (e.g., "Pearl Jam", "Black Sabbath", etc)

### Hall Table
The Hall Table contains information about the hall where the concert is being held. It has the following attributes:
- `id` - a unique ID for each hall (Primary Key)
- `hall_name` - the name of the hall (e.g., "Hafez Hall", etc)
- `location` - the address of the hall
- `capacity` - the number of people which are able to fit in the hall

### Concert Table
The Concert Table stores details about the concerts. It has the following attributes:
- `id` - a unique ID for each concert (Primary Key)
- `concert_name` - the name of the concert (e.g., "The Last Hurrah", "1989", etc)
- `artist_id` - the ID of the artist performing (Foreign Key)
- `date` - the date of the concert
- `hall_id` - the ID of the hall where the concert is being held
- `tickets_sold` - the number of tickets that have been sold

### Ticket Category Table
The Ticket Category Table contains information about the different types of tickets. It has the following attributes:
- `id` - a unique ID for each ticket category (Primary Key)
- `description` - a description of the ticket category, which depends on the date of purchase and seat number
- `price` - the price of the ticket category
- `zone` - the zone to which the ticket belongs
- `tickets_available` - the number of tickets available in that category

### Tickets Table
The Tickets Table ensures that non-existing tickets are not sold. It has the following attributes:
- `id` - a unique ID for each ticket (Primary Key)
- `serial_number` - the serial number of the ticket, which is also unique and could be used as an alternative Primary Key
- `concert_id` - references the concert (Foreign Key)
- `ticket_category_id` - the category to which this certain seat belongs to (Foreign Key)
- `seat` - the seat for which the ticket was bought
- `purchase_date` - the date when the ticket was purchased

### Customer Table
The Customer Table stores information about the customers. It has the following attributes:
- `id` - a unique ID for each customer (Primary Key)
- `customer_name` - the full name of the customer
- `email` - the email address of the customer
- `user_name` - the unique username the customer uses
- `password` - the password the customer uses for their account
- `is_student` - a Boolean which checks if the user is a student, to offer them discounts
- `is_elderly` - a Boolean which checks if the user is an elderly, to offer them discounts

### Customer Order Table
The Customer Order Table contains all the data about the orders placed by customers. It has the following attributes:
- `id` - a unique ID for the order (Primary Key)
- `customer_id` - the ID of the customer who placed the order (Foreign Key)
- `order_time` - the time when the order was placed
- `delivery_email_address` - the email address where the customer wants to receive the ticket
- `price` - the total price of tickets ordered
- `discount` - the discount given to the customer if they are elderly or a student
- `final_price` - the price minus the discount

### Order Ticket Table
The Order Ticket Table contains information about the tickets ordered by customers. It has the following attributes:
- `id` - the unique ID of the ticket being ordered (Primary Key)
- `customer_order_id` - references the Customer Order Table (Foreign Key)
- `ticket_id` - references the Tickets Table (Foreign Key)
