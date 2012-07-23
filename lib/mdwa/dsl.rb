# -*- encoding : utf-8 -*-
require 'mdwa/dsl/entities'
require 'mdwa/dsl/users'

module MDWA
  module DSL
    
    autoload :Entity, 'mdwa/dsl/entity'
    autoload :EntityAttribute, 'mdwa/dsl/entity_attribute'
    autoload :EntityAssociation, 'mdwa/dsl/entity_association'
    autoload :EntityActions, 'mdwa/dsl/entity_actions'
    autoload :EntitySpecification, 'mdwa/dsl/entity_specification'
    autoload :Action, 'mdwa/dsl/action'
    autoload :User, 'mdwa/dsl/user'
    
    STRUCTURAL_PATH   = 'app/mdwa/structure/'
    USERS_PATH        = 'app/mdwa/users/'
    WORKFLOW_PATH     = 'app/mdwa/workflow/'
    REQUIREMENTS_PATH = 'app/mdwa/requirements'
    
  end
end