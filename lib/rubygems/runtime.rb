module Gem
  class Runtime
    def activate_gem(gem_name, *version_requirements)
      if sk = ENV['GEM_SKIP']
        if sk.split(/:/).include? gem_name
          raise Gem::LoadError, "skipping #{gem_name}"
        end
      end

      Gem.activate(gem_name, *version_requirements)
    end

    def activate_from_path(path)
      begin
        gem_original_require path
      rescue ::LoadError => load_error
        this_path = (load_error.message =~ /#{Regexp.escape path}\z/)

        if this_path and spec = Gem.searcher.find(path)
          Gem.activate(spec.name, "= #{spec.version}")
          gem_original_require path
        else
          raise load_error
        end
      end
    end
  end
end
