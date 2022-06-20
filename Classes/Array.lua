local Array = {}

function Array.map(tabla, callback)
    local NewArray = {};
    for index, value in pairs(tabla) do
      local element = value;
      value = callback(element, index);
    end

    return NewArray;
end

function Array.split(string, pattern)
  local listSplit = {}

  for char in string.gmatch(string, "[^"..pattern.."]*") do
    if not char == "" then
      table.insert(listSplit, char);
    end
  end

  return listSplit;
end


function Array.pprint(tabla)
    assert(type(tabla) == "table", string.format("This argument no is a table or list values.", tabla));

    local function convert_string(value, index, iden)
      iden = iden or 0;
      local rp = string.rep;
      local fm = string.format;
      local toString = rp(" ", iden);

      if index then
        local RegExp = type(index) == "string" and '["%s"] = ' or '[%s] = ';
        toString = toString..fm(RegExp, index);
      end

      if type(value) == "string" then
        toString = toString..fm('%q', value);
      elseif type(value) == "number" then
        toString = toString..tostring(value);
      elseif type(value) == "boolean" then
        toString = toString..tostring(value);
      elseif type(value) == "table" then
        if #value > -1 then
          toString = toString.."{\n";

          for i, v in pairs(value) do
            toString = toString..convert_string(v, i, iden + 4) .. ",\n";
          end

          toString = toString..rp(" ", iden).."}";
        else
          toString = toString.."{}";
        end
      else
        toString = toString..typeof(value);
      end

      return toString;
    end

    local parse = convert_string(tabla) print(parse);
    return parse;
end

--Add Global Table New Methods
do
  local methodStatic = table
  for key, value in pairs(methodStatic) do
    Array[key] = value;
  end
  
  local __env = syn and getgenv() or warn("Error: Not found a method get enviroment!")
  __env.table = Array

  warn("Enviromment table loaded.");
end

return Array
