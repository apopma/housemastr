# Housemastr

This is an API endpoint for housing data; give it query strings beginning with 'min' or 'max' and the app will search its DB for values greater or less than the query string value. The secret sauce is in several ```min_...``` and ```max_...``` methods defined on House, which run the appropriate SQL queries.

Each valid search parameter is interpreted as a method name and invoked (using ```send```) on either the set of all Houses (if no found records yet exist), or the collection of found Houses. There's no option for optional search: every record found must match every specified search parameter.

Results are returned as GeoJSON data of geometry type Point.

*NB:* To improve code readability, I modified the 'lat' and 'lng' headers in the CSV file to 'latitude' and 'longitude'.


## Todos

If this was a real app:
* I'd write a Rake task to parse CSV data from a given filename, instead of dropping the CSV into the 'db' folder and letting ```seeds.rb``` parse from one fixed location and filename.
* I'd extract the actual search methods into a module or delegate class. If I was really clever, I might find a way to write only one or two general 'min search' or 'max search' methods, which would parse the query key's name and extract the appropriate House attribute to search by.
* I'd figure out a way to make only a single SQL query, instead of multiple chained queries, to find the desired records.
* I'd write some tests to make sure everything works the way I expect it to.
* I'd add options for boolean search scoping: maybe you want to search for houses with price < 150,000 AND houses with >2 bathrooms, but you don't mind if you can only find houses that match one or the other of these criteria, but not both. This would save doing multiple API hits.
