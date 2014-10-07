# module Jekyll
#   class ArchivesGenerator < Generator
#     def generate(site)
#       years = {}
#       site.posts.each do |post|
#         if years.has_key?(post.date.year)
#           years[post.date.year] << {"url"=>post.url, "title"=>post.title}
#         else
#           years[post.date.year] = [{"url"=>post.url, "title"=>post.title}]
#         end
#       end

#       site.pages <<  ArchivesPage.new(site, site.source, "archives", "index.html", years)
#     end
#   end

module Jekyll
    class TutorialsIndexGenerator < Generator
        safe true
        priority :normal
        def generate(site)

            tutorials = {}
            cnt = 0

            Dir["tutorials/**/*.md"].each do |this_tutorial_path|
                front_matter = YAML.load(File.read(this_tutorial_path))
                tutorials[cnt] = front_matter
                tutorials[cnt]["url"] = File.join("tutorials",File.basename(File.dirname(this_tutorial_path)))
                cnt = cnt + 1
            end
            site.pages << TutorialsIndexPage.new(site, site.source, "/", "tutorials.html", tutorials)
        end
    end

    class TutorialsIndexPage < Page
        def initialize(site, base, dir, name, tutorials)
            super(site, base, dir, name)
            self.data['projects'] = tutorials
        end
    end
end
