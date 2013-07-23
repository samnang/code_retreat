require 'minitest/autorun'
require 'minitest/pride'
require_relative 'simulator'
require_relative 'robot'

class RobotTurningTest < MiniTest::Unit::TestCase

  def robot
    @robot
  end

  def setup
    @robot = Robot.new
  end

  def test_robot_bearing
    [:east, :west, :north, :south].each do |direction|
      robot.orient(direction)
      assert_equal direction, robot.bearing
    end
  end

  def test_invalid_robot_bearing
    assert_raises ArgumentError do
      robot.orient(:crood)
    end
  end

  def test_turn_right_from_north
    robot.orient(:north)
    robot.turn_right
    assert_equal :east, robot.bearing
  end

  def test_turn_right_from_east
    robot.orient(:east)
    robot.turn_right
    assert_equal :south, robot.bearing
  end

  def test_turn_right_from_south
    robot.orient(:south)
    robot.turn_right
    assert_equal :west, robot.bearing
  end

  def test_turn_right_from_west
    robot.orient(:west)
    robot.turn_right
    assert_equal :north, robot.bearing
 end

  def test_turn_left_from_north
    robot.orient(:north)
    robot.turn_left
    assert_equal :west, robot.bearing
  end

  def test_turn_left_from_east
    robot.orient(:east)
    robot.turn_left
    assert_equal :north, robot.bearing
  end

  def test_turn_left_from_south
    robot.orient(:south)
    robot.turn_left
    assert_equal :east, robot.bearing
  end

  def test_turn_left_from_west
    robot.orient(:west)
    robot.turn_left
    assert_equal :south, robot.bearing
  end

  def test_robot_coordinates
    skip
    robot.at(3, 0)
    assert_equal [3, 0], robot.coordinates
  end

  def test_other_robot_coordinates
    skip
    robot.at(-2, 5)
    assert_equal [-2, 5], robot.coordinates
  end

  def test_advance_when_facing_north
    skip
    robot.at(0,0)
    robot.orient(:north)
    robot.advance
    assert_equal [0, 1], robot.coordinates
  end

  def test_advance_when_facing_east
    skip
    # Implement me
  end

  def test_advance_when_facing_south
    skip
    # Implement me
  end

  def test_advance_when_facing_west
    skip
    # Implement me
  end
end

class RobotSimulatorTest < MiniTest::Unit::TestCase
  def simulator
    @simulator ||= Simulator.new
  end

  def test_instructions_for_turning_left
    skip
    assert_equal [:turn_left], simulator.instructions("L")
  end

  def test_instructions_for_turning_right
    skip
    # Implement me
  end

  def test_instructions_for_advancing
    skip
    # Implement me
  end

  def test_series_of_instructions
    skip
    commands = [:turn_right, :advance, :advance, :turn_left]
    assert_equal commands, simulator.instructions("RAAL")
  end

  def test_instruct_robot
    skip
    robot = Robot.new
    simulator.place(robot, x: -2, y: 1, direction: :east)
    simulator.evaluate(robot, "RLAALAL")
    assert_equal [0,2], robot.coordinates
    # Also check the robot bearing
  end

  def test_instruct_many_robots
    skip
    robot1 = Robot.new
    robot2 = Robot.new
    robot3 = Robot.new
    simulator.place(robot1, x: 0, y: 0, direction: :north)
    simulator.place(robot2, x: 2, y: -7, direction: :east)
    simulator.place(robot3, x: 8, y: 4, direction: :south)
    simulator.evaluate(robot1, "LAAARALA")
    simulator.evaluate(robot2, "RRAAAAALA")
    simulator.evaluate(robot3, "LAAARRRALLLL")

    # Check Robot 1 coordinates and bearing
    # Check Robot 2 coordinates and bearing
    # Check Robot 3 coordinates and bearing
  end
end

