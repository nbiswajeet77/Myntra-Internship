function put_data(rec, end_time, object_data, modified_at)
  local targeted_cards_pb = require "targeted_cards_pb"

  -- Serialize Example
  local msg = targeted_cards_pb.TargetedCardInfo()
  -- msg.style_ids = {1,2,3}
  msg.end_time = end_time
  msg.object_data = object_data
  msg.modified_at = modified_at
  -- msg.children = {'a','b','c'}
  local pb_data = msg:SerializeToString()
  local pb_bytes = bytes(pb_data:len())
  bytes.set_type(pb_bytes, 4)
  bytes.set_string(pb_bytes, 1, pb_data)
  rec["store_details"] = pb_bytes
  if aerospike:exists(rec) then
    aerospike:update(rec)
  else
    aerospike:create(rec)
  end
end

function check_expiry(rec)
  names = record.bin_names(rec)
  for i, name in ipairs(names) do
    local binname = tostring(name)
    local targeted_cards_pb = require "targeted_cards_pb"
    local pb_bytes = rec[binname]
    local pb_data = bytes.get_string(pb_bytes, 1, bytes.size(pb_bytes))
    local msg = targeted_cards_pb.TargetedCardInfo()
    msg:ParseFromString(pb_data)
    nowTimestamp = os.time(os.date('*t'))
    rec[binname] = nil
    if(msg.end_time<nowTimestamp and msg.end_time ~= -1)
      then aerospike:update(rec)
    end
  end
end

function is_bytes(rec, bin)
  local t = rec[bin]
  return getmetatable(t) == getmetatable(bytes())
end
