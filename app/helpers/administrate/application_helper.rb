module Administrate
  module ApplicationHelper
    PLURAL_MANY_COUNT = 2.1

    def render_field(field, locals = {})
      locals.merge!(field: field)
      render locals: locals, partial: field.to_partial_path
    end

    def class_from_resource(resource_name)
      resource_name.to_s.classify.constantize
    end

    # Modifed b
    def display_resource_name(resource_name, count=0)
      if default = count == 0
        return resource_name.to_s.classify.constantize.model_name.human(count: count, default: default)
      else
        resource_name.to_s.classify.constantize.model_name.human
      end
    end

    def sort_order(order)
      case order
      when "asc" then "ascending"
      when "desc" then "descending"
      else "none"
      end
    end

    def resource_index_route_key(resource_name)
      ActiveModel::Naming.route_key(class_from_resource(resource_name))
    end

    def sanitized_order_params
      params.permit(:search, :id, :order, :page, :per_page, :direction, :orders)
    end

    def clear_search_params
      params.except(:search, :page).permit(:order, :direction, :per_page)
    end
  end
end
