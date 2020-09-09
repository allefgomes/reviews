module ResultsHelper
  def decimal_round(number)
    return 0 if number.nil?

    number.to_f.round(1)
  end
end
