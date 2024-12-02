defmodule ElephantCarpacchioWeb.ErrorJSONTest do
  use ElephantCarpacchioWeb.ConnCase, async: true

  test "renders 404" do
    assert ElephantCarpacchioWeb.ErrorJSON.render("404.json", %{}) == %{
             errors: %{detail: "Not Found"}
           }
  end

  test "renders 500" do
    assert ElephantCarpacchioWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
