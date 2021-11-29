class TicketsController < ApplicationController

  PER_PAGE = 25

  def index
    @page = params['page'] || 1
    url = URI(zendesk_tickets_list_api_url(@page))
    
    @response_body = JSON.parse(make_request(url).read_body)
    
    @error = if @response_body['error']
    return @error if @error

    @tickets = @response_body['tickets'] 
    @next_page = page_url(@page.to_i + 1) if @response_body['next_page']
    @prev_page = page_url(@page.to_i - 1) if @response_body['previous_page']
  end

  def show
    url = URI(zendesk_ticket_show_api_url(params['id']))
    @ticket = JSON.parse(make_request(url).read_body)['ticket']
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
