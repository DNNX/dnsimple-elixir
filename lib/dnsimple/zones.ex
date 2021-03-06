defmodule Dnsimple.Zones do
  @moduledoc """
  This module provides functions to interact with the zone and zone records 
  related endpoints.

  See https://developer.dnsimple.com/v2/zones/
  See https://developer.dnsimple.com/v2/zones/records/
  """

  alias Dnsimple.Client
  alias Dnsimple.Listing
  alias Dnsimple.Response
  alias Dnsimple.Zone
  alias Dnsimple.ZoneRecord

  @doc """
  Returns the zones in the account.

  See: https://developer.dnsimple.com/v2/zones/#list

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.list_zones(client, account_id = 1010)
    Dnsimple.Zones.list_zones(client, account_id = 1010, page: 2, per_page: 10)
    Dnsimple.Zones.list_zones(client, account_id = 1010, sort: "name:desc")
    Dnsimple.Zones.list_zones(client, account_id = 1010, filter: [name_like: ".es"])

  """
  @spec list_zones(Client.t, String.t | integer, Keyword.t) :: Response.t
  def list_zones(client, account_id, options \\ []) do
    url = Client.versioned("/#{account_id}/zones")

    Listing.get(client, url, options)
    |> Response.parse(%{"data" => [%Zone{}], "pagination" => %Response.Pagination{}})
  end

  @spec zones(Client.t, String.t | integer, Keyword.t) :: Response.t
  defdelegate zones(client, account_id, options \\ []), to: __MODULE__, as: :list_zones


  @doc """
  Returns a zone in the account.

  See: https://developer.dnsimple.com/v2/zones/#get

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.get_zone(client, account_id = 1010, zone_id = 12)
    Dnsimple.Zones.get_zone(client, account_id = 1010, zone_id = "example.com")

  """
  @spec get_zone(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  def get_zone(client, account_id, zone_id, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}")

    Client.get(client, url, options)
    |> Response.parse(%{"data" => %Zone{}})
  end

  @spec zone(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  defdelegate zone(client, account_id, zone_id, options \\ []), to: __MODULE__, as: :get_zone


  @doc """
  Returns the zone file of the zone.

  See: https://developer.dnsimple.com/v2/zones/#file

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.get_zone_file(client, account_id = 1010, zone_id = 12)
    Dnsimple.Zones.get_zone_file(client, account_id = 1010, zone_id = "example.com")

  """
  @spec get_zone_file(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  def get_zone_file(client, account_id, zone_id, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}/file")

    Client.get(client, url, options)
    |> Response.parse(%{"data" => %Zone.File{}})
  end

  @spec zone_file(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  defdelegate zone_file(client, account_id, zone_id, options \\ []), to: __MODULE__, as: :get_zone_file


  @doc """
  Returns the records in the zone.

  See: https://developer.dnsimple.com/v2/zones/records/#list

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.list_zone_records(client, account_id = 1010, zone_id = "example.com")
    Dnsimple.Zones.list_zone_records(client, account_id = 1010, zone_id = 12, page: 2, per_page: 10)
    Dnsimple.Zones.list_zone_records(client, account_id = 1010, zone_id = "example.com, sort: "type:asc")
    Dnsimple.Zones.list_zone_records(client, account_id = 1010, zone_id = 12, filter: [type: "A", name: ""])

  """
  @spec list_zone_records(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  def list_zone_records(client, account_id, zone_id, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}/records")

    Listing.get(client, url, options)
    |> Response.parse(%{"data" => [%ZoneRecord{}], "pagination" => %Response.Pagination{}})
  end

  @spec zone_records(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  defdelegate zone_records(client, account_id, zone_id, options \\ []), to: __MODULE__, as: :list_zone_records


  @doc """
  Returns a record of the zone.

  See: https://developer.dnsimple.com/v2/zones/records/#get

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.get_zone_record(client, account_id = 1010, zone_id = 12, record_id = 345)
    Dnsimple.Zones.get_zone_record(client, account_id = 1010, zone_id = "example.com", record_id = 123)

  """
  @spec get_zone_record(Client.t, String.t | integer, String.t | integer, integer, Keyword.t) :: Response.t
  def get_zone_record(client, account_id, zone_id, record_id, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}/records/#{record_id}")

    Client.get(client, url, options)
    |> Response.parse(%{"data" => %ZoneRecord{}})
  end

  @spec zone_record(Client.t, String.t | integer, String.t | integer, integer, Keyword.t) :: Response.t
  defdelegate zone_record(client, account_id, zone_id, record_id, options \\ []), to: __MODULE__, as: :get_zone_record


  @doc """
  Creates a record in the zone.

  See: https://developer.dnsimple.com/v2/zones/records/#create

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.create_zone_record(client, account_id = 1010, zone_id = "example.com", %{
      name: "www",
      type: "CNAME",
      content: "example.com",
      ttl: 3600,
    })

  """
  @spec create_zone_record(Client.t, String.t | integer, String.t | integer, Keyword.t, Keyword.t) :: Response.t
  def create_zone_record(client, account_id, zone_id, attributes, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}/records")

    Client.post(client, url, attributes, options)
    |> Response.parse(%{"data" => %ZoneRecord{}})
  end


  @doc """
  Updates a record of the zone.

  See: https://developer.dnsimple.com/v2/zones/records/#update

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.update_zone_record(client, account_id = 1010, zone_id = "example.com", record_id = 1, %{
      ttl: 600,
    })

  """
  @spec update_zone_record(Client.t, String.t | integer, String.t | integer, integer, Keyword.t, Keyword.t) :: Response.t
  def update_zone_record(client, account_id, zone_id, record_id, attributes, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}/records/#{record_id}")

    Client.patch(client, url, attributes, options)
    |> Response.parse(%{"data" => %ZoneRecord{}})
  end


  @doc """
  Deletes a record from the zone.

  See: https://developer.dnsimple.com/v2/zones/records/#delete

  ## Examples:

    client = %Dnsimple.Client{access_token: "a1b2c3d4"}

    Dnsimple.Zones.delete_zone_record(client, account_id = 1010, zone_id = 12, record_id = 1)
    Dnsimple.Zones.delete_zone_record(client, account_id = 1010, zone_id = "example.com", record_id = 1)

  """
  @spec delete_zone_record(Client.t, String.t, String.t, integer, Keyword.t) :: Response.t
  def delete_zone_record(client, account_id, zone_id, record_id, options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_id}/records/#{record_id}")

    Client.delete(client, url, options)
    |> Response.parse(nil)
  end

end
