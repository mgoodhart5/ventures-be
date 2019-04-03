# Ventures BE

## Endpoints
### Events
#### `GET /api/v1/events`
Returns all the events in the system.
#### Optional Parameters
None at the moment. TBD depending on how we decide with the Front End to handle filtering. 
#### Returned Data Format
```
{
  "data": [
    {
      "id": "1",
      "type": "event",
      "attributes": {
      "name": "Shelf Road Craggin' Classic",
      "city": "Canon Springs",
      "state": "CO",
      "event_type": "climbing",
      "price": 35,
      "start_date": "10-19-2018",
      "end_date": "10-21-2018",
      "description": "This October 19-21, head on down to the best limestone sport cragging Colorado has to offer, and with the American Alpine Club and CAMP USA, and be treated to a weekend of climbing, community, clinics, contests, beer, slideshows, films, giveaways, stewardship and fun.",
      "event_url": "https://americanalpineclub.org/shelf-road-cc",
      "image_url": "https://static1.squarespace.com/static/55830fd9e4b0ec758c892f81/57bc7284f7e0abe0efbb523e/59417dc21b631bad37b19a74/1497464437416/_MG_1604.jpg",
      "video_url": "https://www.youtube.com/embed/Cnjv_Brs2Bo"
      }
    },
    {
      "id": "2",
      "type": "event",
      "attributes": {
      "name": "Crested Butte Bike Week",
      "city": "Crested Butte",
      "state": "CO",
      "event_type": "biking",
      "price": 0,
      "start_date": "06-27-2019",
      "end_date": "06-30-2019",
      "description": "Bike week is a multi-day celebration of all things mountain bike in the Gunnison Valley. We still have the big thigh burner of a singletrack race, the Fat Tire 40, but now CB Bike Week is more of a celebration of how mountain biking defines our community in the summer. Join us for clinics, a film festival, the Chainless Downhill World Championships, good beer, and a great party.",
      "event_url": "http://www.cbchamber.com/chamberevents/cb-bike-week/",
      "image_url": "https://travelcrestedbutte.com/wp-content/uploads/bike-week-feature.jpg",
      "video_url": "https://www.youtube.com/embed/0cFSZCDMP_U"
      }
    }
  ]
}
```

## Installation

### Local Setup

### Running Tests

## Built With: Technologies and Versions
* [Ruby 2.4.5](https://ruby-doc.org/core-2.4.5/)
* [Rails 5.2.2](https://guides.rubyonrails.org/)
* [Fast JSON:API](https://github.com/Netflix/fast_jsonapi)
* [Faraday](https://github.com/lostisland/faraday)
* [Heroku](https://www.heroku.com/)
* [RSpec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara/blob/3.12_stable/README.md)

## Authors
**[Anna Smolentzov](https://github.com/asmolentzov)**

**[Mary Goodhart](https://github.com/mgoodhart5)**

**[Whitney Burton](https://github.com/whitneyburton)**

**[Karin Ohman](https://github.com/kaohman)**

## Acknowledgements
