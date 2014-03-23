module MapsHelper

  def make_tree( maps )

    list = []
    maps.each do |map|
      map_arr = map.split("/")
      map_arr.delete_at(0)
      map_arr.delete_at(0)
      c = map_arr.count
      d = { "name" => map_arr[c-1], "col" => c, "full" => "/"+map_arr.join('/') }
      list << d
    end
    list

  end

  def get_max_col( lists )

    max = 0
    lists.each do |list|
      if list["col"] > max
        max = list["col"]
      end
    end
    max

  end

  def make_col_front(max, list)

    buf = ""
    (list["col"]).times do |i|
      if i + 1 == list["col"]
        buf += "<td>├</td>"
      else
        buf += "<td></td>"
      end
    end
    buf

  end

  def make_col_back(max, list)
    buf = ""
    (max - list["col"]).times do
      buf += "<td></td>"
    end
    buf
  end

end
