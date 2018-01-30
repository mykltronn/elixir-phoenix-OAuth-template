defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do # \\ is defining a default value for params. If nil is ever passed in, it'll pass %{} instead
    # struct is the record of "topics" as it exists now. params are what we want to update it with. cast() takes struct and params and produces the changeset. The change set decribes how we get from where we are (struct) to where we need to be.
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
