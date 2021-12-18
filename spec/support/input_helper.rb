# frozen_string_literal: true

module InputHelper
  def read(name)
    path = File.expand_path("../input/#{name}.txt", __dir__)

    File.read(path)
  end
end
