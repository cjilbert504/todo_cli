require "test/unit"
require "mocha/test_unit"
require "todo"

class TaskTest < Test::Unit::TestCase
  include Todo

  def test_raises_error_when_no_tasks
    File.stubs(:open).yields("")
    ex = assert_raises RuntimeError do
      new_task("foo.txt", [])
    end

    expected = "You must provide tasks on the command-line or standard input"
    assert_equal expected, ex.message
  end

  def test_proper_working
    string_io = StringIO.new
    File.stubs(:open).yields(string_io)

    new_task("foo.txt", ["This is a task"])
    assert_match /^This is a task,/, string_io.string
  end

  def test_cannot_open_file
    ex_msg = "Operation not permitted"
    File.stubs(:open).raises(Errno::EPERM.new(ex_msg))
    ex = assert_raises RuntimeError do
      new_task("foo.txt", ["This is a task"])
    end

    assert_match /^Couldn't open foo.txt for appending: #{ex_msg}/, ex.message
  end

  def teardown
    File.unstub(:open)
  end
end
