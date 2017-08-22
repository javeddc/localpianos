module PianosHelper
  def capitalize_all(str)
    arr = str.split(" ").each do |word|
      word.capitalize
    end
    arr.join(" ")
  end
  # helper_method :capitalize_all
end
