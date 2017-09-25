require_relative "extensions/html_postprocessor"
require_relative "extensions/autoxrefs"
require_relative "extensions/inline_callout_macro"
require_relative "extensions/inline_cwiki_macro"
require_relative "extensions/inline_repo_macro"
require_relative "extensions/inline_task_macro"
require_relative "extensions/req_preprocessor"
require_relative "extensions/req_refs"
require_relative "extensions/requirement_appendix"
require_relative "extensions/requirement_block"
require_relative "extensions/todo_block"

require "jekyll_aspec/version"

Extensions.register do
  block TodoBlock
end
