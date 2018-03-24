# Draft

DraftCC is an API that displays a sport's professional players in a json list of objects:

```js
    [ { 
        id: 1,
        name_brief: "Alex A",
        first_name: "Alex", 
        last_name: "Abrines"
        position: "SG",
        age: 24,
        "average_position_age_diff": -2.097609561753
    }, ... ] 
} 
```

The data being persisted is coming from the CBS api and saved in a json file under `app/assets/javascripts`. This was built using Ruby on Rails and PostgreSQL.

### Getting Started

1. Install dependencies by running `bundle install`
2. Create and seed your database by running `bundle exec rails db:create db:migrate db:seed`
3. Start your server by running `bundle exec rails s`
4. Go to `http://localhost:3000/api/:sport_name/` (sport_name currently only works for basketball, baseball, and football)

### Technologies

1. I'm using Ruby on Rails as my backend framework and PostgreSQL as my database.
2. The gems I use are: `better_errors, binding_of_caller, pry-rails, and annotate`


### Architecture

The schema consists of just a Sports table and Players table. The sport_name column is being indexed because I use the name as a wildcard (:sport_name) in the URL which I eventually use to search with.

Players belong to a Sport and therefore it holds the Sport's foreign key. The foreign_key has been indexed. If the Player's table gets too large, the table could be sharded and split horizontally to separate by sport.

Note: I was very torn between this structure and another. The other would have each sport has its table, and thus the Player's table would have a polymorphic association and belong to each of the Baskeball, Baseball, and Football tables. However, I noticed that the only real difference in logic would be the name_brief. I would love some feedback as to whether the name_brief_dictionary is something you would do as well. 

I chose this set-up because any additional sports that need to be added, would be a simple addition to the Sport table, its name brief would be one line in the NAME_BRIEF_DICTIONARY.

Sports
<table>
  <tr>
    <td>id</td>
    <td>sport_name (string)</td>
    <td>average_age (float)</td>
  </tr>
  <tr>
    <td>1</td>
    <td>"Basketball"</td>
    <td>26.097609561753</td>
  </tr>
  <tr>
    <td>2</td>
    <td>"Baseball"</td>
    <td>25.9142705005325</td>
  </tr>
  <tr>
    <td>3</td>
    <td>"Basketball"</td>
    <td>25.8789346246973</td>
  </tr>
</table>

Players
<table>
  <tr>
    <td>id</td>
    <td>first_name (string)</td>
    <td>last_name (string)</td>
    <td>position (string)</td>
    <td>age (integer)</td>
    <td>sport_id (integer)</td>
  </tr>
  <tr>
    <td>303</td>
    <td>"Lebron"</td>
    <td>"James"</td>
    <td>"SF"</td>
    <td>33</td>
    <td>1</td>
  </tr>
</table>