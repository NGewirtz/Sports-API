# Sports API

Ruby on Rails API providing JSON data about professional athletes.

## Endpoints

```
/api/basketball
/api/baseball
/api/football
```
All current NBA, MLB, and NFL players
```
/api/players/#{sport}?first=#{firstname}&last=#{lastname}
```
Look up an individual player by sport

### Sample URL

```
/api/players/baseball?first=MIKE&last=TROUT
```

### JSON Response

```
{
  players: [
    {
      id: 970,
      name_brief: "M. T.",
      first_name: "Mike",
      last_name: "Trout",
      position: "CF",
      age: 26,
      average_position_age_diff: "0.94"
    }
  ]
}
```

#### Notes
1. I only imported the relevant columns from the given api. It occurred to me after that another interpretation of the instructions may have been to import all columns, but I didn't think this would have much effect on my overall implementation, so I left that as is.

2. I created a database column, and stored information for name_brief on import. Redundantly I added a method to each sport's class to show both my (simple) approach to the problem, and to see how treating each sport as a sub class of players could allow for easy displaying of the same data in different ways for each sport as desired.

3. Also included are a handful of RSpec tests to provide some baseline assurances that the api was responding to requests as expected.

4. My single player api endpoint is slightly different from the instructions. I name spaced the results of querying by sport and first/last name into a players array, consistent with the other endpoints. Doing search by name could lead to multiple results (Im looking at you Brandon Marshalls) so again I left the project as is when I realized I may have diverged a bit from the instructions.
