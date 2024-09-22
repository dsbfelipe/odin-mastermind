class MasterCode
  def initialize
    @colors = %w[blue yellow green purple orange purple]
    @code = []
  end

  attr_accessor :colors, :code

  def randomize_code
    for i in 0..3 do
      code.push(colors[rand(0..5)])
    end
    code
  end
end
