require 'rails_helper'

describe 'Events API' do
  before(:each) do
    @event_1 = Event.create(name: "Desert Rats Trail Running Festival", city: "Fruita", state: "CO", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    @event_2 = Event.create(name: "FIBArk", city: "Salida", state: "CO", event_type: "rafting", price: 0, start_date: "06-13-2019", end_date: "06-16-2019", description: "America's Oldest Whitewater Festival", event_url: "http://www.fibark.com/", image_url: "http://www.fibark.com/wp-content/uploads/2014/01/sup-race.jpg", video_url: "https://www.youtube.com/embed/BNrYhKYf9OE")
  end
  it 'returns all of the events with attributes' do
    get "/api/v1/events"

    expect(response.status).to eq(200)
    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(results[0]).to have_key(:id)
    expect(results[0][:type]).to eq("event")
    expect(results.length).to eq(2)
    expect(results[0][:attributes][:name]).to eq(@event_1.name)
    expect(results[0][:attributes][:city]).to eq(@event_1.city)
    expect(results[0][:attributes][:state]).to eq(@event_1.state)
    expect(results[0][:attributes][:price]).to eq(@event_1.price)
    expect(results[0][:attributes][:event_type]).to eq(@event_1.event_type)
    expect(results[0][:attributes][:start_date]).to eq(@event_1.start_date)
    expect(results[0][:attributes][:end_date]).to eq(@event_1.end_date)
    expect(results[0][:attributes][:description]).to eq(@event_1.description)
    expect(results[0][:attributes][:event_url]).to eq(@event_1.event_url)
    expect(results[0][:attributes][:image_url]).to eq(@event_1.image_url)
    expect(results[0][:attributes][:video_url]).to eq(@event_1.video_url)
    expect(results[1][:attributes][:name]).to eq(@event_2.name)
  end
end
