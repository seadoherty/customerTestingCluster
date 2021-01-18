Feature: Manage Customers

    Feature Description: Manage the customer

    Scenario: Create a customer that doesn't exist
        Given Customer [id=99] does not exist in the database
        When I send requests to create customer [id=99]
        Then I recieve a response that a customer creation was a success
        And I recieve a response of the detail of my newly created customer
    Scenario: Attempt to create a customer that already exists
        Given Customer [id=1] exists in the database
        When I send requests to create customer [id=1]
        Then I recieve a response that a customer creation was unsuccessful
        And I recieve a response the customer already exists
    Scenario: Attempt to update a customer that doesn't exist
        Given Customer [id=222] does not exist in the database
        When I send requests to update customer [id=222]
        Then I recieve a response that a customer update was unsuccessful
        And I recieve a response the customer does not exist
    Scenario: Update a customer that does exist
        Given Customer [id=1] exists in the database
        When I send requests to update customer [id=1]
        Then I recieve a response that a customer update was a success
        And I recieve a response of the detail of the updates made to the customer
    Scenario: List customers
        Given Customers exist in the database
        When I send requests to retrieve a list of all customers
        Then I recieve a response of all the details of all the customers in the database
    Scenario: Attempt to delete a customer that doensn't exist
        Given Customer [id=222] does not exist in the database
        When I send requests to delete customer [id=222]
        Then I recieve a response that a customer deletion was unsuccessful
        And I recieve a response the customer does not exist
    Scenario: Delete a customer that does exist
        Given Customer [id=1] exists in the database
        When I send requests to delete customer [id=1]
        Then I recieve a response that a customer deletion was a success