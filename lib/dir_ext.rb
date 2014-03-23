module DirExt

  def delete_dir(path)

    if FileTest.directory?(path) then
      Dir.foreach(path) do |file|
        next if /^\.+$/ =~ file
        delete_dir( path.sub(/\/+$/,"") + "/" + file )
      end
      Dir.rmdir(path) rescue ""
    else
      File.delete(path)
    end

  end

  module_function :delete_dir
end
