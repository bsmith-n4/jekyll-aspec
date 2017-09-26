require "asciidoctor/extensions" unless RUBY_ENGINE == "opal"

include ::Asciidoctor

# @example Delimited Requirement Block with Title
#   .My Requirement
#   [req,id=RA-1,version=1]
#   --
#   Contents of the requirement
#   --
class RequirementBlock < Extensions::BlockProcessor
  use_dsl
  named :req
  on_contexts :open, :paragraph, :example, :listing, :sidebar, :pass
  name_positional_attributes "number", "version"

  # Read the parent attributes and create a Requirement Admonition block
  def process parent, reader, attrs
    # Add pass characters here to prevent html character replacements for < > tags
    pass = "+++"
    attrs["name"] = "requirement"
    attrs["caption"] = "Requirement: "
    id = attrs["id"]
    nl = ""

    begin
      # downcase the title and replace spaces with underscores.
      # @todo use utility methods here?
      downcased_title = attrs["title"].downcase.tr(" ", "_").gsub('"', "&quot;")
      san_title = attrs["title"].gsub(/&/, "&amp;")
    rescue Exception => msg
      # puts msg
      # If no title exists on the Req block, throw an exception
      warn %(asciidoctor: WARNING: Requirement block title missing)
    end

    alt = %(
    <div class=\"panel panel-primary\">
      <div class=\"panel-heading\">
        <h3 class=\"panel-title\">
          <a class=\"anchor\" href=\"##{id}\"></a>
          <a class=\"link\" href=\"##{id}\"><emphasis role=\"strong\">Requirement: #{id}:</emphasis> #{san_title} </a> (ver. #{attrs['version']})
        </h3>
      </div>
      <div class=\"panel-body\">)

    close = "</div></div>"

    # concatenate all generated lines and prepend before the original content
    concat_lines = reader.lines.unshift(pass, alt, pass, nl)
    concat_lines.push(nl, pass, close, pass)

    # @todo use a regular pass block in this instance
    create_block parent, :admonition, concat_lines, attrs, content_model: :compound
  end
end
