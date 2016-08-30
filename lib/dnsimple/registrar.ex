defmodule Dnsimple.Registrar do
  alias Dnsimple.Client
  alias Dnsimple.Response
  alias Dnsimple.Domain
  alias Dnsimple.DomainCheck
  alias Dnsimple.WhoisPrivacy

  @doc """
  Checks whether a domain is available to be registered.

  See: https://developer.dnsimple.com/v2/registrar/#check
  """
  @spec check_domain(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def check_domain(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/check")
    {headers, opts} = Client.headers(options)

    Client.get(client, url, headers, opts)
      |> Response.parse(DomainCheck)
  end

  @doc """
  Registers a domain.

  See https://developer.dnsimple.com/v2/registrar/#check
  """
  @spec register_domain(Client.t, String.t, String.t, Keyword.t, Keyword.t) :: Response.t
  def register_domain(client, account_id, domain_name, attributes \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/registration")
    {headers, opts} = Client.headers(options)

    Client.post(client, url, attributes, headers, opts)
      |> Response.parse(Domain)
  end

  @doc """
  Renews a domain.

  See https://developer.dnsimple.com/v2/registrar/#renew
  """
  @spec renew_domain(Client.t, String.t, String.t, Keyword.t, Keyword.t) :: Response.t
  def renew_domain(client, account_id, domain_name, attributes \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/renewal")
    {headers, opts} = Client.headers(options)

    Client.post(client, url, attributes, headers, opts)
      |> Response.parse(Domain)
  end

  @doc """
  Starts the transfer of a domain to DNSimple.

  See https://developer.dnsimple.com/v2/registrar/#transfer
  """
  @spec transfer_domain(Client.t, String.t, String.t, Keyword.t, Keyword.t) :: Response.t
  def transfer_domain(client, account_id, domain_name, attributes \\ [], options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/transfer")
    {headers, opts} = Client.headers(options)

    Client.post(client, url, attributes, headers, opts)
      |> Response.parse(Domain)
  end

  @doc """
  Requests the transfer of a domain out of DNSimple.

  See https://developer.dnsimple.com/v2/registrar/#transfer_out
  """
  @spec transfer_domain_out(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def transfer_domain_out(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/transfer_out")
    {headers, opts} = Client.headers(options)

    Client.post(client, url, _body = [], headers, opts)
      |> Response.parse(nil)
  end


  @doc """
  Enable auto-renewal for the domain.

  See: https://developer.dnsimple.com/v2/registrar/auto-renewal/#enable
  """
  @spec enable_auto_renewal(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def enable_auto_renewal(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/auto_renewal")
    {headers, opts} = Client.headers(options)

    Client.put(client, url, headers, opts)
      |> Response.parse(nil)
  end

  @doc """
  Disable auto-renewal for the domain.

  See: https://developer.dnsimple.com/v2/registrar/auto-renewal/#disable
  """
  @spec disable_auto_renewal(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def disable_auto_renewal(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/auto_renewal")
    {headers, opts} = Client.headers(options)

    Client.delete(client, url, headers, opts)
      |> Response.parse(nil)
  end


  @doc """
  Gets the whois privacy for the domain.

  See: https://developer.dnsimple.com/v2/registrar/whois-privacy/#get
  """
  @spec whois_privacy(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def whois_privacy(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/whois_privacy")
    {headers, opts} = Client.headers(options)

    Client.get(client, url, headers, opts)
      |> Response.parse(WhoisPrivacy)
  end

  @doc """
  Enables the whois privacy for the domain.

  See: https://developer.dnsimple.com/v2/registrar/whois-privacy/#enable
  """
  @spec enable_whois_privacy(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def enable_whois_privacy(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/whois_privacy")
    {headers, opts} = Client.headers(options)

    Client.put(client, url, _body = [], headers, opts)
      |> Response.parse(WhoisPrivacy)
  end

  @doc """
  Disables the whois privacy for the domain.

  See: https://developer.dnsimple.com/v2/registrar/whois-privacy/#disable
  """
  @spec disable_whois_privacy(Client.t, String.t, String.t, Keyword.t) :: Response.t
  def disable_whois_privacy(client, account_id, domain_name, options \\ []) do
    url = Client.versioned("/#{account_id}/registrar/domains/#{domain_name}/whois_privacy")
    {headers, opts} = Client.headers(options)

    Client.delete(client, url, headers, opts)
      |> Response.parse(WhoisPrivacy)
  end


end
