module Dbla
  module Document
    # accessors for reading attribute
    def [] *args
      if args.first && args.first.to_s.index('.')
        keys = args.first.to_s.split('.')
        r = keys.inject(_source) do |m,key|
          # Array() has a special behavior we do not want for hashes
          m = (m.is_a? Array) ? m : [m]
            m.inject([]) do |m2, a|
            if (a.respond_to? :[])
              r = a.send :[], *(args[1..-1].unshift(key))
              if r
                # Array() has a special behavior we do not want for hashes
                r = (r.is_a? Array) ? r : [r]
                m2 += r
              else
                m2
              end
            else
              m2
            end
          end
        end
        r.blank? ? nil : r
      else
        _source.send :[], *args
      end
    end
    def fetch(field, default)
      (r = self[field]).blank? ? default : r
    end
    def has? f, *values
      if values.empty?
        !self[f].blank?
      else
        !(self[f] & values).blank?
      end
    end
  end
end