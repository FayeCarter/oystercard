# Oyster card  :bus: :train: 

## User Stories: 
    In order to use public transport
    As a customer
    I want money on my card
    
    In order to keep using public transport
    As a customer
    I want to add money to my card
    
    In order to protect my money
    As a customer
    I don't want to put too much money on my card
    
    In order to pay for my journey
    As a customer
    I need my fare deducted from my card
    
    In order to get through the barriers
    As a customer
    I need to touch in and out
    
    In order to pay for my journey
    As a customer
    I need to have the minimum amount for a single journey
    
    In order to pay for my journey
    As a customer
    I need to pay for my journey when it's complete
    
    In order to pay for my journey
    As a customer
    I need to know where I've travelled from
    
    In order to know where I have been
    As a customer
    I want to see to all my previous trips
    
    In order to know how far I have travelled
    As a customer
    I want to know what zone a station is in
    
    In order to be charged correctly
    As a customer
    I need a penalty charge deducted if I fail to touch in or out
    
    In order to be charged the correct amount
    As a customer
    I need to have the correct fare calculated


## Class


| Card           | additional info          |
| -------------- | ------------------------ |
| @journey       | default =false           |
| @balance       | default (0)              |
| CARD_LIMIT     | 90                       |
| MINIMUM_FUNDS  | 1?                       |
| -------------- | ------------------------ |
| top_up(amount) | amount = number          |
| touch_up       | connects to #travelling? |
| touch_out      | connects to #travelling? |
| travelling?    |                          |
|                |                          |

# Step 13

Objects | Messages
-----------|----------
Oystercard | attr_reader :balance, :entry_station, :journeys <br/> initialize(balance = 0) <br/> top_up(amount) <br/> touch_in(station) <br/> touch_out(station) <br/> in_journey? <br/> *deduct(amount)* <br/> *save_start_journey(station)*
Station    | initialize(name, zone) <br/> attr_reader :zone :name


# Step 14

card = Card.new
>> card
card.top_up(5)
>> 5
card.touch_out("bank")
>> (undefined method `[]=' for nil:NilClass)
Journey doesn't exists yet
>> "bank"
Store the hash of the exit station in the journeys array
It should charge a penalty fee

Objects | Messages
-----------|----------
Oystercard | attr_reader :balance, :journeys <br/> initialize(balance = 0) <br/> top_up(amount) <br/> touch_in(station) <br/> touch_out(station) <br/>  !! in_journey?  !! <br/> *deduct(amount)* <br/> *penalty*
Station    | initialize(name, zone) <br/> attr_reader :zone :name
Journey     | attr_reader :entry_station, :exit_station <br/> finish <br/> fare <br/> complete?

context 1 - User works correctly
journey = Journey.new("Bank", "Bow")

context 2  - User doesn't touch_in

context 3 - User doesn't touch_out

# Working with Phil