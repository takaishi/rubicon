def __main__(argv)
  case
    when argv[1] == "version"
      puts "v#{Rubicon::VERSION}"
    when argv[1] == "start"
      conf_dir = argv[2]
      Dir.open(File.expand_path(conf_dir)).each do |file|
        if file =~ /.*.rb/
          f = File.open("#{File.expand_path(conf_dir)}/#{file}")
          r = f.read
          eval(r)
        end
      end
      Rubicon::Watcher.start
    else
      puts "Hello World"
  end
end
