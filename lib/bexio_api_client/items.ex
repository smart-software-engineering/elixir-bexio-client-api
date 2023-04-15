defmodule BexioApiClient.Items do
  @moduledoc """
  Bexio API for the items & products part of the API
  """

  import BexioApiClient.Helpers
  alias BexioApiClient.SearchCriteria

  alias BexioApiClient.Items.{
    Item,
  }

  alias BexioApiClient.GlobalArguments
  import BexioApiClient.GlobalArguments, only: [opts_to_query: 1]

  @doc """
  Fetch a list of items.
  """
  @spec fetch_items(
          client :: Tesla.Client.t(),
          opts :: [GlobalArguments.offset_arg()]
        ) :: {:ok, [Item.t()]} | {:error, any()}
  def fetch_items(client, opts \\ []) do
    bexio_return_handling(
      fn ->
        Tesla.get(client, "/2.0/article", query: opts_to_query(opts))
      end,
      &map_from_articles/1
    )
  end

  @doc """
  Search items via query.
  The following search fields are supported:

  * intern_name
  * intern_code
  """
  @spec search_items(
          client :: Tesla.Client.t(),
          criteria :: list(SearchCriteria.t()),
          opts :: [GlobalArguments.offset_arg()]
        ) :: {:ok, [Item.t()]} | {:error, any()}
  def search_items(
        client,
        criteria,
        opts \\ []
      ) do
    bexio_return_handling(
      fn ->
        Tesla.post(
          client,
          "/2.0/article/search",
          criteria,
          query: opts_to_query(opts)
        )
      end,
      &map_from_articles/1
    )
  end

  defp map_from_articles(articles), do: Enum.map(articles, &map_from_article/1)

  defp map_from_article(
    %{
      "id" => id,
      "user_id" => user_id,
      "article_type_id" => article_type_id,
      "contact_id" => contact_id,      "deliverer_code" => deliverer_code,
      "deliverer_name" => deliverer_name,
      "deliverer_description" => deliverer_description,
      "intern_code" => intern_code,
      "intern_name" => intern_name,
      "intern_description" => intern_description,
      "purchase_price" => purchase_price,
      "sale_price" => sale_price,
      "purchase_total" => purchase_total,
      "sale_total" => sale_total,
      "currency_id" => currency_id,
      "tax_income_id" => tax_income_id,
      "tax_id" => tax_id,
      "tax_expense_id" => tax_expense_id,
      "unit_id" => unit_id,
      "is_stock" => stock?,
      "stock_id" => stock_id,
      "stock_place_id" => stock_place_id,
      "stock_nr" => stock_nr,
      "stock_min_nr" => stock_min_nr,
      "stock_reserved_nr" => stock_reserved_nr,
      "stock_available_nr" => stock_available_nr,
      "stock_picked_nr" => stock_picked_nr,
      "stock_disposed_nr" => stock_disposed_nr,
      "stock_ordered_nr" => stock_ordered_nr,
      "width" => width,
      "height" => height,
      "weight" => weight,
      "volume" => volume,
      "remarks" => remarks,
      "delivery_price" => delivery_price,
      "article_group_id" => article_group_id
    }
  ) do
    %Item{
      id: id,
      user_id: user_id,
      article_type: article_type(article_type_id),
      contact_id: contact_id,
      deliverer_code: deliverer_code,
      deliverer_name: deliverer_name,
      deliverer_description: deliverer_description,
      intern_code: intern_code,
      intern_name: intern_name,
      intern_description: intern_description,
      purchase_price: to_decimal(purchase_price),
      sale_price: to_decimal(sale_price),
      purchase_total: to_decimal(purchase_total),
      sale_total: to_decimal(sale_total),
      currency_id: currency_id,
      tax_income_id: tax_income_id,
      tax_id: tax_id,
      tax_expense_id: tax_expense_id,
      unit_id: unit_id,
      stock?: stock?,
      stock_id: stock_id,
      stock_place_id: stock_place_id,
      stock_nr: stock_nr,
      stock_min_nr: stock_min_nr,
      stock_reserved_nr: stock_reserved_nr,
      stock_available_nr: stock_available_nr,
      stock_picked_nr: stock_picked_nr,
      stock_disposed_nr: stock_disposed_nr,
      stock_ordered_nr: stock_ordered_nr,
      width: width,
      height: height,
      weight: weight,
      volume: volume,
      remarks: remarks,
      delivery_price: to_decimal(delivery_price),
      article_group_id: article_group_id
    }
  end

  defp article_type(1), do: :physical
  defp article_type(2), do: :service
end