# Ruby COVID19 API wrapper

Wrapper for [covid19api.com](https://covid19api.com/) (Data sourced from [Johns Hopkins CSSE](https://github.com/CSSEGISandData/COVID-19)).

## Install

`$ gem install covid19-api` or add `covid19-api` to your `Gemfile`.

## Use

Detailed information on each endpoint can be found [here](https://documenter.getpostman.com/view/10808728/SzS8rjbc?version=latest)

Note that case status parameter must be one of either `deaths`, `confirmed`, or `recovered`.

List all the current routes available with detail on each.
```ruby
Covid19.info
```

A summary of new and total cases per country updated daily.
```ruby
Covid19.summary
```

Returns all the available countries and provinces, as well as the country slug for per country requests.
```ruby
Covid19.countries
```

Returns all cases by case type for a country from the first recorded case. Country must be the Slug from `/countries` or `/summary`.
```ruby
Covid19.cases_by_day_one('Ireland', 'confirmed')
```

Returns all cases by case type for a country from the first recorded case with the latest record being the live count. Country must be the Slug from `/countries` or `/summary`.
```ruby
Covid19.cases_by_day_one_live('Ireland', 'confirmed')
```

Returns all cases by case type for a country from the first recorded case.
```ruby
Covid19.cases_by_day_one_total('Ireland', 'confirmed')
```

Returns all cases by case type for a country. Country must be the slug from `/countries` or `/summary`.
```ruby
Covid19.cases_by_country('Ireland', 'confirmed')
```

```ruby
Covid19.cases_by_country_live('Ireland', 'confirmed')
```

Returns all cases by case type for a country. Country must be the slug from `/countries` or `/summary`.
```ruby
Covid19.cases_by_country_total('Ireland', 'confirmed')
```

Returns all live cases by case type for a country. These records are pulled every 10 minutes and are ungrouped. Country must be the slug from `/countries` or `/summary`.
```ruby
Covid19.cases_live_by_country_and_status('Ireland', 'confirmed')
```

Returns all live cases by case type for a country after a given date. These records are pulled every 10 minutes and are ungrouped. Country must be the slug from `/countries` or `/summary`.
```ruby
Covid19.cases_live_by_country_after_date('Ireland', 'confirmed', )
```

Returns all daily data. This call results in 10MB of data being returned and should be used infrequently.
```ruby
Covid19.all
```

```ruby
Covid19.stats
```
