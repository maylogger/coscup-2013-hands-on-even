module ViewHelpers

  # capture for slim
  def capture_slim(&block)
    old_buffer = eval  "_buf", block.binding
    eval  "origin_buf,_buf=_buf,[]", block.binding
    capture_content = yield.to_s
    eval  "_buf=origin_buf", block.binding
    capture_content
  ensure
    eval  "_buf=origin_buf", block.binding
  end

end
