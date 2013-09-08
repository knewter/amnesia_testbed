Code.require_file "../test_helper.exs", __FILE__

use Amnesia

defdatabase Dwitter.Database do
  deftable Dweet, [:id, :content], type: :ordered_set do
    @type t :: Dweet[id: integer, content: String.t]
  end
end

defmodule AmnesiaTestbedTest do
  use ExUnit.Case
  use Dwitter.Database

  test "type checking" do
    assert Dweet.ordered_set?
  end

  test "saving items" do
    Amnesia.transaction! do
      dweet = Dweet[id: 1, content: 'some things happened.']
      dweet.write
    end

    assert 'some things happened.' == Dweet.read!(1).content
  end

  setup_all do
    Amnesia.Test.start
  end

  teardown_all do
    Amnesia.Test.stop
  end

  setup do
    Dwitter.Database.create!

    :ok
  end

  teardown do
    Dwitter.Database.destroy

    :ok
  end
end
