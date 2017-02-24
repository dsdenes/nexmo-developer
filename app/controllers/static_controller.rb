class StaticController < ApplicationController
  def landing
    @navigation = :documentation
    render layout: 'landing'
  end

  def tools
    @navigation = :tools
  end

  def community
    @navigation = :community
    @upcoming_events = Event.upcoming
  end

  def styleguide
    # Read document
    document = File.read("#{Rails.root}/app/views/static/styleguide.md")

    # Parse frontmatter
    @frontmatter = YAML.load(document)

    @title = @frontmatter["title"]

    @content = MarkdownPipeline.new.call(document)

    render layout: 'documentation'
  end
end
