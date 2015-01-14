def proc_method(proker)
  proker.call
end

proker = Proc.new{ puts 'Sushant' }
proc_method(proker)
