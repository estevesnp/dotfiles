local M = {}

M.SHELL = "com.superlogical.terminal.shell"

---@param label string
---@return string | nil session_id
---@return string | nil error
function M.get_session_id(label)
  local session_list, err = rex.call("session.list")
  if not session_list then
    return nil, err
  end
  for _, session in ipairs(session_list.sessions or {}) do
    if session.label == label then
      return session.session_id, nil
    end
  end
  return nil, nil
end

return M
