class TicketsController < ApplicationController

  PER_PAGE = 25

  def index
    p params
    @page = params['page'] || 1
    
    request_and_handle_error(zendesk_tickets_list_api_url(@page))

    @tickets = @response_body['tickets'] || []
    @next_page = page_url(@page.to_i + 1) if @response_body['next_page']
    @prev_page = page_url(@page.to_i - 1) if @response_body['previous_page']
  end

  def show
    request_and_handle_error(zendesk_ticket_show_api_url(params['id']))
    @ticket = @response_body['ticket'] || {}
  end

  private

    def zendesk_tickets_list_api_url(page)
      "#{BASE_URL}/api/v2/tickets?page=#{@page}&per_page=#{PER_PAGE}"
    end

    def zendesk_ticket_show_api_url(ticket_id)
      "#{BASE_URL}/api/v2/tickets/#{ticket_id}"
    end

    def page_url(page) 
      "/tickets?page=#{page}"
    end
end
