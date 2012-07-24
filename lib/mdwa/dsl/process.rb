# -*- encoding : utf-8 -*-
module MDWA
  module DSL
    
    class Process
      attr_accessor :description, :alias, :details, :start_for_roles
      
      def initialize(description) 
        self.description      = description
        
        # Hash: [detail_alias] => ProcessDetail object
        self.details          = {}
        # Hash: [role_alias] => ProcessDetail object
        self.start_for_roles  = {}
      end
      
      def alias
        @alias ||= self.description.gsub(' ', '_').underscore
      end
      
      def start_for(role, detail_alias)
        start_for_roles[role] = details[detail_alias]
      end
      
      def detail(description)
        detail = ProcessDetail.new(self, description)
        yield(detail) if block_given?
        self.details[detail.alias] = detail
      end
      
      # 
      # Return the ProcessDetail based on alias, or entity and action.
      # Params:
      # :alias => detail alias
      # :entity
      # :action
      def process_detail(options = {})
        detail = self.details[options[:alias]] unless options[:alias].blank?
        if detail.nil?
          self.details.values.each do |d|
            if( d.detail_action.entity == options[:entity] and d.detail_action.action == options[:action] )
              detail = d
              break
            end
          end
        end
        return detail
      end
      
    end
    
  end # dsl
end # mdwa
