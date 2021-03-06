module Jekyll
    class FileExistsTag < Liquid::Tag
        
        def initialize(tag_name, path, tokens)
            super
            @path = path
        end

        def render(context)

            # ref https://gist.github.com/vanto/1455726
            # pipe param through liquid to make additional replacements possible
            # url = Liquid::Template.parse(@text).render context
 
            # this returns true
            "#{File.exist?(@path.strip!)}"
            
            # this returns false
            # "#{@text} #{File.exist?("images/reference_designs/page-detail-this-does-not-exist.png")}"
            
            # some suggestion on twitter to use pathname
            # "#{@text} #{Pathname.exists?(filename) ? filename : 'not-found-of-zoiets'}"
        end
    end
end

Liquid::Template.register_tag('file_exists', Jekyll::FileExistsTag)
