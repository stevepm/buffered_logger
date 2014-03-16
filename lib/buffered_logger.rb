require 'date'
require 'time'

class BufferedLogger
  attr_accessor :log_counter

  def initialize(file)
    @file = file
    @log_counter = 0
    @logs_array = []
  end

  def log(string)
    file = File.open(@file,'a+')
    self.log_counter += 1
    @logs_array << string + " " + Time.now.strftime("%Y %m %d %H:%M:%S:%L")
    if @log_counter == 5
      @logs_array.each do |string|
        file.write("#{string}\n")
      end
      file.close
      self.log_counter = 0
      @logs_array = []
    end

  end

end