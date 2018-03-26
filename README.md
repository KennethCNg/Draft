# Draft

Draft is an API that displays a sport's professional players in a json list of objects:

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
2. Start your Postgres server
2. Create and seed your database by running `bundle exec rake db:create db:migrate db:seed`
3. Start your server by running `bundle exec rails s`
4. Go to `http://localhost:3000/api/sports/:sport_name/` (ex. http://localhost:3000/api/sports/basketball/)

Note: Currently :sport_name only works for basketball, baseball, or football

### Technologies

1. I'm using Ruby on Rails as my backend framework and PostgreSQL as my database.
2. The gems I use are: `better_errors, binding_of_caller, pry-rails, and annotate`


### Architecture

The schema consists of just a Sports table and Players table. The sport_name column is being indexed because I use the name as a wildcard (:sport_name) in the URL as the search parameter.

Players belong to a Sport and therefore the Players table holds the Sport's foreign key. The foreign_key has been indexed. If the Player's table gets too large, the table could be sharded and split horizontally to separate by sport.

**Notes:** The defining factor between the sports would be the name_brief. I figured a simple concern holding a "name_brief dictionary" would adequately deal with this. My only concern (haha, get it?) would be if the sports table were to grow. The size of the dictionary would scale linearly with the Sports table. Although the actual dictionary's look-up time would still would be O(1), managing a file with thousands of lines of sports would be chaotic. Given this potential issue, I think a reasonable fix would be to split this concern by alphabet. Having 26 concerns such as NameBriefLtrA, NameBriefLtrB (Baskeball and Baseball would go here), etc and nesting them under a folder in the main concern folder called NameBriefConcerns should suffice.

Sports
<table>
  <tr>
    <td>id</td>
    <td>sport_name (string)</td>
  </tr>
  <tr>
    <td>1</td>
    <td>"Basketball"</td>
  </tr>
  <tr>
    <td>2</td>
    <td>"Baseball"</td>
  </tr>
  <tr>
    <td>3</td>
    <td>"Basketball"</td>
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