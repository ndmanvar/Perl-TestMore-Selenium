# Changes to be made (reference Sauce Account)

```
	export SAUCE_USERNAME=your_username
	export SAUCE_ACCESS_KEY=your_access_key
```

# Installing Dependencies
```
cpan -i Test::More
cpan -i JSON
cpan -i Env
cpan -i Selenium::Remote::Driver
cpan -i LWP::UserAgent
cpan -i HTTP::Request

	*sudo may be necessary
```

# Running the tests
to run: `make run_all_in_parallel`
