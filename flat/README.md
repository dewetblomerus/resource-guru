The client specs did say Arbitrarily nested Arrays with Numbers.

I could have made the check_input more lenient and let Arrays be duck typed, maybe allowing for flattening of other nested Enumerable Objects, but keeping this more restrictive might help catch an error in another area of our code.

I could have strictly checked that all elements are Numbers, but I decided to keep this flexible so this can be re-used with other elements. If an array should only contain numbers that can be checked somewhere else in the code, keeping this module small and sharp.
