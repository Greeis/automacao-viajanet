Given("I want a ticket to {string}") do |destination|
    @home_page.access
    @home_page.confirm_round_trip
    @home_page.choose_destination(destination)
end
  
Given("with round trip date") do
    @home_page.confirm_date
    @home_page.nr_passengers('1 adulto','Nenhuma','Nenhum')
    @home_page.confirm_search
    @checkout_window = window_opened_by do
        @search_ticket_page.confirm_ticket
    end
end
  
When("I fill in all the necessary data to buy a reservation") do
    within_window @checkout_window do
        @checkout_page.include_email('graaziele.182@gmail.com')
        @checkout_page.include_passenger(
        'Graziele','Almeida','29/06/1993','Feminino'
        )
        @checkout_page.include_payment(
            'Visa',
            '4929359411371909',
            '10', '2020', '970',
            'Teste da Silva',
            '363.585.290-21'
        )           
        @checkout_page.include_payment_information(     
            '09510101',
            'Rua Manoel Coelho',
            'Centro',
            'São Caetano do Sul',
            'SAO PAULO',
            '600'
        )
        @checkout_page.include_contact(
            'graaziele.182@gmail.com',
            'Casa',
            '1127346278'
        )
    end
end
  
When("I finish my purchase") do
    within_window @checkout_window do
        @checkout_page.accept_checkout
    end
end 
  
Then("I see the status {string}") do |status|
    within_window @checkout_window do
        expect(page).to have_no_content(status)
    end   
end
  