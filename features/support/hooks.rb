Before do
    @home_page = HomePage.new
    @search_ticket_page = SearchTicketPage.new
    @checkout_page = CheckoutPage.new
    page.current_window.resize_to(1440, 900)
end