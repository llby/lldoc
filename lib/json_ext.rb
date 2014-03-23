module JsonExt

  def json_to_arr(maps, key)

p "key = #{key}"
p "maps = #{maps}"

    res = []
    if maps.instance_of?(Hash)

      res = []
      maps.each do |k, v|
        res << "#{key}/#{k}"
        res += json_to_arr(v, "#{key}/#{k}")
      end

    elsif maps.instance_of?(Array)

      maps.each do |m|
        res += json_to_arr(m, key)
      end
    elsif maps.instance_of?(String)
      res << "#{key}/#{maps}"
    end
    res

  end


  def arr_to_hash(arr)

    res = {}
    if arr.count > 0
      key = arr.shift
      res = { key.to_s => arr_to_hash(arr) }
    else
      res = ""
    end
    res

  end


  def mkdir(src, dst, name)

p "src = #{src}"
p "dst = #{dst}"
p "name = #{name}"

      dst.each do |key, val|
        if val == ""

          if src == key
            # 文字列なので、まだhashではない
            src = {key => name}
          elsif src[key].present?
            # 元々hashだった場合は追加
            src[key] << name
          else
            # キーが違う場合は流す
          end

        elsif src[key].instance_of?(Array)

          src[key].each_with_index do |arr, i|
            src[key][i] = mkdir(arr, val, name)
          end

        elsif src[key].present?
          src[key] = mkdir(src[key], val, name)
        end
      end
      src

  end

  module_function :json_to_arr
  module_function :arr_to_hash
  module_function :mkdir
end


# index
#    j = File.read("#{DEFAULT_PATH}/paths.json")
#    @paths = JSON.parse(j)
#    @maps = JsonExt.json_to_arr(@paths, "").map{ |m| "var/1#{m}" }


# mkdir
#    name = "test"
#    path = "src/adm"
#    path_arr = path.split("/")
#    path_arr = JsonExt.arr_to_hash(path_arr)
#    j = File.read("#{DEFAULT_PATH}/paths.json")
#    @paths = JSON.parse(j)
#    @paths = JsonExt.mkdir(@paths, path_arr, "test")
#    File.open("#{DEFAULT_PATH}/paths.json", 'w'){|f|
#      f.write @paths.to_json
#    }

