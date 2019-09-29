defmodule Moneybear.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string
    timestamps()
  end

  @required_params ~w(email password)a
  @optional_params ~w()a

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_params ++ @optional_params)
    |> validate_required(@required_params)
    |> unique_constraint(:email)
    |> password_update(attrs)
  end

  defp password_update(changeset, %{password: password}), do: put_password(changeset, password)

  defp password_update(changeset, %{"password" => ""}), do: changeset

  defp password_update(changeset, %{"password" => password}),
    do: put_password(changeset, password)

  defp password_update(changeset, _attrs), do: changeset

  defp put_password(changeset, password),
    do: put_change(changeset, :encrypted_password, Bcrypt.hashpwsalt(password))
end
