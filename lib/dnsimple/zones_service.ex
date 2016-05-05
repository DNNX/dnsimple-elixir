defmodule Dnsimple.ZonesService do
  alias Dnsimple.Client
  alias Dnsimple.Response

  @doc """
  Lists the zones in the account.

  See: https://developer.dnsimple.com/v2/zones/#list
  """
  @spec list_zones(Client.t, String.t, Keyword.t, Keyword.t) :: Response.t
  def list_zones(client, account_id, headers \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/zones")

    Client.get(client, url, headers, options)
      |> Response.parse(Dnsimple.Zone)
  end

  @doc """
  Gets a zone in the account.

  See: https://developer.dnsimple.com/v2/zones/#get
  """
  @spec zone(Client.t, String.t, String.t, Keyword.t, Keyword.t) :: Response.t
  def zone(client, account_id, zone_name, headers \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_name}")

    Client.get(client, url, headers, options)
      |> Response.parse(Dnsimple.Zone)
  end

  @doc """
  Lists the records in a zone.

  See: https://developer.dnsimple.com/v2/zones/records/#list
  """
  @spec list_records(Client.t, String.t, String.t, Keyword.t, Keyword.t) :: Response.t
  def list_records(client, account_id, zone_name, headers \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_name}/records")

    Client.get(client, url, headers, options)
      |> Response.parse(Dnsimple.Record)
  end

  @doc """
  Creates a record in a zone.

  See: https://developer.dnsimple.com/v2/zones/records/#create
  """
  @spec create_record(Client.t, String.t, String.t, Keyword.t, Keyword.t, Keyword.t) :: Response.t
  def create_record(client, account_id, zone_name, attributes, headers \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/zones/#{zone_name}/records")

    Client.post(client, url, attributes, headers, options)
      |> Response.parse(Dnsimple.Record)
  end

end
