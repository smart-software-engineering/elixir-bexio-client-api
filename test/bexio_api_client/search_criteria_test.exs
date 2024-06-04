defmodule BexioApiClient.SearchCriteriaTest do
  use ExUnit.Case, async: true
  doctest BexioApiClient.SearchCriteria

  import BexioApiClient.SearchCriteria

  describe "search criteria helper " do
    test "equal will generate search criteria" do
      sc = equal(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :=
      assert sc.value == "fred"
    end

    test "not_equal will generate search criteria" do
      sc = not_equal(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :!=
      assert sc.value == "fred"
    end

    test "greater_than will generate search criteria" do
      sc = greater_than(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :>
      assert sc.value == "fred"
    end

    test "less_than will generate search criteria" do
      sc = less_than(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :<
      assert sc.value == "fred"
    end

    test "greater_equal will generate search criteria" do
      sc = greater_equal(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :>=
      assert sc.value == "fred"
    end

    test "less_equal will generate search criteria" do
      sc = less_equal(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :<=
      assert sc.value == "fred"
    end

    test "like will generate search criteria" do
      sc = like(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :like
      assert sc.value == "fred"
    end

    test "not_like will generate search criteria" do
      sc = not_like(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :not_like
      assert sc.value == "fred"
    end

    test "part_of will generate search criteria" do
      sc = part_of(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :in
      assert sc.value == "fred"
    end

    test "not_part_of will generate search criteria" do
      sc = not_part_of(:name, "fred")

      assert sc.field == :name
      assert sc.criteria == :not_in
      assert sc.value == "fred"
    end

    test "nil? will generate search criteria" do
      sc = nil?(:name)

      assert sc.field == :name
      assert sc.criteria == :is_null
      assert sc.value == nil
    end

    test "not_nil? will generate search criteria" do
      sc = not_nil?(:name)

      assert sc.field == :name
      assert sc.criteria == :not_null
      assert sc.value == nil
    end
  end

  describe "sigils " do
    setup do
      %{name: "fred"}
    end

    test "equal will generate search criteria" do
      sc = ~f(name = fred)

      assert sc.field == :name
      assert sc.criteria == :=
      assert sc.value == "fred"
    end

    test "not_equal will generate search criteria" do
      sc = ~f(name != fred)

      assert sc.field == :name
      assert sc.criteria == :!=
      assert sc.value == "fred"
    end

    test "greater_than will generate search criteria" do
      sc = ~f(name > fred)

      assert sc.field == :name
      assert sc.criteria == :>
      assert sc.value == "fred"
    end

    test "less_than will generate search criteria" do
      sc = ~f(name < fred)

      assert sc.field == :name
      assert sc.criteria == :<
      assert sc.value == "fred"
    end

    test "greater_equal will generate search criteria" do
      sc = ~f(name >= fred)

      assert sc.field == :name
      assert sc.criteria == :>=
      assert sc.value == "fred"
    end

    test "less_equal will generate search criteria" do
      sc = ~f(name <= fred)

      assert sc.field == :name
      assert sc.criteria == :<=
      assert sc.value == "fred"
    end

    test "like will generate search criteria" do
      sc = ~f(name like fred)

      assert sc.field == :name
      assert sc.criteria == :like
      assert sc.value == "fred"
    end

    test "not_like will generate search criteria" do
      sc = ~f(name not like fred)

      assert sc.field == :name
      assert sc.criteria == :not_like
      assert sc.value == "fred"
    end

    test "part_of will generate search criteria" do
      sc = ~f(name in fred,me)

      assert sc.field == :name
      assert sc.criteria == :in
      assert sc.value == ["fred,me"]
    end

    test "part_of will generate search criteria in list" do
      sc = ~f(name in [fred,me])

      assert sc.field == :name
      assert sc.criteria == :in
      assert sc.value == ["fred", "me"]
    end

    test "not_part_of will generate search criteria" do
      sc = ~f(name not in fred,me)

      assert sc.field == :name
      assert sc.criteria == :not_in
      assert sc.value == ["fred,me"]
    end

    test "not_part_of will generate search criteria in list" do
      sc = ~f(name not in [fred,me])

      assert sc.field == :name
      assert sc.criteria == :not_in
      assert sc.value == ["fred", "me"]
    end

    test "nil? will generate search criteria" do
      sc = ~f(name is nil)

      assert sc.field == :name
      assert sc.criteria == :is_null
      assert sc.value == nil
    end

    test "not_nil? will generate search criteria" do
      sc = ~f(name is not nil)

      assert sc.field == :name
      assert sc.criteria == :not_null
      assert sc.value == nil
    end
  end
end
