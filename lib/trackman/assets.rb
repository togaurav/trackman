module Trackman
  module Assets
    
    #TODO do something better than this to share the scope
    def self.autoloads path, items
      items.each do |s|
        if block_given? 
          yield(s, "#{path}/#{s.trackman_underscore}" ) 
        else
          autoload s, "#{path}/#{s.trackman_underscore}" 
        end
      end
    end

    @@classes = [:Asset, :HtmlAsset, :RemoteAsset, :CssAsset]
    @@modules = [:Components, :Errors]

    autoloads 'trackman/assets', @@classes.concat(@@modules)
  end
end