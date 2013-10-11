module PresentationsHelper

	def output_content(content)
		if content.content_type.name == "Image"
			"<img src='#{content.body}' />".html_safe
		else
			content.body.html_safe
		end
	end
end
