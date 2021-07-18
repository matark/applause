module Nanoid
  module Model
    extend ActiveSupport::Concern

    included do
      before_create do
        self.nanoid = Nanoid.generate
      end
    end
  end
end
