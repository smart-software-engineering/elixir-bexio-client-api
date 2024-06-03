# Bexio API Client for Elixir

This is a simple client for the API described at <https://docs.bexio.com/>. It will support all functionality while also replacing enums with atoms and
making the structs more useful in elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bexio_api_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bexio_api_client, "~> 0.4.1"},
    # if using the default http client:
    {:req, "~> 0.4.11"},
  ]
end
```

## Configuration

TBD

## Changelog

### 0.4.1

* Added Logic fot notes needed for the search

### 0.4.0

* Removing dependency to `tesla`
* Adding `req` as optional dependency
* Adding `req` setup for automatic access_token renewal and retry delay using bexio headers

## Requirements:

The API uses [Tesla](https://github.com/elixir-tesla/tesla) for the client access to also handle the exponential back-off required in the documentation.


## Documentation 

Documentation can be generated with [ExDoc](https://github.com/) 
and can be found at <https://hexdocs.pm/bexio_api_client>.

## Building a release

1. Update the versions in README.md, and mix.exs
2. Actualize the CHANGELOG.md (once present)
3. Run `mix test` and `mix dialyzer`
4. Create a git commit.
5. Create a tag for the new version.
6. Execute `mix hex.publish`
