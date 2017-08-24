module PianosHelper
  def capitalize_all(str)
    result_arr = []
    arr = str.split(" ").each do |word|
      result_arr.push word.capitalize
    end
    result_arr.join(" ")
  end

end
