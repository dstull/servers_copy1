module Hosts
  class BulkAdd < ActiveType::Object
    # NOTE: this uses the 'active_type' gem
    # it makes a class quack like an ActiveRecord type object w/o a backing table
    # typically we call '.save' on instances of this object and it triggers
    # callback like 'before_save' to do the work
  end
end