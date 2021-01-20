# frozen_string_literal: true

class Lists::Grid::Card::Component < ApplicationComponent
  def initialize(user:, list:)
    @list = list
    @user = user
  end

  def count_color(solved_count, count)
    return "rgb(108, 117, 125)" if count == 0

    red = [220, 53, 69]
    green = [25, 135, 84]

    color_difference = red.zip(green).map { |v| v[0] - v[1] }

    percentage_solved = solved_count / count.to_f

    color = red.zip(color_difference).map { |v| (v[0] - percentage_solved * v[1]).to_i }

    "rgb(#{color[0]}, #{color[1]}, #{color[2]})"
  end

  def solved_count
    solved_exercises = @user.solved_exercises
    @list.exercises.count { |exercise| solved_exercises.any?(exercise) }
  end

  def exercises_count
    @list.exercises.count
  end
end
