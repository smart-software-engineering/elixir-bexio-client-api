defmodule BexioApiClient.SalesOrderManagement.Invoice do
  @moduledoc """
  Quote
  """
  alias BexioApiClient.SalesOrderManagement.PositionText
  alias BexioApiClient.SalesOrderManagement.PositionSubtotal
  alias BexioApiClient.SalesOrderManagement.PositionSubposition
  alias BexioApiClient.SalesOrderManagement.PositionPagebreak
  alias BexioApiClient.SalesOrderManagement.PositionItem
  alias BexioApiClient.SalesOrderManagement.PositionDiscount
  alias BexioApiClient.SalesOrderManagement.PositionDefault

  @typedoc """
  Quote

  ## Fields:

    * `:contact_id` - references a contact object
    * `:contact_sub_id` - references a contact object
    * `:user_id` - references a user object
    * `:project_id` - references a project object
    * `:language_id` - references a language object
    * `:bank_account_id` - references a bank account object
    * `:currency_id` - references a currency object
    * `:payment_type_id` - references a payment type object
    * `:mwst_is_net? ` - this value affects the total if the field mwst_type has been set to `:include`. `false` - taxes are included in the total, `true` - taxes will be added to total
    * `:kb_item_status` is converted from `kb_item_status_id` rest field
    * `:api_reference` - this field can only be read and edited by the api. it can be used to save references to other systems
    * `:template_slug` - references a document template slug
    * `:taxs` - map of percentage as key and absolute values as value
    * `:network_link` - the network link of the quote
  """
  @type t :: %__MODULE__{
          id: integer(),
          document_nr: String.t(),
          title: String.t() | nil,
          contact_id: integer() | nil,
          contact_sub_id: integer() | nil,
          user_id: integer(),
          project_id: integer() | nil,
          language_id: integer(),
          bank_account_id: integer(),
          currency_id: integer(),
          payment_type_id: integer(),
          header: String.t(),
          footer: String.t(),
          total_gross: Decimal.t(),
          total_net: Decimal.t(),
          total_taxes: Decimal.t(),
          total_received_payments: Decimal.t(),
          total_credit_vouchers: Decimal.t(),
          total_remaining_payments: Decimal.t(),
          total: Decimal.t(),
          total_rounding_difference: float(),
          mwst_type: :including | :excluding | :exempt,
          mwst_is_net?: boolean(),
          show_position_taxes?: boolean(),
          is_valid_from: Date.t(),
          is_valid_to: Date.t(),
          contact_address: String.t(),
          kb_item_status: :draft | :pending | :paid | :partial | :cancelled | :unpaid,
          reference: String.t() | nil,
          api_reference: String.t() | nil,
          viewed_by_client_at: NaiveDateTime.t() | nil,
          updated_at: NaiveDateTime.t(),
          esr_id: integer(),
          qr_invoice_id: integer(),
          template_slug: String.t() | nil,
          taxs: list(%{percentage: Decimal.t(), value: Decimal.t()}),
          network_link: String.t() | nil,
          positions:
            list(
              PositionDefault.t()
              | PositionDiscount.t()
              | PositionItem.t()
              | PositionPagebreak.t()
              | PositionSubposition.t()
              | PositionSubtotal.t()
              | PositionText.t()
            )
            | nil
        }
  @enforce_keys [
    :id,
    :document_nr,
    :user_id,
    :language_id,
    :bank_account_id,
    :currency_id,
    :payment_type_id,
    :header,
    :footer,
    :total_gross,
    :total_net,
    :total_taxes,
    :total,
    :total_rounding_difference,
    :mwst_type,
    :mwst_is_net?,
    :show_position_taxes?,
    :is_valid_from,
    :is_valid_to,
    :contact_address,
    :kb_item_status,
    :updated_at,
    :taxs,
    :esr_id,
    :qr_invoice_id
  ]
  defstruct [
    :id,
    :document_nr,
    :title,
    :contact_id,
    :contact_sub_id,
    :user_id,
    :project_id,
    :language_id,
    :bank_account_id,
    :currency_id,
    :payment_type_id,
    :header,
    :footer,
    :total_gross,
    :total_net,
    :total_taxes,
    :total_received_payments,
    :total_credit_vouchers,
    :total_remaining_payments,
    :total,
    :total_rounding_difference,
    :mwst_type,
    :mwst_is_net?,
    :show_position_taxes?,
    :is_valid_from,
    :is_valid_to,
    :contact_address,
    :kb_item_status,
    :reference,
    :api_reference,
    :viewed_by_client_at,
    :updated_at,
    :esr_id,
    :qr_invoice_id,
    :template_slug,
    :taxs,
    :network_link,
    :positions
  ]

  @doc """
  Create a new quote
  """
  @spec new(map()) :: __MODULE__.t()
  def new(attrs \\ %{}) do
    Map.merge(
      %__MODULE__{
        id: nil,
        document_nr: nil,
        contact_id: nil,
        contact_sub_id: nil,
        user_id: nil,
        project_id: nil,
        language_id: nil,
        bank_account_id: nil,
        currency_id: nil,
        payment_type_id: nil,
        header: "",
        footer: "",
        total_gross: Decimal.new(0),
        total_net: Decimal.new(0),
        total_taxes: Decimal.new(0),
        total_received_payments: Decimal.new(0),
        total_credit_vouchers: Decimal.new(0),
        total_remaining_payments: Decimal.new(0),
        total: Decimal.new(0),
        total_rounding_difference: 0.0,
        mwst_type: :including,
        mwst_is_net?: true,
        show_position_taxes?: false,
        is_valid_from: Date.utc_today(),
        is_valid_to: nil,
        contact_address: "",
        kb_item_status: :draft,
        esr_id: nil,
        qr_invoice_id: nil,
        updated_at: NaiveDateTime.local_now(),
        taxs: [],
        positions: []
      },
      attrs
    )
  end
end
