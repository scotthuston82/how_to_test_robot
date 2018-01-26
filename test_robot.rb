require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot = Robot.new

    # act
    robot.needs_repairs=(true)
    robot.foreign_model=(true)
    # assert
    assert_equal(1, robot.station)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    robot2 = Robot.new
    # act
    robot2.vintage_model=(true)
    robot2.needs_repairs=(true)
    # assert
    assert_equal(2, robot2.station)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    robot3 = Robot.new
    # act
    robot3.needs_repairs=(true)
    # assert
    assert_equal(3, robot3.station)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    robot4 = Robot.new
    # act

    # assert
    assert_equal(4, robot4.station)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    robot5 = Robot.new
    # act

    # assert
    assert_equal(-1, robot5.prioritize_tasks)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot6 = Robot.new

    # act
    robot6.todos = [3,5,8]
    # assert
    assert_equal(8, robot6.prioritize_tasks)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    robot7 = Robot.new
    # act
    robot7.day_off = true

    # assert
    assert_equal(false, robot7.workday?(robot7.day_off))
  end

  def test_workday_not_day_off_returns_true


    # arrange
    robot8 = Robot.new
    # act
    robot8.day_off = false
    # assert
    assert_equal(true, robot8.workday?(true))
  end

end
