# gem 'activesupport', '2.3.5'

begin
  require 'active_support/core_ext/object/blank' # newer versions of active_support (>= 3.0)
rescue LoadError => e
  require 'active_support/all' # support older versions of active_support (<= 2.3.5)
end
require 'forwardable'

lib_path = File.expand_path('../validatable/', __FILE__)

require File.join(lib_path, 'object_extension')
require File.join(lib_path, 'errors')
require File.join(lib_path, 'validatable_class_methods')
require File.join(lib_path, 'macros')
require File.join(lib_path, 'validatable_instance_methods')
require File.join(lib_path, 'included_validation')
require File.join(lib_path, 'child_validation')
require File.join(lib_path, 'understandable')
require File.join(lib_path, 'requireable')
require File.join(lib_path, 'validations/validation_base')
require File.join(lib_path, 'validations/validates_format_of')
require File.join(lib_path, 'validations/validates_presence_of')
require File.join(lib_path, 'validations/validates_acceptance_of')
require File.join(lib_path, 'validations/validates_confirmation_of')
require File.join(lib_path, 'validations/validates_length_of')
require File.join(lib_path, 'validations/validates_true_for')
require File.join(lib_path, 'validations/validates_numericality_of')
require File.join(lib_path, 'validations/validates_exclusion_of')
require File.join(lib_path, 'validations/validates_inclusion_of')
require File.join(lib_path, 'validations/validates_each')
require File.join(lib_path, 'validations/validates_associated')

module Validatable
  Version = '1.8.4'
end
