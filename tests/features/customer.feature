Feature: Manage Customers
	As a builder of the CRM software client,
	I want to remotely manage customer data through an application programming interface
	So that my application can safely maintain the customer database 
	and delegate checks to a separate service

    Scenario: Create a customer that doesn't exist
        Given Customer[id=99] does not exist in the database
        When I send a request to create Customer[id=99]
        Then I recieve a response code that the request was a success
	And I recieve a details of Customer[id=99] in the response

    Scenario: Attempt to create a customer that already exists
        Given Customer[id=1] exists in the database
        When I send a request to create Customer[id=1]
        Then I recieve a response code that the request was invalid 
	And I recieve a response the Customer[id=1] already exists

    Scenario: Attempt to update a customer that doesn't exist
        Given Customer[id=222] does not exist in the database
        When I send a request to update Customer[id=222]
        Then I recieve a response code that the request was invalid 
	And I recieve a response the Customer[id=222] does not exist

    Scenario: Update a customer that does exist
        Given Customer[id=1] exists in the database
        When I send a request to update Customer[id=1]
        Then I recieve a response code that the request was a success
	And I recieve a response of the detail of the updates made to Customer[id=1]

    Scenario: List customers
	Given Customer[id=1] exists in the database
	And Customer[id=2] exists in the database
	And Customer[id=3] exists in the database
	And the length of customers in the database is 3
        When I send a request to retrieve a list of all customers
	Then I recieve a list response that includes the details of Customer[id=1]
	Then I recieve a list response that includes the details of Customer[id=2]
	Then I recieve a list response that includes the details of Customer[id=3]

    Scenario: Attempt to delete a customer that doensn't exist
        Given Customer[id=222] does not exist in the database
        When I send a request to delete Customer[id=222]
        Then I recieve a response code that the request was invalid 
        And I recieve a response the customer does not exist

    Scenario: Delete a customer that does exist
        Given Customer[id=1] exists in the database
        When I send a request to delete Customer[id=1]
        Then I recieve a response code that the request was a success
